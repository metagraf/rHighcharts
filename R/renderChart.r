#' renderChart (use with Shiny)
#' 
#' Use rHighchart charts as Shiny output. First, use renderChart in server.R to assign the chart object to an Shiny output. Then create an chartOutput with the same name in ui.R. chartOutput is currently just an alias for htmlOutput.
#' 
#' @param expr An expression that returns a chart object
#' @param env The environment in which to evaluate the expression.
#' @param quoted Is expr a quoted expression (with quote())? This is useful if you want to save an expression in a variable.
#' 
#' @export
renderChart <- function(expr, env = parent.frame(), quoted = FALSE) {
    func <- shiny::exprToFunction(expr, env, quoted)
    
    function() {
        chart <- func()
        chart$html()
    }
}