/**
 * Set the correct selector given the element and the param values
 *
 * @params      element     The url for the section to open (active page)
 * @params      param       The name of the section
 *
 *      Example:        raw_tag_params  = "~grid:header|Timestamp"
 *                      raw_tag_params  = "~grid:row|5"
 *
 *                      section         = "~grid"
 *                      element         = "header" ,   "row"
 *                      param           = "Timestamp", "5"
 */

module.exports = (element, param) => {

    let selector = "";

    if (param == "error") {
        selector = '[data-bo="' + element + '"] .validation-invalid';
    } else {
        selector = '[data-bo="' + element + '"] .ipv4-cell-' + param;
    }

    return selector;
};
