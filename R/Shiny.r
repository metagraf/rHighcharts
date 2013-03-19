# ' Render Chart.js
# ' 
# ' Render Chart.js graphs as Shiny output.
# ' Wrap a list object (with json options) in server.R.
# ' Then use htmlOutput in the ui.R.
# ' 
# ' @param expr An expression that returns a rchartjs object.
# ' @param env The environment in which to evaluate expr.
# ' @param quoted If it is a qouted expression.
# ' 
# ' @export
# renderChart <- function(expr, env=parent.frame(), quoted=FALSE) {
#     func <- shiny::exprToFunction(expr, env, quoted)
#     
#     function() {
#         chart <- func()
#         paste(chart$print())
#     }
# }

#' javascriptOutput
#' 
#' ...
#' 
#' @export
jsOutput <- function() {
    a <- tempfile()
    write(javascript(), a)
    shiny::includeHTML(a)
}