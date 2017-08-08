let setTagValue = require('../../steps.defenitions/tags/actions/setTagValue');
let copyTagValue = require('../../steps.defenitions/tags/actions/copyTagValue');

describe('Rule: I set Tag "<target-tag>" to the value of Tag "<source-tag>"', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/textbox.html`);
    });

    it('I set Tag "test-text-box2" to the value of "test-text-box", expecting value to be copied', () => {
        let value = "test-value-to-copy";
        setTagValue("test-text-box", value);
        copyTagValue("test-text-box2", "test-text-box");
        let selector   = '[data-bo="test-text-box2"]';
        let textOfTarget = browser.getValue(selector);
        textOfTarget.should.be.equal(value);
    });

});
