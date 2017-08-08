const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const fs = require('fs');
const gulp = require('gulp');
const inject = require('gulp-inject');
const path = require('path');
const replace = require('gulp-replace');
const useref = require('gulp-useref');
const wiredep = require('wiredep');
const series = require('stream-series');
const angularFilesort = require('gulp-angular-filesort');

module.exports = function (config) {
    return function () {
        var symphonyAssets = [];
        config.symphony.components.forEach(function (component) {
            symphonyAssets.push(path.join(config.symphony.source, "css", "symphony-" + component + '-' + config.symphony.version + ".css"));
            symphonyAssets.push(path.join(config.symphony.source, "js", "symphony-" + component + '-' + config.symphony.version + ".js"));
        });

        var symphony = gulp.src(symphonyAssets, {read: false, base: config.root});
        var css = gulp.src(['./res/**/*.css'], {read: false});

        var injectOrder;
        if (config.production) {
            var libs = gulp.src(['./lib/**/*.js', '!./lib/symphony/**/*.js'], {read: false});
            var concated = gulp.src(['./target/apim.js'], {read: false});
            injectOrder = series(symphony, css, libs, concated);
        } else {
            var libs = gulp.src(['./lib/**/*.js', '!./lib/symphony/**/*.js'], {read: false});
            var rest = gulp.src(['./rest/**/*.js', '!./rest/mocked/**/*.*'], {read: false});
            var appSources = gulp.src(['./src/**/*.js', '!./**/*spec.js'], {read: true})
                .pipe(angularFilesort());
            injectOrder = series(symphony, css, libs, rest, appSources);
        }

        if (config.mock) {
            var mock = gulp.src(['./rest/mocked/server/sinon.js'], {read: false});
            var mockServer = gulp.src(['./rest/mocked/server/server.js'], {read: false});
            var mockFiles = gulp.src(['./rest/mocked/**/*.js', '!././rest/mocked/server/**/*.js'], {read: false});
            injectOrder = series(symphony, css, libs, rest, mock, mockServer, mockFiles, appSources);
        }

        return gulp.src(config.src, {"mode": "0755"})
            .pipe(chmod(755))
            .pipe(wiredep.stream({
                fileTypes: {
                    html: {
                        replace: {
                            js: function (filePath) {
                                return `<script src="vendor/${filePath.split('/').pop()}"></script>`
                            },
                            css: function (filePath) {
                                return `<link rel="stylesheet" href="vendor/${filePath.split('/').pop()}">`
                            }
                        }
                    }
                }
            }))
            .pipe(inject(injectOrder, {
                relative: true,
                transform: function (filePath, file, i, length) {
                    return inject.transform.apply(inject.transform, arguments)
                        .replace('target/', '');
                }
            }))
            .pipe(replace('$$symphonyPath$$', config.symphony.path))
            .pipe(replace(config.symphony.source, config.symphony.path))
            .pipe(useref({noAssets: true}))
            .pipe(gulp.dest(config.dest, {"mode": "0755"}))
            .on('finish', browserSync.reload);
    }
};
