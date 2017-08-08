// wdio.dev.config.js
let merge = require('deepmerge');
let wdioConf = require('./wdio.conf.js');
// have main config file as default but overwrite environment specific information
exports.config = merge(wdioConf.config, {
    capabilities: [
        {
            maxInstances: 10,
            //browserName: 'phantomjs',
            javascriptEnabled: true,
            locationContextEnabled: true,
            handlesAlerts: true,
            rotatable: true,
        },
        {
            maxInstances: 1,
            browserName: 'firefox'
        },
        {
            maxInstances: 1,
            //
            browserName: 'internet explorer'
        }
    ],
    screenResolution: '1280x960',
    //services: ['phantomjs']
});
// add an additional reporter
//exports.config.reporters.push('allure');
