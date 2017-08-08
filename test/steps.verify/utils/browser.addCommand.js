let rowsInGrid = require('../../steps.defenitions/grid/rowsInGrid');

describe('Rule: browser.addCommand', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/textbox.html`);
    });

    it('waitSafely successful wait', () => {
        let finishTime = new Date();
        finishTime.setSeconds(finishTime.getSeconds() + 1);
        try {
            browser.waitSafely(function () {
                let now = new Date();
                return now.getTime() >= finishTime.getTime();
            });
            assert.ok(true);
        }
        catch (e) {
            assert.fail("waitSafely Shold not throw an Exception");
        }
    });

    it('waitSafely failed wait', () => {
        try {
            browser.waitSafely(function () {
                return false;
            }, 7, browser.options.waitforInterval);
            assert.ok(true);
        }
        catch (e) {
            assert.fail("waitSafely Shold not throw an Exception");
        }
    });


});
