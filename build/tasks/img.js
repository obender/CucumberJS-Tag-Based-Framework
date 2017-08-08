const argv = require('yargs').argv;
const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const gulp = require('gulp');
const gulpif = require('gulp-if');
const imagemin = require('gulp-imagemin');
const newer = require('gulp-newer');

module.exports = function (config) {
  return function () {
    return gulp.src(config.src)
      .pipe(newer(config.dest))
      .pipe(chmod(755))
      .pipe(gulpif(argv.production, imagemin()))
      .on('error', console.log)
      .pipe(gulp.dest(config.dest, {"mode": "0755"}))
      .on('finish', browserSync.reload);
  }
};
