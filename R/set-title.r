#' Set title
#'
#' Set a new title for the chart
#' @export
#' @docType methods
#' @rdname set_title
#'
setGeneric("set_title", function(object, text = NULL, align = "center", floating = FALSE, margin = 15, style = list(color = "#3E576F", 
    fontSize = "16px"), useHTML = FALSE, verticalAlign = "top", x = 0, y = 15) {
    standardGeneric("set_title")
})

#' @rdname set_title
setMethod("set_title", "chart", function(object, text, align, floating, margin, style, useHTML, verticalAlign, x, y) {
    
    object@options$title <- list(text = text, align = align, floating = floating, margin = margin, style = style, useHTML = useHTML, 
        verticalAlign = verticalAlign, x = x, y = y)
    validObject(object)
    return(object)
}) 
