#' Add highcharts js files
#' 
#' Add to shiny ui before chart code
#' 
#' @export
chart_js <- function(...) {
    shiny::singleton(shiny::HTML(add_js_files(...)))
}