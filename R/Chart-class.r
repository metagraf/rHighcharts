Chart <- setRefClass(
    "Chart",
    fields = list(opt = "list"),
    methods = list(
        initialize = function(x = NULL) {
            opt <<- if (is.null(x)) list() else x
            opt$credits$text <<- "charts: An R wrapper for Highcharts JS"
            opt$credits$href <<- "https://github.com/metagraf/charts"
        },

        #' Wrappers
        #' 
        #' For more information see: 
        #' http://api.highcharts.com/highcharts
        chart = function(...) opt$chart <<- list(...),
        colors = function(...) opt$colors <<- list(...),
        credits = function(...) opt$credits <<- list(...),
        exporting = function(...) opt$exporting <<- list(...),
        global = function(...) opt$global <<- list(...),
        labels = function(...) opt$labels <<- list(...),
        lang = function(...) opt$lang <<- list(...),
        legend = function(...) opt$legend <<- list(...),
        loading = function(...) opt$loading <<- list(...),
        navigation = function(...) opt$navigation <<- list(...),
        pane = function(...) opt$pane <<- list(...),
        plotOptions = function(...) opt$plotOptions <<- list(...),
        series = function(..., replace = FALSE) {
            opt$series <<- if (replace) list(list(...))
                else c(opt$series, list(list(...)))
        },
        subtitle = function(...) opt$subtitle <<- list(...), 
        title = function(...) opt$title <<- list(...),
        tooltip = function(...) opt$tooltip <<- list(...),
        
        xAxis = function(..., replace = FALSE) {
            opt$xAxis <<- if (replace) list(list(...))
                else c(opt$xAxis, list(list(...)))
        },
        yAxis = function(..., replace = FALSE) {
            opt$yAxis <<- if (replace) list(list(...))
                else c(opt$yAxis, list(list(...)))
        },
        
        #' Add data
        #' 
        #' Add a data frame or vector to chart
        data = function(x = NULL, y = NULL, ...) {
            if (is.data.frame(x)) {
                for (i in colnames(x)) {
                    if (is.numeric(x[[i]])) {
                        series(name = i, data = x[[i]], ...)
                    } else { 
                        warning (sprintf("Column '%s' wasn't added since it's not a numeric", i))
                    } 
                }
            } else if (is.numeric(x)) {
                if (is.null(y) || !is.numeric(y)) {
                    series(data = x, ...)
                } else {
                    if (length(x) != length(y)) stop ("Arguments x and y must be of the same length")
                    xy <- lapply(1:length(x), function(i) c(x[i], y[i]))
                    series(data = xy, ...)
                }
            } else { stop ("Argument x must be a data frame or a numeric vector") }
        },

        #' Print chart as HTML
        #'
        #' Convert a chart object to HTML.
        #' After building a chart one usually wants to convert it to a HTML character string.
        #' The JavaScript files are included in the charts package, and thus automatically added to the HTML file.
        print = function(id = "mychart", files = TRUE) {

            # TODO: Fix attribute 'files' so that one may print more than one chart on a page.
            
            opt$chart$renderTo <<- as.character(id)
            
            html <- sprintf("<script type=\"text/javascript\">
                                    (function($){
                                        $(function () {
                                            var chart = new Highcharts.Chart(%s);
                                        });
                                    })(jQuery);
                            </script>
                            <div id=\"%s\"></div>",
                            RJSONIO:::toJSON(opt), id)
            
            if (files) {
                js <- file.path(system.file(package = "charts"), c(
                    "jquery.min.js", 
                    "highcharts.js",
                    "highcharts-more.js"))
                
                js <- sprintf("<script type=\"text/javascript\">
                                    %s
                                    jQuery.noConflict();
                               </script>", 
                              paste(sapply(js, function(x) readChar(x, file.info(x)$size)), collapse = "\n"))
                
                html <- paste(js, html)
            }
            
            return(html)
        }
    )
)
