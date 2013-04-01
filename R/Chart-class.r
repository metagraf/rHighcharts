#' @title Chart class
#' 
#' @description The Chart class is a wrapper for the Highcharts API. It also includes \code{data()} and \code{html()} to extend with some additional functionality specific for R users.
#' 
#' @section \code{data()}: A method that may take either vectors or data frames as input.
#' 
#' @section \code{html()}: A method to convert the chart object to HTML code. The code does not include necessary JavaScript files (e.g. Highcharts and jQuery); however, when used interactively (\code{show()}) or with Shiny, those are automatically included.
#' 
#' @section Further documentation: For more documentation on the specific Highcharts methods, please visit \url{http://api.highcharts.com/highcharts}.
#' 
#' @examples \dontrun{
#' 
#' library(rHighcharts)
#' 
#' ### Bar chart
#' a <- rHighcharts:::Chart$new()
#' a$chart(type = "bar")
#' a$plotOptions(column = list(stacking = "normal"))
#' a$title(text = "US Personal Expenditure")
#' a$yAxis(title = list(text = "US dollars"))
#
#' x <- as.data.frame(t(USPersonalExpenditure))
#' a$xAxis(categories = rownames(x))
#' a$data(x)
#' a  # show chart in browser
#' 
#' ### Pie chart
#' a <- rHighcharts:::Chart$new()
#' a$title(text = "Fruits")
#' a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "amount")
#' a
#' }
#' 
Chart <- setRefClass(
    "Chart",
    fields = list(opt = "list"),
    methods = list(
        initialize = function(x = NULL) {
            opt <<- if (is.null(x)) list() else x
            opt$credits$text <<- ""
            opt$credits$href <<- ""
        },

        #' Wrapper methods
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
        
        #' Custom add data method
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
        html = function(id = tempfile()) {  # tempfile() is just used to create a random string

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
            return(html)
        },
        
        show = function() {
            assign(".chart_object", .self$copy(), envir = .GlobalEnv)  # put chart object in global variable (for shiny)
            shiny::runApp(file.path(system.file(package = "rHighcharts"), "shiny"))
        }
    )
)
