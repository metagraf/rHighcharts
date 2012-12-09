#' Print chart as HTML
#'
#' Convert a chart object to HTML.
#' After building a chart one usually wants to convert it to a HTML character string.
#'
#' @param x chart object
#' @export
setMethod("print", "chart", function(x) {
    
    jquery_js <- file.path(system.file(package = "rHighcharts"), "jquery.min.js")
    highcharts_js <- file.path(system.file(package = "rHighcharts"), "highcharts.js")
    
    html <- sprintf("\n<script type=\"text/javascript\">%s</script>\n<script type=\"text/javascript\">jQuery.noConflict();</script>\n<script type=\"text/javascript\">%s</script>\n<script type=\"text/javascript\">\n(function($){ $(function () { var chart = new Highcharts.Chart(%s);});})(jQuery);\n</script>\n<div id=\"highchart\"></div>", 
        readChar(jquery_js, file.info(jquery_js)$size), readChar(highcharts_js, 
            file.info(highcharts_js)$size), to_json(x))
    
    return(html)
}) 
