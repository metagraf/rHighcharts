#' Add js files
#' 
#' Return Highcharts Javascript files code as HTML
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