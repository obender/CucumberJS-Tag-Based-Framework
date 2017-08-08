/**
 * Wait for the relevant page to fully load
 *
 * @param  {String}   page_name      The name of the page (ex: "api-list")
 *
 */

module.exports = (page_name) => {

    switch (page_name){
        case ("login"):
            browser.waitTillReady('[data-bo="Log In"]');
            break;
        case ("grid-security-logs"):
            browser.waitTillReady(".total-rows");
            browser.waitTillReady(".total-pages");
            browser.timeoutsImplicitWait(5000);
            break;
        case ("api-list"):
            browser.waitTillReady(".total-rows");
            break;
        case ("logs"):
            browser.waitTillReady(".infaCompositeViewTitle");
            break;
        case ("Don't have an account?"):    //Informatica Cloud Trial page:
            browser.waitTillReady(".cloudTrial-label");
            break;
        case ('Forget your password?'):
            browser.waitTillReady(".descbox");
            break;
        default:
            throw new Error(`No page ${page_name} was found, Available options are: ["login", "grid-security-logs", "logs", "Don't have an account?", "Forget your password?"]`);
    }
};

