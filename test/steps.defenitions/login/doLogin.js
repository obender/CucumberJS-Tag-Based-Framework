/**
 * Get username and password from the feature file, to do the semi auto login:
 *  This function actually do the same as the following gherkin code:
 *      Given I open the section "login"
 *        When I enter username:"<username>", password:"<password>"
 *        Then I click the "login" button
 *        And  The "login" action is successful
 * @param  {string}     username      the username (for login)
 * @param  {string}     password      the password (for login)
 */

import clickTag from '../tags/actions/clickTag';
import openSection from '../tags/actions/openSection';
import setTagValue from '../tags/actions/setTagValue';
import checkTagDisplayed from '../tags/expects/isTagDisplayed';
import windowRemoveToken from './windowRemoveToken';

module.exports = (username, password) => {

    let curent = browser.getUrl();
    let expectedUrl = browser.options.baseUrl;

    if (curent.indexOf(expectedUrl) === -1) {
        browser.url(expectedUrl);
    }

    browser.waitTillReady('.ng-scope');
    let loggedInToken = browser.execute(function () {
        return window.localStorage['apim.ui.token'];
    });

    curent = browser.getUrl();

    if (!loggedInToken.value || curent.indexOf('login') > 0) {
        windowRemoveToken();
        openSection("login");

        setTagValue("Username", username);
        setTagValue("Password", password);

        clickTag("Log In");
        checkTagDisplayed("api-list");
    }
};
