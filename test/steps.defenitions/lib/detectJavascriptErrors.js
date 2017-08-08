/**
 * Clicks on the "menuText" text from the dropdown menu
 * @param  {String}     menuText    The text in the "dropdown" menu to be clicked upon
 * @param  {Function}   done        Function to execute when finished
 */
module.exports = () => {
    let script = "window.collectedErrors = [];"
        + "window.onerror = function(errorMessage) { "
        + "window.collectedErrors[window.collectedErrors.length] = errorMessage;"
        + "}";
    let result = browser.execute(script);
    expect(result.value).to.equal([], `Javascript Error Detected!!!\n Details: ${JSON.stringify(result)}`);
};


