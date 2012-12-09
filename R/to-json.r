#' Convert chart to JSON
#'
#' Method to convert a chart object to a JSON character string.
#'
#' @param object Chart object
#'
#' @docType methods
#' @rdname to_json
setGeneric("to_json", function(object) {
    standardGeneric("to_json")
})

#' @rdname to_json
setMethod("to_json", "chart", function(object) {
    json <- RJSONIO:::toJSON(get_options(object))
    return(json)
}) 
