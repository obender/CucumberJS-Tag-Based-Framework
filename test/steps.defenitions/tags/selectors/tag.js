/**
 * Select the correct tag using bo
 * @params      raw_tag_params     the bo or a different section to get the selector from tagSelectors
 *
 *              Example:    raw_tag_params  = "~grid:header|Timestamp"
 *                          section         = "~grid"
 *                          element         = "header"
 *                          param           = "Timestamp"
 */

import tagSelectors from './tagSelectors';

module.exports = (raw_tag_params) => {
    const CUSTOM_TAG_START_CHAR = '~';
    const CUSTOM_TAG_SECTION_CHAR = ':';
    const CUSTOM_TAG_PARAM_CHAR = '|';
    if (raw_tag_params.startsWith(CUSTOM_TAG_START_CHAR)) {
        let splitSection = raw_tag_params.split(CUSTOM_TAG_SECTION_CHAR);
        let section = splitSection[0];
        let splitParam = splitSection[1].split(CUSTOM_TAG_PARAM_CHAR);
        let element = splitParam[0];
        let param = splitParam[1];
        let ps = splitParam[2];

        return tagSelectors(raw_tag_params, section, element, param, ps);
    } else
        return tagSelectors(`"${raw_tag_params}"`);
};
