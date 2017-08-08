module.exports = {
    baseURL: 'https://selenium-release.storage.googleapis.com',
    version: '3.4.0',
    resolution: {width: 1600, height: 800},
    drivers: {
        chrome: {
            version: '2.29',
            arch: process.arch,
            // - Recent versions of the driver: https://sites.google.com/a/chromium.org/chromedriver/
            baseURL: 'https://chromedriver.storage.googleapis.com'
        },
        ie: {
            version: '3.4.0',
            arch: 'ia32',
            // - Recent versions of the driver: http://docs.seleniumhq.org/download/
            baseURL: 'https://selenium-release.storage.googleapis.com'
        },
        firefox: {
            version: '0.15.0',
            arch: process.arch,
            baseURL: 'https://github.com/mozilla/geckodriver/releases/download'
        }
    },
    javaArgs: [
        '-Dwebdriver.edge.driver=./MicrosoftWebDriver.exe'
    ]
};
