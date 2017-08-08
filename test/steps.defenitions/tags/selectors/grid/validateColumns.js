/**
 * Check that all of the columns are displayed
 *
 * @param  {String}   allColumns    All of the columns to look for seperated by '|'
 * @param  {String}   selector      The selector that was set for the current browser action
 */

module.exports = (allColumns, selector) => {
    let columnNames = allColumns.split(';');

    browser.waitTillReady(selector);

    const element = browser.elements(selector);
    element.waitForExist();
    expect(element.value).to.have.length
        .above(0, `expected element "${element}" to exist`);

    let texts = browser.getText(selector);
    let foundColumns = 0;
    let notFoundColumns = [];
    for (let column of columnNames) {
        let isFound = texts.find(x => x.toLowerCase() === column.toLowerCase());
        if (isFound)
            foundColumns++;
        else
            notFoundColumns.push(column)
    }
    expect(foundColumns).to.equal(columnNames.length,
        `expected columns  "${notFoundColumns}" to exist`);
};


