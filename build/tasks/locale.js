const infaApimLocale = require('../infa-locale/index');

module.exports = function (config) {
  return function () {
    return infaApimLocale({
      bundlesSourcePath: config.src,
      bundleDestinationPath: config.dest,
      getNamespace: function(file, callback) {
        callback(config.namespace);
      }
    });
  }
};
