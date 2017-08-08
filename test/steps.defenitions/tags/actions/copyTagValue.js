/**
 * Sets the value of the tag (text-box) using the data-bo tag
 *
 * @param  {string}     text          what to write inside the text box
 * @param  {string}     tag_name      where to write the input text (data-bo's name)
 */

import tag from '../selectors/tag';
import setTagValue from './setTagValue';

module.exports = (dest_tag, src_tag) => {

    var src_value = "";

    //  copy the value of one tag to another tag
    //  special case is that the source selector is a function, in this case
    //  the value of the function is copied (instead of the selector's text)
    //
    var src_selector = tag(src_tag);
    if (typeof src_selector == "function") {
        src_value = src_selector();
    }
    else {
        browser.waitTillReady(src_selector);
        src_value = browser.getText(src_selector) || browser.getValue(src_selector) || '';
    }

    setTagValue(dest_tag, src_value);
};


