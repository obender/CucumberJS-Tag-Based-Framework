/**
 * Sets the username and password in the login page text-box
 * @param  {string}     text          the username / password
 * @param  {string}     textbox       where to write the input text (Username or Password's text box)
 * @param  {Function}   done          Function to execute when finished
 */
module.exports = (text, textbox) => {

    var selector = `[data-bo="${textbox}"]`;
    var input = browser.element(selector);

    input.clearElement();
    if (text != null)
        input.setValue([text]);

    //done();
};


