/**
 * Check whether all of the tag_names are present in the current page
 *
 * @param  {String}   number_of_tag_names       tag names seperated by comma (example: "Username" or "Log In")
 */
import isTagDisplayed from './isTagDisplayed';

module.exports = (number_of_tag_names) => {

    let tagNames = number_of_tag_names.split('|');
    let number_of_tags = tagNames.length;
    for (let i = 0; i < number_of_tags; i++) {
        isTagDisplayed(tagNames[i]);
    }
};

