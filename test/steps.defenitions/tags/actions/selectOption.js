/**
 * Sets the value of the tag (text-box) using the data-bo tag
 *
 * @param  {string}     text          what to write inside the text box
 * @param  {string}     tag_name      where to write the input text (data-bo's name)
 */

import tag from '../selectors/tag';

module.exports = (selectedValue, tag_name) => {
    let selector = tag(tag_name);
    browser.waitTillReady(selector);
    let result = {state: 'false'};
    try {
        result = browser.selectByVisibleText(selector, selectedValue);
    } catch (e) {
        console.log(e);
    }
    expect(result.state).to.equal('success',
        `expected to select: "${selectedValue}" in Tag: $('${selector}'), 
            actually I could not find/select it`);

};
