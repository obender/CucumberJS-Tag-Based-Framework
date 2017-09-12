/**
 * Click <data-bo> Button
 *
 * @param  {String}   raw_tag_params    can be bo or a description of an element and value
 *
 *              Example:    raw_tag_params  = "~grid:header|Timestamp"
 *                          raw_tag_params  = "~grid:menuText|IP Address"
 */
import tag from '../selectors/tag';

module.exports = (focusTag, clickTag, clickText) => {
    let error = null;
    let retryCount = 0;
    try {
        let focusSelector = tag(focusTag);
        error = `Error can't FOCUS on Tag -> ${focusTag} -> ${focusSelector}`;
        browser.waitTillReady(focusSelector);

        let clickSelector = tag(clickTag);

        if (typeof(clickText) === 'string') {
            clickText = String(clickText);
            error = `Error can't click on TEXT -> '${clickText}' focusSelector: ${focusSelector} clickSelector: ${clickSelector}`;
            browser.waitForNoOverlay();
            browser
                .moveToObject(focusSelector)
                .click(clickSelector)
                .execute(function (textToClick) {
                    return $('a:visible,input:visible').filter(function () {
                        return $(this).text().trim() === textToClick;
                    }).click();
                }, clickText.trim())
        } else {
            error = `Error can't click on TAG -> ${clickTag} -> ${clickSelector}`;
            browser.waitTillReady(clickSelector);
            browser
                .moveToObject(focusSelector)
                .click(clickSelector);
        }
    } catch (e) {
        if (typeof(clickText) === 'function')
            clickText = '';
        throw new Error(`focusTag:${focusTag} clickTag:${clickTag} clickText:${clickText} \nError:${error} \nException:${e}`);
    }
};
