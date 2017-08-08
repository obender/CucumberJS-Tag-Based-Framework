/**
 * Reset the token for the current session
 *      since 'this is not a valid token' is not a valid token
 *         => the system will log you out automatically
 */
module.exports = () => {
    let setResult = browser.execute(function () {
        window.localStorage.removeItem('apim.ui.token');
        return window.location.reload();
    });

    if (!setResult || setResult.state !== "success") {
        let message = "window.localStorage.removeItem Failed to run: " + setScript;
        throw(new Error(message));
    }
    browser.waitForExist('[data-bo="Username"]')
};
