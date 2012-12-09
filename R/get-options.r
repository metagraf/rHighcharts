#' Get options of chart object
#'
#' Method to get the options list of a chart object.
#' @export
#' @docType methods
#' @rdname get_options
#'
setGeneric("get_options", function(object) {
    standardGeneric("get_options")
})

#' @rdname get_options
setMethod("get_options", "chart", function(object) {
    return(object@options)
}) 
