/**
 * Check if the current URL is the expected one
 * @params      expectedUrl     The url for the section to open (active page)
 * @params      page_name       The name of the section
 */
module.exports = (expectedUrl, page_name) => {
    let currentUrl = browser.getUrl();
    let index_of_login = currentUrl.indexOf(page_name);

    //  check if the <page_name> is in the expectedUrl
    //      for login :     1. if login failed => expect to be in section "login"
    //                      2. if login successfull => expect to be in section "api-list" (else)
    //
    // url login , login
    // url api-list, login
    // url api-list, api-list
    if (page_name == 'login') {
        let index_of_login = currentUrl.indexOf("login");
        if (index_of_login > 0) {
            expect(currentUrl).to.equal(expectedUrl,
                `checkCurrentUrl - The current page's url is ${currentUrl} but it should be ${expectedUrl}`);
            return ('login');
        }
        else {
            let index_of_api_list = currentUrl.indexOf("api-list");
            expect(index_of_api_list).to.be.above(0,
                `checkCurrentUrl - The current page's url is ${currentUrl} but it should be in section "api-list"`);
            return ('api-list');
        }
    }
    else {
        expect(currentUrl).to.equal(expectedUrl,
            `checkCurrentUrl - The current page's url is ${currentUrl} but it should be ${expectedUrl}`);
        return (page_name);
    }
};

