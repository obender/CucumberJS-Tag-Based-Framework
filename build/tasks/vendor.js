const chalk = require('chalk');
const chmod = require('gulp-chmod');
const fs = require('fs');
const gulp = require('gulp');
const wiredep = require('wiredep');

module.exports = function (config) {
  return function (cb) {
    var vendor_src = (function () {
      var paths = [];

      var wd = wiredep({
        onError: function (err) { throw(err) }
      });

      if (wd.js)  paths = paths.concat(wd.js);
      if (wd.css) paths = paths.concat(wd.css);

      return paths;
    })();

    return gulp.src(vendor_src)
      .pipe(chmod(755))
      .pipe(gulp.dest(config.dest, {"mode": "0755"}));
  }
};
