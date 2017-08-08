/**
 * Execute a postman collection
 *
 * @param  {String}   collectionName    The name of the postman collection to be executed
 * @param  {String}   folderName        The name of the folder in which the collection is in
 * @param  {String}   num_of_iterations The number of times to run the collection
 *
 */
const newman = require('newman'); // require newman in your project
import enviorment from './environment'

module.exports = (collectionName, folderName, num_of_iterations) => {
    //   unique id which can be used to identify this postman invocation
    let runDate = new Date();
    module.exports.runNumber = Math.round(runDate.getTime() / 1000);

    module.exports.getRunNumber = () => {
        return "" + module.exports.runNumber;
    };

    let errorMessage = "";
    let done = false;
    let iteration_count = 1;

    if (typeof num_of_iterations !== "function")
        iteration_count = parseInt(num_of_iterations);
    else
        iteration_count = 1;

    if (isNaN(iteration_count))
        iteration_count = 1;

    let env = enviorment(module.exports.runNumber);

    function checkCompletion(err, summary) {
        if (err) {
            errorMessage += `ERROR: ${err}\n`;
        }

        if (summary.run && summary.run.failures && summary.run.failures.length) {
            errorMessage += JSON.stringify(summary.run.failures, null, 4);
        }
        done = true;
    }

    try {
        newman.run({
            collection: require(`../../features/${folderName}/${collectionName}.postman_collection.json`),
            iterationCount: iteration_count,
            environment: env,
            insecure: true
        }).on('exception', function (err, summary) {
            checkCompletion(err, summary);
        }).on('done', function (err, summary) {
            checkCompletion(err, summary);
        });
    } catch (e) {
        errorMessage = e;
        done = true;
    }

    browser.waitUntil(() => {
        return done;
    });

    if (errorMessage === "") {
        console.log(`Postman collection: "${collectionName}" in folder "${folderName}" executed Successfully ${iteration_count} times`);
        browser.refresh();
    }
    else
        expect(errorMessage).to.equal("",
            `Postman collection: ${collectionName} \n\nFailed with Error: ${errorMessage}\nEnviorment: ${JSON.stringify(env, null, 4)}`);
};
