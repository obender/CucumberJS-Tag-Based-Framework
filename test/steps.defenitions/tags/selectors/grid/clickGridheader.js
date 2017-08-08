/**
 * Clicks on the gridheader icon
 *
 */
module.exports = () => {

    var selector = 'div.infaCompositeViewButtonSet .infaDropdown_button button';
    console.log(Date.now()+'-------------------clickGridHeader');

    var isExist = browser.waitForVisible(selector);
    expect(isExist).to.equal(true,
        `expected that gridheader control exists, actually I could not find it`);

    return (selector);
}
