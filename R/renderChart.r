#' Shiny render chart
#' 
#' ...
#' 
#' @export
renderChart <- function(expr, env=parent.frame(), quoted=FALSE) {
    func <- shiny::exprToFunction(expr, env, quoted)
    
    function() {
        paste(singleton(HTML(javascript())), func())
    }
}