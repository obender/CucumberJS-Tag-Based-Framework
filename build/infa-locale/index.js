var gulp = require('gulp');
var through = require('through2');
var Path = require('path');
var merge = require('merge-stream');
var infaNamespace = require('infa-namespace');
var infaResourcify = require('infa-resourcify');
var chmod = require('gulp-chmod');
var extend = require('gulp-extend');

var supportedLanguages = ["en", "de", "es", "fr", "ja", "ko", "pt_BR", "zh_CN", "tr" /* pseudo-locale */];

module.exports = function(options){

    if (options) {

        // Most Informatica teams that use Symphony have their key/value message
        // files named bundle*.properties, so use that as the default template.
        if (!options.bundleFilenameTemplate) {
            options.bundleFilenameTemplate = "bundle{language}.properties";
        }

        if (!options.getNamespace) {
            options.getNamespace = infaNamespace;
        }

        var bundleStreams = [];
        // For each language, find all of the bundle files pertaining to that
        // language within the source path and build a translation.json file
        // of the bundle's key/value pairs separated by namespace and put it
        // in the destination path under a directory named after the language
        // code (e.g. "<bundleDestinationPath>/en/translation.json")
        for (var i = 0; i < supportedLanguages.length; i++) {
            var language = supportedLanguages[i];
            bundleStreams.push(gulp.src(Path.join(
                options.bundlesSourcePath,
                options.bundleFilenameTemplate.replace(
                    "{language}", language !== "en" ? "_" + language : ""
                )))
                .pipe(through.obj(function(file, encoding, callback) {
                    options.getNamespace(file, function(namespace) {
                        file.namespace = namespace;
                        callback(null, file);
                    });
                }))
                .pipe(infaResourcify())
                .pipe(chmod(777))
                .pipe(extend("translation.json", true, 4))
                .pipe(gulp.dest(Path.join(options.bundleDestinationPath, language), {"mode": "0777"}))
            );
        }

        return merge(bundleStreams);
    }

    cb();
};
