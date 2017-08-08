const gulp = require('gulp');
const series = require('stream-series');
const angularFilesort = require('gulp-angular-filesort');
const concat = require('gulp-concat');

module.exports = function (config) {
    return function () {
        var rest = gulp.src(['./rest/**/*.js', '!./rest/mocked/**/*.*'], {read: true});
        var appSources = gulp.src(['./src/**/*.js', '!./**/*spec.js'], {read: true})
            .pipe(angularFilesort());
        var injectOrder = series(rest, appSources);

        return injectOrder.pipe(concat('apim.js'))
            .pipe(gulp.dest(config.dest, {"mode": "0755"}));
    }
}
