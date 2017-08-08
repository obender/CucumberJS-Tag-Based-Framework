const path = require('path');
const gulp = require('gulp');
const browserSync = require('browser-sync');

module.exports = function (config) {
    return function () {
        // Watch Symphony JS/tmpl for changes and reload
        gulp.watch([
            path.join(config.symphony.source, 'js', '/**/*'),
            path.join(config.symphony.source, 'tmpl', '/**/*')
        ], browserSync.reload);

        // Stream Symphony CSS changes to the browser instead of reloading
        gulp.watch(path.join(config.symphony.source, 'css', '/**/*'),
            function (file) {
                return gulp.src(file.path, {"mode": "0755"}).pipe(browserSync.stream());
            });

        // App resources
        gulp.watch(path.join(config.src, 'css', '/**/*'), ['css']);
        gulp.watch(path.join(config.src, 'img', '/**/*'), ['img']);
        gulp.watch(path.join(config.src, 'locale', '/**/*'), ['locale']);
        gulp.watch(path.join('src', '/**/*'), ['copy']);
        gulp.watch(path.join('rest', '/**/*'), ['copy', 'rest']);
        gulp.watch(['index.html','login.html'], ['inject']);
    };
};
