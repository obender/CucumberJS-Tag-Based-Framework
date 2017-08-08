const path = require('path'),
    karmaServer = require('karma').Server;

module.exports = function () {
    return function (done) {
        let karma = new karmaServer({
            configFile: path.join(__dirname, './../../test/karma.conf.js'),
            singleRun: true
        }, exitCode => {
            if (exitCode === 0) {
                done();
                process.exit(0);
            } else {
                process.exit(exitCode);
            }
        }).start();
    }
};
