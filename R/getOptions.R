#' Get options of chart object
#'
#' Method to get the options list of a chart object.
#' @export
#' @docType methods
#' @rdname getOptions
#'
setGeneric("getOptions", function(object) {
    standardGeneric("getOptions")
})

#' @rdname getOptions
setMethod(f = "getOptions", signature = "chart", definition = function(object) {
    return(object@options)
}) 
