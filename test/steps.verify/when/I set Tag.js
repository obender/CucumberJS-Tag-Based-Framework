let setTagValue = require('../../steps.defenitions/tags/actions/setTagValue');

describe('I set Tag "<tag>" to "value"', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/textbox.html`);
    });

    it('I set Tag "test-text-box" to "test-value", expecting it to get this value', () => {
        setTagValue("test-text-box", "test-value");
        let selector = '[data-bo="test-text-box"]';
        let textOfTextbox = browser.getValue(selector);
        textOfTextbox.should.be.equal('test-value');
    });

    it('I set Tag "test-text-box" to "", expecting it to be cleared', () => {
        setTagValue("test-text-box", "");
        let selector = '[data-bo="test-text-box"]';
        let emptyText = browser.getValue(selector);
        emptyText.should.be.equal('');
    });

});
