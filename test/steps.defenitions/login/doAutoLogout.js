/**
 *  Do Logout, with all of the following steps inside:
 *      Given I open the section "api-list"
 *
 *      When I click on the "UserMenu" icon
 *      Then The "Log Out" text appears
 *      And  I click on the "Log Out" menu text
 *      Then The "logout" action is successful
 *
 *@param  {Function}   done          Function to execute when finished
 */

import windowRemoveToken from './windowRemoveToken';
import windowResetToken from './windowResetToken';
module.exports = (is_logout) => {

    if (is_logout === 'log out') {
        windowRemoveToken();
    }
    else {
        windowResetToken();
    }
};


