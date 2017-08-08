const gulp = require('gulp'),
    wdio = require('gulp-wdio'),
    path = require('path');

module.exports = function (argv) {
    return function () {
        let folder = argv.folder;
        let file = argv.file;
        let port = argv.port;
        let timeout = Number(argv.timeout_d);
        let tags = argv.tag ?
            String(argv.tag)
                .split(' ')
                .map(i => i[0] === '@' ? '@' + i : i) : [];

        if (tags.length)
            console.info(`Running specs with tag: ${tags}`);

        let conf = './test/wdio.conf.js';
        let specs = `./test/features/${folder}/${file}.feature`;
        let url = `http://localhost:${port}/`;

        return gulp.src(conf)
            .pipe(wdio({
                wdio: {
                    baseUrl: url,
                    specs: [specs],
                    logLevel: 'error',
                    waitforTimeout: timeout,
                    cucumberOpts: {
                        tags: tags,
                        timeout: timeout
                    },
                    capabilities: [{
                        browserName: 'chrome',
                        "chromeOptions": {
                            args: ['--disable-web-security']
                        },
                    }]
                }
            }));
    }
};
