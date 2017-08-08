/**
 * Sets the Page selector
 *
 *          action {String}     set selector for future action with paging
 *
 *                              options:    current     => current page number
 *                                      next        => go to next page
 *                                      prev        => go to previous page
 *                                      size        => set the page size
 *                                      current-size => get the page size
 *                                      total-rows   => the total number of rows in the api-list section
 *                                      rows-in-page => the number of rows in the current page
 *                                                          out of the total (example: 10 of 78)
 */
module.exports = (action, parentSelector) => {

    switch (action) {
        case 'current':
            return ((parentSelector || "") + " .page-selection input");
        case 'next':
            return ((parentSelector || "") + " .infaPager .arrow-right.page-arrow");
        case 'prev':
            return ((parentSelector || "") + " .infaPager .arrow-left.page-arrow");
        case 'size':
            return((parentSelector || "") + " .page-size select");
        case 'current-size':
            return((parentSelector || "") + " .page-size option:checked");
        case 'total-rows':
            return((parentSelector || "") + " .total-rows");
        case 'rows-in-page':
            return((parentSelector || "") + " .cur-page");
        default:
            throw `No paging action: ${action} was found`;
    }
}
