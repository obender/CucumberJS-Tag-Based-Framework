import setTagValue from '../steps.defenitions/tags/actions/setTagValue';
import clickTag from '../steps.defenitions/tags/actions/clickTag';
import keyPress from '../steps.defenitions/tags/actions/keyPress';
import selectOption from '../steps.defenitions/tags/actions/selectOption';
import focusPointAndClick from '../steps.defenitions/tags/actions/focusPointAndClick';
import respondToAlert from '../steps.defenitions/tags/actions/respondToAlert';
import doAutoLogout from '../steps.defenitions/login/doAutoLogout';
import copyTagValue from '../steps.defenitions/tags/actions/copyTagValue';
import doDebug from '../steps.defenitions/tags/actions/doDebug';
import doRefresh from '../steps.defenitions/tags/actions/doRefresh';
import selectDate from '../steps.defenitions/tags/actions/selectDate';

module.exports = function when() {
    this.When(/I set Tag "([^"]*)?" to "([^"]*)?"$/, setTagValue);
    this.When(/I set Tag "([^"]*)?" to the value of Tag "([^"]*)?"$/, copyTagValue);

    this.When(/I click Tag "([^"]*)?"$/, clickTag);
    this.When(/I focus on Tag "([^"]*)?"$/, clickTag);
    this.When(/I click Tag "([^"]*)?" and click text "([^"]*)?"$/, clickTag);
    this.When(/I focus on Tag "([^"]*)?" and I Click Tag "([^"]*)?" and I click on text "([^"]*)?"?"$/,
        focusPointAndClick);

    this.When(/I focus on Tag "([^"]*)?" and I Click Tag "([^"]*)?"$/, focusPointAndClick);
    this.When(/I press the "([^"]*)?" key$/, keyPress);
    this.When(/I select option "([^"]*)?" in Tag "([^"]*)?"$/, selectOption);
    this.When(/^I (approve|reject) the alert$/, respondToAlert);
    this.When(/^I (log out|emulate auto logout)$/, doAutoLogout);
    this.When(/^I want to debug$/, doDebug);
    this.When(/^I do Refresh$/, doRefresh);
    this.When(/I select date "([^"]*)?" in Tag "([^"]*)?"$/, selectDate);
};
