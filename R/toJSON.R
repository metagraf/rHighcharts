#' Convert chart to JSON
#'
#' Method to convert a chart object to a JSON character string.
#' @param chart object
#' @export
#' @docType methods
#' @rdname toJSON
setGeneric("toJSON", function(object) {
    standardGeneric("toJSON")
})

#' @rdname toJSON
setMethod(f = "toJSON", signature = "chart", definition = function(object) {
    json <- RJSONIO:::toJSON(getOptions(object))
    return(json)
}) 
