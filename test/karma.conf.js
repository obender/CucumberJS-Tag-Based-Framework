module.exports = function (config) {
    config.set({
        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: '',
        // frameworks to use
        // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
        frameworks: ['jasmine', 'sinon', 'sinon-chai'],

        // list of files / patterns to load in the browser
        files: [
            '../bower_components/jquery/dist/jquery.js',
            '../bower_components/bootstrap/dist/js/bootstrap.js',
            '../bower_components/moment/moment.js',
            '../bower_components/angular/angular.js',
            '../bower_components/angular-mocks/angular-mocks.js',
            '../bower_components/angular-ui-router/release/angular-ui-router.js',
            '../bower_components/angular-bootstrap/ui-bootstrap.js',
            '../bower_components/angular-message-format/angular-message-format.js',
            '../bower_components/angular-translate/angular-translate.js',
            '../bower_components/angular-validation/dist/angular-validation.js',
            '../lib/symphony/js/symphony-core-3.2.0.js',
            '../lib/symphony/js/symphony-library-3.2.0.js',
            '../lib/symphony/js/symphony-webShell-3.2.0.js',
            '../lib/symphony/js/symphony-widgets-3.2.0.js',
            '../lib/symphony/js/symphony-analytics-3.2.0.js',
            '../lib/symphony/js/symphony-angular-3.2.0.js',
            '../lib/symphony/js/symphony-dataPreview-3.2.0.js',
            '../lib/symphony/js/symphony-imf-3.2.0.js',
            '../lib/symphony/js/symphony-inbox-3.2.0.js',
            '../lib/symphony/js/symphony-services-isp-3.2.0.js',
            '../lib/symphony/js/symphony-test-3.2.0.js',
            '../lib/angular-ipv4-input/ipv4.input.js',
            '../lib/base64/angular-base64.min.js',
            '../lib/goog/base.js',
            '../lib/goog/deps.js',
            '../res/locale/**/*.json',
            '../src/**/module.js',
            '../src/**/*.html',
            '../src/**/*.mock.js',
            '../src/**/*.spec.js',
            '../src/**/*.js'
        ],
        angularFilesort: {
            whitelist: [
                'src/**/*.js'
            ]
        },
        // list of files to exclude
        exclude: [],
        client: {
            captureConsole: false
        },
        // preprocess matching files before serving them to the browser
        // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
        preprocessors: {
            'src/**/*.html': ['ng-html2js']
        },

        ngHtml2JsPreprocessor: {},
        // test results reporter to use
        // possible values: 'dots', 'progress'
        // available reporters: https://npmjs.org/browse/keyword/karma-reporter
        reporters: ['spec'],
        allureReport: {
            reportDir: './test/results/allure-results'
        },

        // web server port
        port: 9876,

        // enable / disable colors in the output (reporters and logs)
        colors: true,

        // level of logging
        // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
        logLevel: config.LOG_DISABLE,
        // enable / disable watching file and executing tests whenever any file changes
        autoWatch: false,

        // start these browsers
        // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
        // PhantomJS / Chrome / IE
        browsers: ['PhantomJS', 'Chrome', 'IE'],

        browserDisconnectTimeout: 10000,
        browserDisconnectTolerance: 1,

        plugins: [
            'karma-jasmine',
            'karma-requirejs',
            'karma-coverage',
            'karma-junit-reporter',
            'karma-phantomjs-launcher',
            'karma-chrome-launcher',
            'karma-firefox-launcher',
            'karma-ie-launcher',
            'karma-sinon',
            'karma-sinon-chai',
            'karma-ng-html2js-preprocessor',
            'karma-allure-reporter',
            'karma-spec-reporter'
        ],
        // Continuous Integration mode
        // if true, Karma captures browsers, runs the tests and exits
        singleRun: true,

        // Concurrency level
        // how many browser should be started simultaneous
        concurrency: Infinity
    })
};
