/**
 * Sets the date for infadatepicker
 * @param {string} text tag_name  control to set the date
 * @param {string} text date_value the date to be set, in MM/dd/yyyy format
 */

module.exports = (date_value, tag_name) =>
{
    try {
        var selector = "[data-bo='" + tag_name + "']";
        browser.waitTillReady(selector);
        browser.execute(function (tag_name, date_value) {
            var selector = "[data-bo='" + tag_name + "']";
            $(selector).val(date_value);
        }, tag_name, date_value);
        var selector = "[data-bo='" + tag_name + "']";
        var set_value = browser.getValue(selector);
    }
    catch(e)
    {
        console.log(e)
    }
    expect(set_value).to.equal(date_value,
        `expected to select: "${date_value}" in Tag: $('${tag_name}'),
            actually I could not set it`);
}
