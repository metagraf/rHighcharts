#' Set a new subtitle for the chart
#'
#' For more information: http://api.highcharts.com/highcharts#subtitle
#'
#' @param object Chart object
#' @param text The subtitle of the chart. To disable the subtitle, set the text to NULL. Defaults to NULL.
#' @param align The horizontal alignment of the title. Can be one of 'left', 'center' and 'right'. Defaults to 'center'.
#' @param floating When the title is floating, the plot area will not move to make space for it. Defaults to FALSE
#' @param margin The margin between the title and the plot area, or if a subtitle is present, the margin between the subtitle and the plot area. Defaults to 15.0.
#' @param style CSS styles for the title. Use this for font styling, but use align, x and yfor text alignment. Defaults to: list(color: '#3E576F', fontSize: '16px').
#' @param useHTML Whether to use HTML to render the title text. Using HTML allows for advanced formatting, images and reliable bi-directional text rendering. Note that exported images won't respect the HTML. Defaults to FALSE.
#' @param verticalAlign The vertical alignment of the title. Can be one of 'top', 'middle' and 'bottom'. Defaults to 'top'.
#' @param x The x position of the subtitle relative to the alignment within chart.spacingLeft and chart.spacingRight. Defaults to 0.0.
#' @param y The y position of the subtitle relative to the alignment within chart.spacingTop and chart.spacingBottom. Defaults to 15.0.
#'
#' @export
#' @docType methods
#' @rdname set_subtitle
#'
setGeneric("set_subtitle", function(object, text = NULL, align = "center", 
    floating = FALSE, margin = 15, style = NULL, useHTML = FALSE, 
    verticalAlign = "top", x = 0, y = 30) {
    standardGeneric("set_subtitle")
})

#' @rdname set_subtitle
setMethod("set_subtitle", "chart", function(object, text, align, 
    floating, margin, style, useHTML, verticalAlign, x, y) {
    
    object@options$subtitle <- list(text = text, align = align, 
        floating = floating, margin = margin, style = style, useHTML = useHTML, 
        verticalAlign = verticalAlign, x = x, y = y)
    validObject(object)
    return(object)
}) 
