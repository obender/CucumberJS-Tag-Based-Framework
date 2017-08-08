/**
 * Use predefined username and password to do the auto login
 *  This function actually do the same as the following gherkin code:
 *
 *        Given I open the section "login"
 *        When the login parameters are set to:
 *        Then I click the "login" button
 *        And  The "login" action is successful
 *
 *@param  {Function}   done          Function to execute when finished
 */


import doLogin from './doLogin';


module.exports = () => {
    var username = 'gadi@wolfman.com';
    var password = 'bp3luser';
    doLogin(username, password);
};


