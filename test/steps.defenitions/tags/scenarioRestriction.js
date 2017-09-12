import tagSelectors from './selectors/tagSelectors';

module.exports = (scenario) => {
    if (scenario === null || scenario === '') {
        global.bo_scenario = null;
    } else if (scenario) {
        global.bo_scenario = tagSelectors(scenario);
    } else {
        return global.bo_scenario;
    }
};
