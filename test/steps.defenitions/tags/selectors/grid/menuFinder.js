import rowFinder from './rowFinder';

/*
 supported formats:
 ~grid|menu:<row#>
 ~grid|menu:<N>;<column>;<value>
 */
module.exports = (param, perRowSelector) => {
    let params = param.replace("=", ";").split(";");
    if (params.length != 1 && params.length != 3) {
        let err = 'Invalid selector format, "' + param + '", requires 1 or 3 parameters';
        console.log(err);
        throw(err);
    }
    if (params[0] == '*') {
        let err = "Multiple row selection is not permitted for '" + param + "'";
        console.log(err);
        throw(err);
    }
    return rowFinder(param) + " " + perRowSelector;
};
