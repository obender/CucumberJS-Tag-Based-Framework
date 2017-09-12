import rowFinder from './rowFinder';

/*
supported formats:
   ~grid|cell:<row#>;;<col#>
   ~grid|cell:*;;<col#>
   ~grid|cell:<N>;;<col#>;<column>;<value>
*/
module.exports = (param) => {

    let params = param.replace("=", ";").split(";");
    if (params.length != 3 && params.length != 5) {
        let err = 'Invalid selector format, "' + param + '", requires 3 or 5 parameters';
        console.log(err); throw(err);
    }

    //
    //   determine column index
    //
    let colIdx = params[2];
    if (!colIdx.match(/\d+/g)) {
        var columnTitles = browser.getText(".infaTableGrid-column-header-content");
        colIdx = columnTitles.indexOf(colIdx) + 1;
        if (colIdx < 1) {
            let err = "requested column '" + params[2] + "' is not part of the grid";
            console.log(err); console.log(columnTitles); throw err;
        }
    }

    //
    //   collect all the parameters for rowFinder
    //
    let rowParams = [];
    rowParams.push(params[0]);
    if (params.length == 5) {
        rowParams.push(params[3]);
        rowParams.push(params[4]);
    }

    let rowSelector = rowFinder(rowParams.join(";"));

    //
    //   for '*' selector, return an array of results
    //
    if (params[0] == "*") {
        let result = [];
        for (var i in rowSelector) {
            result.push(rowSelector[i] + ` > div:nth-child(${colIdx}) > div`)
        }
        return result;
    }

    //
    //   for specific row, extract it from the array
    //
    return `${rowSelector} > div:nth-child(${colIdx}) > div`;
};
