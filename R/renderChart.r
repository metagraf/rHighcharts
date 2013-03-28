#' Shiny render chart
#' 
#' ...
#' 
#' @export
renderChart <- function(expr, env=parent.frame(), quoted=FALSE) {
    func <- shiny::exprToFunction(expr, env, quoted)
    
    function() {
        chart <- func()
        paste(singleton(HTML(add_js_files())), chart$html())
    }
}