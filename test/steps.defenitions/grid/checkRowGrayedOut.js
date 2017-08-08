/**
 *
 * Check if the data in 'row_number' is grayed out
 * @param  {String}   row_number            The row number to check
 *
 */
import tag from '../tags/selectors/tag'

module.exports = (bo) => {
    /**
     * The method to call on the browser object
     * @type {String}
     */
    var selector = tag(bo) + ` > div`;

    browser.waitTillReady(selector);

    var cellHtml = browser.getAttribute(selector, 'class');

    var isGrayedOut = cellHtml.indexOf('defaultCellRendererOpacity') !== -1;

    expect(isGrayedOut)
        .to.equal(true,
        `expected row "${selector}" has html class defaultCellRendererOpacity, 
            actual html is: "${cellHtml}"`);

}
