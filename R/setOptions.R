#' Set list of chart object
#'
#' Method to set the list of a chart object.
#' @export
#' @docType methods
#' @rdname setOptions
#'
setGeneric("setOptions<-", function(object, value) {
    standardGeneric("setOptions<-")
})

#' @rdname setOptions
setMethod(f = "setOptions<-", signature = "chart", definition = function(object, 
    value) {
    object@options <- append(getOptions(object), value)
    validObject(object)
    return(object)
})
