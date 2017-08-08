/**
 * Reset the token for the current session
 *      since 'this is not a valid token' is not a valid token
 *         => the system will log you out automatically
 */
module.exports = () => {
    let obsoleteToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2YWxpZCI6dHJ1ZSwic3ViIjoiZ2FkaUB3b2xmbWFuLmNvbSIsIm9yZ05hbWUiOiJJbmZvcm1hdGljYTciLCJpc3MiOiIwMDAwczciLCJleHAiOjQ4Mzk1NDYyOSwiY29tcGxldGUiOnRydWUsImlhdCI6NDgzOTUyNzY1LCJqdGkiOiI4NWE2Yjc1OS0zMDA4LTRkMDItOTA3My01YTA4ZDZlMTA4MWQifQ.MREw2N334N7Y2LE1bgHKixDFhFEYpxArWrCtL47w1mk";

    let setResult = browser.execute(function (token) {
        return window.localStorage['apim.ui.token'] =  token;
    }, obsoleteToken);

    if (!setResult || setResult.state !== "success") {
        let message = "Auto-logout emulation Failed to run: " + setScript;
        throw(new Error(message));
    }
};
