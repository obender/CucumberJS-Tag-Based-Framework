/**
 * Execute the pressing of a key from the keyboard
 *
 * @param  {String}   key_to_press   The normalised key value (e.x: "Enter")
 *
 */

module.exports = (key_to_press) => {

    var keyPressed = browser.keys(key_to_press);

};

