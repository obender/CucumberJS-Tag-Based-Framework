//
//   this function is relevant for validation error tags, such as "toIp|error"
//   it verifies that the error tag is either not displayed at all, or empty
//
import tag from '../selectors/tag';

module.exports = (data_bo) => {
    let errorSelector = tag(data_bo);

    //   if the error selector is not even on the screen, then there is no error which is ok
    if (!browser.isExisting(errorSelector) ||
        !browser.isVisible(errorSelector))
        return;

    let text = new String(browser.getText(errorSelector)).trim();
    if (text.length > 1)
        expect(text).to.equal('', `Error needs to be Empty ${errorSelector} found:${text} -> `);
};
