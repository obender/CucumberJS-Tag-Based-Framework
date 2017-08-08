describe('Given url related functions', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/textbox.html`);
    });

    it('Title Should be: Cucumber TDD Mock Page - Self Test', () => {
        browser.getTitle().should.be.equal('Cucumber TDD Mock Page - Self Test');
    });
});
