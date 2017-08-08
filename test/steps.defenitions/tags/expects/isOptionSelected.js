/**
 * Check whether the <tag_name> is displayed on the current page
 *
 * @param  {String}   tag_name     The name of the section (ex: "api-list")
 */

import tag from '../selectors/tag';

module.exports = (expected_value, data_bo) => {
    let selector = tag(data_bo);
    browser.waitTillReady(selector);
    let selected = null;
    try {
        browser.waitUntil(function () {
            selected = browser.getValue(selector);
            return (selected == expected_value);
        }, null, `The option '${expected_value}' is not selected in ${data_bo}, instead '${expected_value}' is selected`);
    } catch (e) {
        console.log(`The option '${expected_value}' is not selected in ${data_bo}, instead '${selected}' is selected`);
    }
};

