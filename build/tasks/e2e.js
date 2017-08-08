const gulp = require('gulp'),
    wdio = require('gulp-wdio'),
    path = require('path'),
    sequence = require('gulp-sequence').use(gulp),
    webserver = require('gulp-webserver');

module.exports = function (argv) {
    return function () {
        return gulp.src('./test/wdio.BUILD.conf.js')
            .pipe(wdio({
                wdio: {
                    specs: './test/features/**/*.feature'
                }
            }));
    }
};
