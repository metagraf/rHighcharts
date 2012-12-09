setClass(Class = "chart", representation = representation(options = "list"), 
    validity = function(object) {
        if (!RJSONIO:::isValidJSON(RJSONIO:::toJSON(object@options), 
            TRUE)) {
            stop("The argument is not a valid JSON list")
        }
        return(TRUE)
    })

#' Chart class initializor
#'
#' Method that runs when a new chart object is initialized.
setMethod("initialize", "chart", function(.Object, 
    options = list()) {
    
    .Object@options <- options
    .Object@options$chart$renderTo <- "highchart"
    
    return(.Object)
})

#' Create new chart
#'
#' Use this to create a new form object.
#' @export
#' @param ... chart object
#'
chart <- function(...) {
    new(Class = "chart", ...)
}


 
