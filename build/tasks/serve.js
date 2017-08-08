const argv = require('yargs').argv,
    browserSync = require('browser-sync').create('dev-svr'),
    gulp = require('gulp');

module.exports = function (config) {
    return function () {
        var routes = {};
        // When receiving HTTP requests to the specified Symphony path (eg `GET /symphony/js/symphony-core.js`)
        // from the Symphony source location on the filesystem (eg `../../../target/symphony/js/symphony-core.js`)
        routes['/' + config.symphony.path] = config.symphony.source;
        var bs = require("browser-sync").get('dev-svr');
        if (bs.active)
            return;

        gulp.dest(config.index, {"mode": "0755"});
        browserSync.init({
            server: {
                baseDir: config.base,
                index: config.index,
                routes: routes,
            },
            port: argv.port || 3000,
            ui: false,
        });
    }
};
