#' Set list of chart object
#'
#' Method to set the list of a chart object.
#'
#' @param object Chart object
#' @param value Options list
#'
#' @export
#' @docType methods
#' @rdname set_options
#'
setGeneric("set_options<-", function(object, value) {
    standardGeneric("set_options<-")
})

#' @rdname set_options
setMethod("set_options<-", c("chart", "list"), function(object, value) {
    object@options <- append(get_options(object), value)
    validObject(object)
    return(object)
}) 
