/**
 * Click <data-bo> Button
 *
 * @param  {String}   raw_tag_params    can be bo or a description of an element and value
 *
 *              Example:    raw_tag_params  = "~grid:header|Timestamp"
 *                          raw_tag_params  = "~grid:menuText|IP Address"
 */

import focusPointAndClick from '../actions/focusPointAndClick';

module.exports = (raw_tag_params, textToClick) => {
    focusPointAndClick(raw_tag_params, raw_tag_params, textToClick)
};
