let rowsInGrid = require('../../steps.defenitions/grid/rowsInGrid');

describe('Rule: ^the grid "([^"]*)?" has (any|many|no|[\d]+) rows?$', () => {
    before(function () {
        browser.url(`${browser.options.baseUrl}/grid.html`);
    });

    it('^the grid "([^"]*)?" has any rows?$', () => {
        let result = rowsInGrid("test-grid", "any");
    });

    it('^the grid "([^"]*)?" has many rows?$', () => {
        let result = rowsInGrid("test-grid", "many");
    });

    it('^the grid "([^"]*)?" has [\d] rows?$', () => {
        let result = rowsInGrid("test-grid", 6);
    });
});
