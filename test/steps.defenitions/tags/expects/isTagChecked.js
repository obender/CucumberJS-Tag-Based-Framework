/**
 * Check whether the <tag_name> is / is not checked on the current page
 *
 * @param  {String}   data_bo           The name of the tag (ex: "API Details Allow")
 * @param  {String}   is_or_isNot       "is" or "is not"
 *
 */

import tag from '../selectors/tag';

module.exports = (data_bo, is_or_isNot) => {
    let selector = tag(data_bo);
    browser.waitTillReady(selector);

    let is_selected = browser.isSelected(selector);
    let expectedResult = null;

    if (is_or_isNot == 'is')
        expectedResult = true;
    else if (is_or_isNot == 'is not')
        expectedResult = false;

    expect(expectedResult).to.equal(is_selected, `Error - expect that ${data_bo} is checked to be ${expectedResult}
                                        BUT instead, got ${is_selected}`);
};
