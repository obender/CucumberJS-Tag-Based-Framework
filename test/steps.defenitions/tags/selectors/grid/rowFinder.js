//
//   supported
//      ~grid|row:*        => ARRAY of all the rows
//      ~grid|row:5        => specific row
//      ~grid|row:*;Access Type;Deny   => ARRAY of all the rows containing "Deny" in column "Access Type" (as array)
//      ~grid|row:2;Access Type;Deny   => the 2nd row which contains "Deny" in column "Access Type"
//

module.exports = (param, parentSelector) => {
    let params = param.replace("=", ";").split(";");
    if (params.length == 0 || params.length > 3) {
        let err = 'Invalid selector format "' + param + '", requires 1 or 3 parameters (2 allowed, but 2nd is ignored)';
        console.log(err);
        throw(err);
    }

    //   get the ids of all the rows in the grid
    let selector = (parentSelector || '') + ' [role="row"]';
    browser.waitTillReady(selector);
    let ids = browser.getAttribute(selector, "id");
    let hasCondition = params.length > 2;

    //   if specific line is desired by index, return the id of this index
    if (params[0] != '*' && !hasCondition) {
        let rowIdx = parseInt(params[0]);
        if (rowIdx > ids.length) {
            let err = "requested grid row " + rowIdx + ", but grid has only " + ids.length + " rows";
            console.log(err);
            throw err;
        }
        return "#" + ids[rowIdx - 1];
    }

    //
    //   if there is a condition, need to look for rows which match the desired value
    //
    let columnTitles = browser.getText((parentSelector || "") + " .infaTableGrid-column-header-content");
    let columnIdx = -1;
    let expectedColumnVal = '';
    if (hasCondition) {
        columnIdx = columnTitles.indexOf(params[1]);
        if (columnIdx < 0) {
            let err = "requested column '" + params[1] + "' is not part of the grid";
            console.log(err);
            console.log(columnTitles);
            throw err;
        }
        expectedColumnVal = params[2] || '';
    }

    browser.waitTillReady(selector);
    let rowsArr = browser.getText(selector);
    let result = [];

    for (let i = 0; i < rowsArr.length; i++) {
        if (!rowsArr[i])
            continue;
        let columns = rowsArr[i].split("\n");
        let actualColumnVal = columns[columnIdx] || '';
        if (!hasCondition || actualColumnVal == expectedColumnVal) {
            result.push("#" + ids[i]);
        }
    }

    if (params[0] == "*") {
        //   if all the rows are requested, return them as array
        return result;
    }
    else {
        //   otherwise, return the Nth row among the results
        let rowIdx = parseInt(params[0]);
        return result[rowIdx - 1];
    }

};
