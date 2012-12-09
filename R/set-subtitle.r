#' Set subtitle
#'
#' Set a new subtitle for the chart
#' @export
#' @docType methods
#' @rdname set_subtitle
#'
setGeneric("set_subtitle", function(object, text = NULL, align = "center", floating = FALSE, margin = 15, style = NULL, 
    useHTML = FALSE, verticalAlign = "top", x = 0, y = 30) {
    standardGeneric("set_subtitle")
})

#' @rdname set_subtitle
setMethod("set_subtitle", "chart", function(object, text, align, floating, margin, style, useHTML, verticalAlign, x, 
    y) {
    
    object@options$subtitle <- list(text = text, align = align, floating = floating, margin = margin, style = style, 
        useHTML = useHTML, verticalAlign = verticalAlign, x = x, y = y)
    validObject(object)
    return(object)
}) 
