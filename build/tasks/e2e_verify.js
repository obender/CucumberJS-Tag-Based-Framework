const gulp = require('gulp'),
    wdio = require('gulp-wdio'),
    path = require('path'),
    webserver = require('gulp-webserver'),
    serveStatic = require('serve-static');

module.exports = function (wdioFile) {
    return function () {
        let home = './../../';
        let mocks = path.join(__dirname, home + 'test/steps.verify/control.mocks');
        let target = path.join(__dirname, home + 'target');
        let webServer = gulp.src([mocks, target])
            .pipe(webserver({
                livereload: false,
                directoryListing: true,
                open: false,
                port: 8000,
                fallback: 'textbox.html',
                middleware: [serveStatic(mocks)]
            }));
        return gulp.src(wdioFile)
            .pipe(wdio({
                wdio: {
                    onComplete: function (exitCode) {
                        if (wdioFile.indexOf('.debug') > 0) {
                            if (exitCode === 0)
                                webServer.emit('kill');
                        } else
                            webServer.emit('kill');
                    }
                }
            }));
    }
};
