/**
 * Click <data-bo> Button
 *
 * @param  {String}   raw_tag_params    can be bo or a description of an element and value
 *
 *              Example:    raw_tag_params  = "~grid:header|Timestamp"
 *                          raw_tag_params  = "~grid:menuText|IP Address"
 */

import tag from '../selectors/tag';

module.exports = (approveOrReject) => {

    if (approveOrReject == "approve")
        browser.alertAccept();
    else
        browser.alertDismiss();
};
