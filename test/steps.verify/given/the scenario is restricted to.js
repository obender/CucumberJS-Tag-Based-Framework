let setTagValue = require('../../steps.defenitions/tags/actions/setTagValue'),
    chai = require('chai'),
    should = chai.should(),
    scenarioRestriction = require('../../steps.defenitions/tags/scenarioRestriction'),
    tag = require('../../steps.defenitions/tags/selectors/tag');

describe('the scenario is restricted to "scenario tag"', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/restrictedToSchenario.html`);
    });

    it('scenarioRestriction function test', () => {
        scenarioRestriction('tab1');
        scenarioRestriction().should.be.equal('[data-bo="tab1"]');

        scenarioRestriction('tab2');
        scenarioRestriction().should.be.equal('[data-bo="tab2"]');

        scenarioRestriction('');
        should.not.exist(scenarioRestriction());
    });

    it('scenarioRestriction tag test', () => {
        scenarioRestriction('TEST_RESTRICTION');
        tag('TEST_TAG').should.be.equal('[data-bo="TEST_RESTRICTION"] [data-bo="TEST_TAG"]');

        scenarioRestriction(null);
        tag('TEST_TAG').should.be.equal('[data-bo="TEST_TAG"]');

        scenarioRestriction('');
        tag('TEST_TAG').should.be.equal('[data-bo="TEST_TAG"]');
    });

    it('the scenario is restricted to "tab1" And I set Tag "test-text-box" to "test-value", expecting it to get this value', () => {
        scenarioRestriction('tab1');
        setTagValue("test-text-box", "test-value");
        let selector = '[data-bo="tab1"] [data-bo="test-text-box"]';
        let textOfTextbox = browser.getValue(selector);
        textOfTextbox.should.be.equal('test-value');
    });

    it('the scenario is restricted to "tab1" And I set Tag "test-text-box" to "", expecting it to be cleared', () => {
        scenarioRestriction('tab1');
        setTagValue("test-text-box", "");
        let selector = '[data-bo="tab1"] [data-bo="test-text-box"]';
        let emptyText = browser.getValue(selector);
        emptyText.should.be.equal('');
    });
});
