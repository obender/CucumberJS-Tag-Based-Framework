
import openWebsite from '../steps.defenitions/tags/actions/openSection';
import doAutoLogin from '../steps.defenitions/login/doAutoLogin';
import isTagsPresent from '../steps.defenitions/tags/expects/isTagsPresent';
import postman from '../steps.defenitions/postman/executePostmanCollection';
import scenarioRestriction from '../steps.defenitions/tags/scenarioRestriction';

module.exports = function given() {
    this.Given(/^I open the (url|site|section|page) "([^"]*)?"$/,
        openWebsite);
    this.Given(/^I am logged in$/,
        doAutoLogin);
    this.Given(/^Tags "([^"]*)?" are displayed$/,
        isTagsPresent);
    this.Given(/^Postman collection "([^"]*)?" in folder "([^"]*)?" is Executed successfully( (\d+) times?)?$/,
        postman);
    this.Given(/^the scenario is restricted to "([^"]*)?"$/, scenarioRestriction);
};
