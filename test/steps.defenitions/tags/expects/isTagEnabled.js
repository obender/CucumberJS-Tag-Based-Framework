/**
 * Check whether the <tag_name> is Enabled/Disabled on the current page
 *
 * @param  {String}   data_bo               The name of the tag (ex: "API Details Allow")
 * @param  {String}   enabled_or_disabled   "enabled" or "disabled"
 *
 */

import tag from '../selectors/tag';

module.exports = (data_bo, enabled_or_disabled) => {
    let errorMsg = `isTagEnabled : BO:${data_bo} | enabled_or_disabled:${enabled_or_disabled}`;
    try {

        let selector = tag(data_bo);
        browser.waitForNoOverlay();

        let is_enabled = browser.isEnabled(selector);
        let expectedResult = null;

        if (enabled_or_disabled === 'enabled')
            expectedResult = true;
        else if (enabled_or_disabled === 'disabled')
            expectedResult = false;
        errorMsg = `Error - expect ${data_bo} Enable to be ${expectedResult} BUT instead, got ${is_enabled}`;
        expect(expectedResult).to.equal(is_enabled, errorMsg);
    }
    catch (err) {
        throw new Error(errorMsg + '\n' + err);
    }
};
