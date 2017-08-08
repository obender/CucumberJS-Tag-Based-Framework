/**
 * Open the URL based on the given section name
 *
 * @param  {String}   type          Type of navigation (url or site or section)
 * @param  {String}   page_name     The name of the section (ex: "api-list")
 *
 *                  if no type is specified => default type === "section"
 */

import checkCurrentUrl from '../expects/checkCurrentUrl';
import waitForPageToLoad from './waitForPageToLoad';
import windowResetToken from '../../login/windowResetToken';


module.exports = (type, page_name) => {

    if (typeof(page_name) == "function" || !page_name) {
        page_name = type;
        type = "section";
    }

    let targetUrl = '';
    switch (type) {
        case 'url':
        case 'targetUrl':
            targetUrl = page_name;
            break;
        case 'site':
            targetUrl = browser.options.baseUrl + page_name;
            break;
        case 'section':
            targetUrl = browser.options.baseUrl + "#/" + page_name;
            break;
        case 'page':
            targetUrl = browser.options.baseUrl + "#/" + page_name;
            break;
    }

    if (browser.url().value != targetUrl) {
        browser.url(targetUrl);

        if (page_name === "login")
            windowResetToken();

        browser.refresh();

        waitForPageToLoad(page_name);
        let current_section = checkCurrentUrl(targetUrl, page_name);
    }
    browser.waitTillReady("body");
};
