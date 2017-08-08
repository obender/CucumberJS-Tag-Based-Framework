/**
 * Check whether the <tag_name> is displayed on the current page
 *
 * @param  {String}   tag_name     The name of the section (ex: "api-list")
 */

module.exports = (expectedText) => {

    if (typeof expectedText === "string") {
        browser.waitUntil(function () {
            var alertText = browser.alertText();
            return alertText && alertText.includes(expectedText);
        }, 3000, `Alert containing text "${expectedText}" is expected to be displayed, but actually did not appear`);
    }
    else {
        browser.waitUntil(function () {
            var alertText = browser.alertText();
            return alertText && alertText != "";
        }, 3000, `Alert is expected to be displayed, but actually did not appear`);
    }

};

