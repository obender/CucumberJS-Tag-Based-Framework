const argv = require('yargs').argv;
const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const gulp = require('gulp');
const gulpif = require('gulp-if');
const gulpIgnore = require('gulp-ignore');
const lazypipe = require('lazypipe');
const sourcemaps = require('gulp-sourcemaps');
const uglify = require('gulp-uglify');
const useref = require('gulp-useref');

module.exports = function (config) {
  return function () {
    return gulp.src(config.src)
      .pipe(useref({}, lazypipe().pipe(sourcemaps.init, { loadMaps: true })))
      .pipe(gulpIgnore.exclude(config.src))
      .pipe(gulpif(argv.production, uglify({ preserveComments: 'license' })))
      .pipe(gulpif(!argv.production, sourcemaps.write('.')))
      .pipe(chmod(755))
      .pipe(gulp.dest(config.dest, {"mode": "0755"}))
      .on('finish', browserSync.reload);
  }
};
