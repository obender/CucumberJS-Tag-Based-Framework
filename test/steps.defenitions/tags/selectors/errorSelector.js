/**
 * Set the correct selector given the element and param values
 *
 * @params      element     The url for the section to open (active page)
 * @params      param       The name of the section
 *
 *      Example:        raw_tag_params  = "~error:validation|Allow"
 *                      raw_tag_params  = "~error:message"
 *
 *                      section         = "~error"
 *                      element         = "validation" ,   "login"
 *                      param           = "Allow" (the data-bo next to the errorMessage)
 */

module.exports = (element, param) => {

    switch (element) {

        case 'validation':
            return `[data-bo="${param}"] ~ span > .validation-invalid`;
        case 'message':
            return `.error-message.inline-error-message`;
        default:
            throw `No element ${element} was found`;
    }
};
