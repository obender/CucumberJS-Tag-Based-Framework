
import checkRowGrayedOut from '../steps.defenitions/grid/checkRowGrayedOut';
import isTagDisplayed from '../steps.defenitions/tags/expects/isTagDisplayed';
import isTagTextEqual from '../steps.defenitions/tags/expects/isTagTextEqual';
import isErrorInTag from '../steps.defenitions/tags/expects/isErrorInTag';
import isOptionSelected from '../steps.defenitions/tags/expects/isOptionSelected';
import isAlertDisplayed from '../steps.defenitions/tags/expects/isAlertDisplayed';
import isTagEnabled from '../steps.defenitions/tags/expects/isTagEnabled';
import isTagChecked from '../steps.defenitions/tags/expects/isTagChecked';

import waitForPageToLoad from '../steps.defenitions/tags/actions/waitForPageToLoad';
import rowsInGrid from '../steps.defenitions/grid/rowsInGrid';
import rowsInTag from '../steps.defenitions/grid/rowsInTag';
import checkIsOpenedInNewWindow from '../steps.defenitions/tags/expects/checkIsOpenedInNewWindow'

module.exports = function then() {

    this.Then(/^Tag "([^"]*)?" is grayed out$/,
        checkRowGrayedOut);
    this.Then(/^"([^"]*)?" section is fully loaded$/,
        waitForPageToLoad);
    this.Then(/^section "([^"]*)?" is fully loaded$/,
        waitForPageToLoad);

    this.Then(/^Tag "([^"]*)?" is (not )*?(displayed|clickable)$/,
        isTagDisplayed);
    this.Then(/^the (text in|value of) Tag "([^"]*)?" (is|is not|contains|does not contain) "([^"]*)?"$/,
        isTagTextEqual);
    this.Then(/^the (utc time in) Tag "([^"]*)?" (is|is not) "([^"]*)?"$/,
        isTagTextEqual);   /* note! "contains" is not supported for time comparison */
    this.Then(/^there is no error in Tag "([^"]*)?"$/,
        isErrorInTag);
    this.Then(/^the Tag "([^"]*)?" is (enabled|disabled)$/,
        isTagEnabled);
    this.Then(/^the Tag "([^"]*)?" (is|is not) checked$/,
        isTagChecked);

    this.Then(/^the grid "([^"]*)?" has (any|many|no|[\d]+) rows?$/,
        rowsInGrid);
    this.Then(/^Tag "([^"]*)?" has (any|many|no|[\d]+) rows?$/,
        rowsInTag);
    this.Then(/^option "([^"]*)?" in Tag "([^"]*)?" is selected$/,
        isOptionSelected);
    this.Then(/^alert is displayed$/,
        isAlertDisplayed);
    this.Then(/^alert containing text "([^"]*)?" is displayed$/,
        isAlertDisplayed);
    this.Then(
        /^a new (tab|window) is opened and the url contains:"([^"]*)?"$/,
        checkIsOpenedInNewWindow
    );
};
