/**
 * Sets the value of the tag (text-box) using the data-bo tag
 *
 * @param  {string}     text          what to write inside the text box
 * @param  {string}     tag_name      where to write the input text (data-bo's name)
 */

import tag from '../selectors/tag';

module.exports = (tag_name, text) => {
    let selector = tag(tag_name);
    browser.waitTillReady(selector);

    if (text) {
        if (browser.desiredCapabilities.browserName != "internet explorer")
            browser
                .clearElement(selector)
                .setValue(selector, text);
        else
            browser
                .clearElement(selector)
                .setValue(selector, [text, 'Tab']);

    } else {
        browser
            .clearElement(selector);
    }
};
