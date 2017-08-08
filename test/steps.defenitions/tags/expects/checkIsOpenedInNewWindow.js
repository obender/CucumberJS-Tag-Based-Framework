/**
 * Check if the given URL was opened in a new window
 * @param  {String}   obsolete    Indicator for the type (window or tab) unused
 * @param  {String}   expectedUrl The URL to check for
 */
module.exports = (obsolete, expectedUrl) => {
    /**
     * All the current window handles
     */

    let windowHandles = browser.windowHandles().value;

    browser.waitSafely(function () {
        return windowHandles.length > 1;
    });

    windowHandles.length.should.not.equal(1, 'A popup was not opened');

    /**
     * The last opened window handle
     */
    const lastWindowHandle = windowHandles.slice(-1);

    // Make sure we focus on the last opened window handle
    browser.window(lastWindowHandle[0]);

    /**
     * Get the URL of the current browser window
     */
    const windowUrl = browser.url().value;
    windowUrl.should.contain(expectedUrl, 'The popup has a incorrect url');
    browser.close();
};
