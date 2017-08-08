const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const gulp = require('gulp');
const gulpif = require('gulp-if');
const replace = require('gulp-replace');

module.exports = function (config) {
  return function () {
    var currentdate = new Date();
    var timestamp = (currentdate.getMonth()+1) + "/"
        + currentdate.getDate() + "/"
        + currentdate.getFullYear() + " @ "
        + currentdate.getHours() + ":"
        + currentdate.getMinutes() + ":"
        + currentdate.getSeconds();

    return gulp.src(config.src)
      .pipe(chmod(755))
      .pipe(gulpif('aboutContent.htm', replace('$$buildtime$$', timestamp)))
      .pipe(gulp.dest(config.dest), {"mode": "0755"})
      .on('finish', browserSync.reload);
  }
};
