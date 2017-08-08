/**
 * Check whether the <tag_name> is displayed on the current page
 *
 * @param  {String}   tag_name     The name of the section (ex: "api-list")
 */

import tag from '../selectors/tag';

module.exports = (data_bo, negate, mode) => {
    try {
        browser.waitForNoOverlay();
        let selector = tag(data_bo);
        if (typeof selector === "string") {
            if (negate) {
                browser.waitUntil(function () {
                    return (mode == "clickable" ? !browser.isVisible(selector) && !browser.isEnabled(selector) :
                        !browser.isExisting(selector));
                }, null, `The tag ${data_bo} was not supposed to be ${mode}, but was ${mode}`);
            } else {
                browser.waitUntil(function () {
                    return (mode == "clickable" ? browser.isVisible(selector) && browser.isEnabled(selector) :
                        browser.isExisting(selector));
                }, null, `The tag ${data_bo} was supposed to be ${mode}, but was not ${mode}`);
            }
        }
    } catch (error) {
        console.log(`The tag ${data_bo} [$('${selector}')] was not supposed to be ${mode}, but was ${mode}`);
    }
};
