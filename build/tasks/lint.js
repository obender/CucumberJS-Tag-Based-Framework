const eslint = require('gulp-eslint');
const gulp = require('gulp');
module.exports = function (config) {
    return function () {
        // ESLint ignores files with "node_modules" paths.
        // So, it's best to have gulp ignore the directory as well.
        // Also, Be sure to return the stream from the task;
        // Otherwise, the task may end before the stream has finished.
        return gulp.src(['**/*.js',
            '!node_modules/**',
            '!bower_components/**',
            '!lib/**',
            '!build/**',
            '!target/**',
            '!test/**',
            '!karma.conf.js',
            '!src/core/schema/**',
        ]).pipe(eslint({
            rules: {
                "max-len": [2, {"code": 140, "tabWidth": 4, "ignoreUrls": true}],
                "new-cap": ["error", {"capIsNew": false}]
            },
            globals: [
                'jQuery',
                '$',
                'sinon',
                'angular',
                'symphony',
                '$.Deferred',
                'API',
                'describe',
                'it',
                'assert'
            ],
            envs: [
                'browser'
            ],
            fix: true
        }))
            .pipe(eslint.format())
        // To have the process exit with an error code (1) on
        // lint error, return the stream and pipe to failAfterError last.
        //.pipe(eslint.failOnError());
    }
};
