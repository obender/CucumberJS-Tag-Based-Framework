const argv = require('yargs')
    .default('folder', '**')
    .default('file', '*')
    .default('port', '8080')
    .default('timeout_d', '50000')
    .default('tag', '')
    .argv;

const gulp = require('gulp'),
    wdio = require('gulp-wdio'),
    path = require('path'),
    sequence = require('gulp-sequence').use(gulp);

let config = {
    main: 'index.html',
    src: 'res',
    dest: 'target',
    production: false,
    symphony: {
        version: '3.2.0',
        components: ['core', 'widgets', 'webShell', 'api', 'library', 'angular'],
        source: './lib/symphony',
        path: 'symphony'
    },
    taskLocation: './build/tasks/',
    e2e: {
        specs: ['./test/features/**/*.feature']
    }
};

const getTask = function (task, opts) {
    opts = opts || {};
    return require(config.taskLocation + task)(opts);
};

gulp.task('e2e', getTask('e2e', argv));
gulp.task('e2e:verify', sequence('build-dev', 'e2e:verify:run'));
gulp.task('e2e:verify:run', getTask('e2e_verify', './test/steps.verify/wdio.verify.conf.js'));
gulp.task('e2e:verify:debug', getTask('e2e_verify', './test/steps.verify/wdio.debug.conf.js'));
gulp.task('e2e:debug', getTask('e2e_debug', argv));
gulp.task('unit:run', getTask('test_unit'));
gulp.task('unit', sequence('install', 'unit:run'));
gulp.task('test', sequence('e2e', 'unit'));

gulp.task('build', sequence('clean', 'install',
    ['copy', 'css', 'img', 'locale', 'lib', 'help', 'rest', 'vendor'],
    'concat', 'inject'));
gulp.task('build-dev', sequence('clean', 'install',
    ['copy', 'css', 'img', 'locale', 'lib', 'help', 'rest', 'vendor'],
    'inject-dev'));
gulp.task('build-mock', sequence('clean', 'install',
    ['copy', 'css', 'img', 'locale', 'lib', 'help', 'rest', 'vendor']));
gulp.task('install', getTask('install', config));
gulp.task('clean', getTask('clean', {
    dest: path.join(config.dest, '/**/*')
}));
gulp.task('css', getTask('css', {
    src: path.join(config.src, 'css', 'app.scss'),
    dest: path.join(config.dest, 'res', 'css'),
    useVariables: true,
    symphony: config.symphony
}));
gulp.task('img', getTask('img', {
    src: path.join(config.src, 'img', '/**/*'),
    dest: path.join(config.dest, 'res', 'img')
}));
gulp.task('help', getTask('help', {
    src: path.join(config.src, 'help', '/**/*'),
    dest: path.join(config.dest, 'res', 'help')
}));
gulp.task('copy', getTask('scripts', {
    src: path.join('src', '/**/*'),
    dest: path.join(config.dest, 'src')
}));
gulp.task('inject', getTask('inject', {
    src: config.main,
    production: true,
    mock: false,
    dest: config.dest,
    symphony: config.symphony
}));
gulp.task('inject-dev', getTask('inject', {
    src: config.main,
    production: config.production,
    mock: false,
    dest: config.dest,
    symphony: config.symphony
}));
gulp.task('inject-mock', getTask('inject', {
    src: config.main,
    production: config.production,
    dest: config.dest,
    mock: true,
    symphony: config.symphony
}));
gulp.task('locale', getTask('copy', {
    src: path.join(config.src, 'locale', '/**/*'),
    dest: path.join(config.dest, 'res', 'json', 'locale')
}));
gulp.task('lib', getTask('copy', {
    src: path.join('lib', '/**/*'),
    dest: path.join(config.dest, 'lib')
}));
gulp.task('rest', getTask('copy', {
    src: path.join('rest', '/**/*'),
    dest: path.join(config.dest, 'rest')
}));
gulp.task('concat', getTask('concat', {
    src: path.join('.', '/**/*'),
    dest: config.dest
}));
gulp.task('serve', ['watch'], getTask('serve', {
    base: config.dest,
    index: 'index.html',
    symphony: config.symphony
}));
gulp.task('serve:dev', ['watch-dev'], getTask('serve', {
    base: config.dest,
    index: 'index.html',
    symphony: config.symphony
}));
gulp.task('serve:mock', ['watch-mock'], getTask('serve', {
    base: config.dest,
    index: 'index.html',
    symphony: config.symphony
}));
gulp.task('vendor', getTask('vendor', {
    dest: path.join(config.dest, 'vendor')
}));
gulp.task('lint', getTask('lint', {}));

gulp.task('watch', ['build'], getTask('watch', config));
gulp.task('watch-dev', ['build-dev'], getTask('watch', config));
gulp.task('watch-mock', ['build-mock'], getTask('watch', config));
