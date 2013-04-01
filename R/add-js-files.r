#' Add Highcharts JavaScript files
#' 
#' Return all necessary Highcharts JavaScript files code as a HTML string.
#' It does not include jQuery since it is already included in the Shiny package.
#' 
#' @export
add_js_files <- function() {
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