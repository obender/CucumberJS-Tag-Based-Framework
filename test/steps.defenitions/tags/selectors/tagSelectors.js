/**
 * Check if the tag has a bo value or should we get it's selector from "typicalSelectors"
 * @params      raw_tag_params  The name of the tag
 * @params      section         The name of the section in the tag element
 * @params      element         The element name
 * @params      param           The value of the element
 *
 *         Example:     "~grid:row|5"  => row #5
 *                      "~grid:header|Timestamp"
 *                      "~grid:validateColumns|Timestamp;Endpoint"
 *                      "~grid:validateRowValues|1;col1;col2;col3"
 *                      "~ipv4:..." --> see IP filtering
 *                      "~error:selector"
 *
 *         Example:     raw_tag_params  = "~grid:header|Timestamp"
 *                      section         = "~grid"
 *                      element         = "header"
 *                      param           = "Timestamp"
 */

import typicalSelectors from './grid/typicalSelectors';
import ipv4Selector from './ipv4/ipv4Selector';
import {getRunNumber} from '../../postman/executePostmanCollection';
import errorSelector from './errorSelector';

module.exports = (raw_tag_params, section, element, param, parentSelector) => {

    /* search tag by tag name */
    if (!section) {
        return `[data-bo=${raw_tag_params}]`;
    }

    if (section == "~grid") {
        return typicalSelectors(element, param, parentSelector);
    }

    if (section == "~postman") {
        if (element == "runNumber") {
            return getRunNumber;
        }
        //  continue to the error message
    }

    if (section == "~ipv4") {
        return ipv4Selector(element, param);
    }

    if (section == "~error") {
        return errorSelector(element, param);
        // return `[data-bo="${element}"] ~ span > .validation-invalid`;
    }

    if (section == "~confirm") {
        if (element == "button" && param) {
            return `.infaButton-label=${param}`;
        }
        //  continue to the error message
    }

    var message = `Invalid Tag: ${raw_tag_params}, Section: ${section}`;
    console.log(message);
    throw(message);
};
