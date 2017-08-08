const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const gulp = require('gulp');
const newer = require('gulp-newer');

module.exports = function (config) {
    return function () {
      return gulp.src(config.src, { base: config.base || '' , mode: "0755"})
        .pipe(newer(config.dest))
        .pipe(chmod(755))
        .pipe(gulp.dest(config.dest, {"mode": "0755"}))
        .on('finish', browserSync.reload);
  }
};
