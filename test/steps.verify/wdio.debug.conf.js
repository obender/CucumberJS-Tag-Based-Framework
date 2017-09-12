let merge = require('deepmerge');
let wdioConf = require('../wdio.conf.js');
// have main config file as default but overwrite environment specific information
let originalBefore = wdioConf.config.before;
exports.config = merge(wdioConf.config, {
    baseUrl: 'http://localhost:8000/',
    specs: [
        './test/steps.verify/given/*.js',
        './test/steps.verify/when/*.js',
        './test/steps.verify/then/*.js',
        './test/steps.verify/utils/*.js',
    ],
    logLevel: 'error', // Level of logging: silent | verbose | command | data | result | error
    capabilities: [
        {
            browserName: 'chrome',
            "chromeOptions": {
                args: ['--disable-web-security']
            }
        }
    ],
    //services: ['selenium-standalone'], // Will open the browser and show UI
    services: ['phantomjs'], // Won't open the browser and show UI
    framework: 'mocha',
    mochaOpts: {
        ui: 'bdd',
        compilers: ['js:babel-register']
    },
    before: function () {
        originalBefore();
        require('babel-register');
    }
});
