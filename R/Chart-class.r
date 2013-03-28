Chart <- setRefClass(
    "Chart",
    fields = list(opt = "list"),
    methods = list(
        initialize = function(x = NULL) {
            opt <<- if (is.null(x)) list() else x
            opt$credits$text <<- ""
            opt$credits$href <<- ""
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
            } else {
                if (is.null(y) || !is.numeric(y)) {
                    series(data = x, ...)
                } else {
                    if (length(x) != length(y)) stop ("Arguments x and y must be of the same length")
                    xy <- lapply(1:length(x), function(i) list(x[i], y[i]))
                    series(data = xy, ...)
                }
            }
        },

        #' Print chart as HTML
        #'
        #' Convert a chart object to HTML.
        #' After building a chart one usually wants to convert it to a HTML character string.
        #' The JavaScript files are included in the charts package, and thus automatically added to the HTML file.
        html = function(id = tempfile(), files = FALSE) {
            # argument "id = tempfile()" just creates a random string (not any file)

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
                js <- add_js_files()
                html <- paste(js, html)
            }
            
            return(html)
        },
        
        show = function() {
            .chart_object <- .self$copy()  # put chart object in global variable (for shiny)
            shiny::runApp(file.path(system.file(package = "rHighcharts"), "show-app"))
        }
    ),
    
)
