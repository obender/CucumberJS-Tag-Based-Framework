const install = require("gulp-install");
const gulp = require('gulp');

module.exports = function (config) {
    return function () {
        return gulp.src(['./bower.json'])
            .pipe(install());
    };
};
