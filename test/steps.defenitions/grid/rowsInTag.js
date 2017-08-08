import tag from '../tags/selectors/tag.js';

/**
 * Check if the selector finds X number of rows
 * @param  {String}   tagName   Tag that selects multiple rows
 * @param  {Number}   rows      expected number of rows
 */
module.exports = (tagName, rows) => {
    let selector = tag(tagName);

    let actualRows;
    if (typeof selector == 'string') {
        browser.waitTillReady(selector);
        actualRows = 1;
    }
    else {
        actualRows = selector.length;
    }

    if (rows == 'no')
        rows = 0;
    if (rows == 'any' || rows == 'many')
        expect((actualRows)).to.be.above(0,
            `Expecting the tag to contain '${rows}' rows, instead '${actualRows}' was found`);
    else
        expect((actualRows)).to.equal(parseInt(rows),
            `Expecting the tag to contain '${rows}' rows, instead '${actualRows}' was found`);
};
