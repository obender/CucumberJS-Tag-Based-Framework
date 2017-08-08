import tag from '../tags/selectors/tag.js';
import errorLogger from '../lib/errorLog';
/**
 * Check if the relevant grid exist and / or wait for it to be loaded
 * @param  {String}   boName    Element business object name
 * @param  {Number}   rows      expected number of rows[(any|many|no|[\d]+)]
 */
module.exports = (boName, rows) => {
    function getCounterSelector() {
        let result;

        if (boName == "logs") {
            result = "#securityLog .infaTable-title-count";
        } else if (boName == "activity_logs") {
            result = "#activityLog .infaTable-title-count";
        } else {
            result = tag("~grid:rowsCounter");
        }
        return result;
    }
    try {
        let rowsCounterSelector = getCounterSelector();
        browser.waitTillReady(rowsCounterSelector);

        switch (rows) {
            case 'no':
                rows = 0;
                break;
            case 'any':
            case 'many':
                break;

            default:
                rows = parseInt(rows);
        }

        if (typeof rows === 'number')
            browser.waitSafely(function () {
                let text = browser.getText(rowsCounterSelector).replace(/\D/g, '');
                let recordsAmount = parseInt(text);
                return recordsAmount == rows;
            });
        else
            browser.waitSafely(function () {
                let text = browser.getText(rowsCounterSelector).replace(/\D/g, '');
                let recordsAmount = parseInt(text);
                return recordsAmount > 0;
            });

        let actualRows = parseInt(browser.getText(rowsCounterSelector).replace(/\D/g, ''));

        if (rows === 'any' || rows === 'many')
            expect((actualRows)).to.be.above(0, `Expecting the tag to contain '${rows}' rows, instead '${actualRows}' was found`);
        else
            expect((actualRows)).to.equal(parseInt(rows), `Expecting the tag to contain '${rows}' rows, instead '${actualRows}' was found`);

    } catch (error) {
        errorLogger(error);
    }
};
