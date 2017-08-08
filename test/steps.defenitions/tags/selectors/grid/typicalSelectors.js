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

import validateColumns from  './validateColumns'
import clickGridheader from  './clickGridheader'
import rowFinder from "./rowFinder"
import cellFinder from "./cellFinder"
import menuFinder from "./menuFinder"
import pageSelector from "./pageSelector"


module.exports = (element, param, parentSelector) => {
    let selector = "";

    switch (element) {

        case 'validateColumns':                 // "~grid:validateColumns|Timestamp;Endpoint;..."
            return validateColumns(param, ".infaTableGrid-column-header-content");
        case 'menu':                            //kebab
            return menuFinder(param, "div.floatingToolbar");
        case 'menuText':
            return '.menuContainer';
        case 'cell':                            // "~grid:cell|"
            return cellFinder(param, parentSelector);
        case 'row':                             // "~grid:row|"
            return rowFinder(param, parentSelector);
        case 'header':                          // "~grid:header|Name"
            selector = (parentSelector && !isNaN(+param))
                ? `${parentSelector} .jqx-widget-header:nth-child(${param}) .infaTableGrid-column-header-content`
                : `.infaTableGrid-column-header-content=${param}`;
            return selector;
        case 'sortMenu':                        // "~grid:sortMenu"
            selector = "div.infaTableHeader > div > div.infaTableButtonSet > div:nth-child(2) > div.infaDropdown_button > button";
            return selector;
        case 'page':                            // "~grid:page|next"
            return pageSelector(param, parentSelector);
        case 'gridHeader':
            return clickGridheader();
        case 'search':
            selector = (parentSelector || "")
                + " div.infaTableHeader div.infaTableButtonSet > div.infaTableBtn.infaTextBox.hasClearBtn > input";
            return selector;
        case 'rowsCounter':
            selector = ".infaTable-title-count";
            return selector;
        case 'logout':
            selector = ".indexUserMenu";
            return selector;
        default:
            throw `No element ${element} was found`;
    }
};
