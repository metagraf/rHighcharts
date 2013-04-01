#' Highcharts JavaScript files to character string
#' 
#' The function returns all necessary Highcharts JavaScript files code as a HTML character string. For example, it is used in the \code{chartOutput} function.
#' rHighcharts does not include jQuery since it is already attached within the Shiny package.
#' 
#' @export
includeJS <- function() {
    js <- file.path(system.file(package = "rHighcharts"), "js", c(
        "highcharts.js",
        "highcharts-more.js"))
    
    js <- sprintf("<script type=\"text/javascript\">
                  %s
                  jQuery.noConflict();
                  </script>", 
                  paste(sapply(js, function(x) readChar(x, file.info(x)$size)), collapse = "\n"))
    return(js)
}
