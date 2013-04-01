#' chartOutput (use with Shiny)
#' 
#' Use rHighchart charts as Shiny output. First, use \code{renderChart} in \code{server.R} to assign the chart object to an Shiny output. Then create an chartOutput with the same name in \code{ui.R}. \code{chartOutput} is currently just an alias for \code{htmlOutput}.
#' 
#' @param outputId output variable to read the value from
#' 
#' @export
chartOutput <- function(outputId) {
    div(class="rHighcharts",
        shiny::singleton(shiny::HTML(includeJS())), 
        shiny::htmlOutput(outputId)
    )
}