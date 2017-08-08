let focusPointAndClick = require('../../steps.defenitions/tags/actions/focusPointAndClick');

describe('Rule: I focus on Tag "([^"]*)?" and I Click Tag "([^"]*)?" and I click on text "([^"]*)?"?"$', () => {
    let selector = '#click-status';
    before(function () {
        browser.url(`${browser.options.baseUrl}/buttons.html`);
    });
    beforeEach(function () {
        browser.execute(function (selector) {
            return $(selector).text('');
        }, selector)
    });

    it('I focus on Tag "Show Button" and I Click Tag "Hidden button"', () => {
        focusPointAndClick("Show Button", "Hidden button");
        let textOfTextbox = browser.getText(selector);
        textOfTextbox.should.be.equal('Show Button Clicked');
    });

    it('I focus on Tag "Show Button" and I Click Tag "Hidden button" and I click on text "Hidden Text"', () => {
        focusPointAndClick("Show Button", "Hidden button", "Hidden Menu");
        let textOfTextbox = browser.getText(selector);
        textOfTextbox.should.be.equal('Hidden Menu Clicked');
    });

});
