#' Javascript
#' 
#' ...
#' 
#' @export
javascript <- function() {
    js <- file.path(system.file(package = "charts"), c(
        "jquery.min.js", 
        "highcharts.js",
        "highcharts-more.js"))
    
    js <- sprintf("<script type=\"text/javascript\">
                  %s
                  jQuery.noConflict();
                  </script>", 
                  paste(sapply(js, function(x) readChar(x, file.info(x)$size)), collapse = "\n"))
    return(js)
}