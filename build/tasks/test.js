const chmod = require('gulp-chmod');
const gulp = require('gulp');
const gulpIgnore = require('gulp-ignore');
const inject = require('gulp-inject');
const karma = require('karma').Server;
const path = require('path');
const resources = require('gulp-resources');
const replace = require('gulp-replace');
const argv = require('yargs').argv;

module.exports = function (config) {
  return function (cb) {

    var testFramework = argv.testFramework? config.argv.testFramework: 'qunit';
    var singleRun = argv.singleRun? config.argv.singleRun: 'true';

    var injectOptions = {
      transform: function (filepath) {
          return '"' + filepath + '",';
      },
      starttag: '// inject:files',
      endtag: '// endinject',
      addRootSlash: false,
      relative: true
    };

    var assets = gulp.src(config.index)
      .pipe(resources({cwd: config.dest}))
      .pipe(gulpIgnore.exclude('index.html'));

    gulp.src(path.join(config.src, config.karmaConfig))
      .pipe(chmod(755))
      .pipe(replace('#testFramework', testFramework))
      .pipe(replace('#testFilePath', config[testFramework]))
      .pipe(replace('#symphonyPath', config.symphony.path + '/'))
      .pipe(inject(assets, injectOptions))
      .pipe(gulp.dest(config.dest, {"mode": "0755"}))
      .on('finish', function () {
        new karma({
          configFile: path.join(process.cwd(), config.dest, config.karmaConfig),
          singleRun: singleRun
        }, function (exitCode) {
          process.exit(exitCode);
          cb();
        }).start();
      });
  }
};
