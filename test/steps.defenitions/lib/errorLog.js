module.exports = (err, message) => {
    var result = [];
    if (message)
        result.push(`${message}`);

    if (typeof err === 'object') {
        if (err.message) {
            result.push(`Message: ${err.message}`);
        }
        if (err.stack) {
            result.push('Stacktrace:')
            result.push('====================')
            result.push(err.stack);
        }
    } else {
        result.push('Error Logger :: argument is not an object');
    }

    throw new Error(result.join("\n"));
};
