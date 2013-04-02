#' chartOutput (use with Shiny)
#' 
#' Use rHighchart charts as Shiny output. First, use \code{renderChart} in \code{server.R} to assign the chart object to an Shiny output. Then create an chartOutput with the same name in \code{ui.R}. \code{chartOutput} is currently just an alias for \code{htmlOutput}.
#' 
#' @param outputId output variable to read the value from
#' 
#' @export
chartOutput <- function(outputId) {
    
    # Add resource path
    suppressMessages(singleton(addResourcePath("js", system.file('js', package='rHighcharts'))))

    div(class="rHighcharts",
        
        # Add javascript sources to header
        tagList(
            singleton(tags$head(tags$script(src = "js/highcharts.js", type='text/javascript'))),
            singleton(tags$head(tags$script(src = "js/highcharts-more.js", type='text/javascript')))
        ),
        
        # Add chart html
        htmlOutput(outputId)
    )
}