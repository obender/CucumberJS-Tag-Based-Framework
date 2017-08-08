/**
 * Check if the value of <tag_name> is displayed on the current page
 *
 * @param  {String}   data_bo      The name of the tag (ex: "~grid:cell|1;;Status")
 * @param  {String}   operator     is or is not
 * @param  {String}   expected_value     The text value to compare
 */

import tag from '../selectors/tag';
import moment from 'moment';

const IS_OPERATOR = 'is';
const IS_NOT = 'is not';
const CONTAINS = 'contains';
const DOES_NOT_CONTAIN = 'does not contain';

module.exports = (value_type, data_bo, operator, expected_value) => {
    let selector = tag(data_bo);
    browser.waitTillReady(selector);

    let current_text;

    if (typeof(expected_value) == 'function') {
        expected_value = operator;
        operator = IS_OPERATOR;
    }

    let expected_text = expected_value || '';
	if (value_type == 'utc time in') {
		expected_text = moment.utc(expected_text, "MM/DD/YYYY HH:mm:ss").local().format("l LTS");
	}

    function getCurrentText() {
        try {
            current_text = browser.getText(selector) || browser.getValue(selector) || '';
            /* cells of row are given as one per line, so split to array */
            if (current_text.includes("\n")) {
                current_text = current_text.split("\n").join("|");
            } else if (current_text.join) {
                current_text = current_text.join("");
            }
            return current_text;
        } catch (err) {
            return `Error on getCurrentText:`;
        }
    }

    let additionalInfo = `BO:\'${data_bo}\' [selector: ${selector}]`;

    switch (operator) {
        case IS_OPERATOR:
            browser.waitSafely(() => getCurrentText() == expected_text);
            expect(getCurrentText()).to.equal(expected_text, additionalInfo);
            break;

        case IS_NOT:
            browser.waitSafely(() => getCurrentText() != expected_text);
            expect(getCurrentText()).not.to.equal(expected_text, additionalInfo);
            break;

        case CONTAINS:
            browser.waitSafely(() => getCurrentText().includes(expected_text));
            expect(getCurrentText()).to.contain(expected_text, additionalInfo);
            break;

        case DOES_NOT_CONTAIN:
            browser.waitSafely(() => !getCurrentText().includes(expected_text));
            expect(getCurrentText()).not.to.contain(expected_text, additionalInfo);
            break;
    }
};
