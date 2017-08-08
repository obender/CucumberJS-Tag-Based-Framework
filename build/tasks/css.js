const argv = require('yargs').argv;
const browserSync = require('browser-sync');
const chmod = require('gulp-chmod');
const gulp = require('gulp');
const gulpif = require('gulp-if');
const header = require('gulp-header');
const sass = require('gulp-sass');
const sourcemaps = require('gulp-sourcemaps');

module.exports = function (config) {
  return function () {
    const opts = { errLogToConsole: true, outputStyle: 'compressed' };
    return gulp.src(config.src)
      .pipe(chmod(755))
      .pipe(sourcemaps.init())
      .pipe(gulpif(config.useVariables, header('@import "' + config.symphony.source + '/styles/variables";\n')))
      .pipe(sass(opts)).on('error', sass.logError)
      .pipe(browserSync.stream())
      .pipe(gulpif(!argv.production, sourcemaps.write('.')))
      .pipe(gulp.dest(config.dest, {"mode": "0755"}));
  };
};
