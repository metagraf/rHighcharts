#' chartOutput (use with Shiny)
#' 
#' Use rHighchart charts as Shiny output. First, use renderChart in server.R to assign the chart object to an Shiny output. Then create an chartOutput with the same name in ui.R. chartOutput is currently just an alias for htmlOutput.
#' @param outputId output variable to read the value from
#' 
#' @export
chartOutput <- function(outputId) {
    shiny::htmlOutput(outputId)
}