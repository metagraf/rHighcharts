Chart <- setRefClass(
    "Chart",
    fields = list(options = "list"),
    methods = list(
        
        #' Chart class initializor
        #'
        #' Method that runs when a new chart object is initialized.
        initialize = function(options = NULL) {
            options <<- append(
                list(chart = list(renderTo = "highchart")),
                options)
        },
        
        #' Add options
        #' 
        #' Method to add options to the options field
        add = function(opt) {
            options <<- append(options, opt)        
        },
        
        #' Set a new title for the chart
        #'
        #' For more information: http://api.highcharts.com/highcharts#title
        #'
        #' @param text The title of the chart. To disable the title, set the text to NULL. Defaults to NULL.
        #' @param align The horizontal alignment of the title. Can be one of 'left', 'center' and 'right'. Defaults to 'center'.
        #' @param floating When the title is floating, the plot area will not move to make space for it. Defaults to FALSE.
        #' @param margin The margin between the title and the plot area, or if a subtitle is present, the margin between the subtitle and the plot area. Defaults to 15.0.
        #' @param style CSS styles for the title. Use this for font styling, but use align, x and yfor text alignment. Defaults to: list(color: '#3E576F', fontSize: '16px').
        #' @param useHTML Whether to use HTML to render the title text. Using HTML allows for advanced formatting, images and reliable bi-directional text rendering. Note that exported images won't respect the HTML. Defaults to FALSE.
        #' @param verticalAlign The vertical alignment of the title. Can be one of 'top', 'middle' and 'bottom'. Defaults to 'top'.
        #' @param x The x position of the title relative to the alignment within chart.spacingLeft and chart.spacingRight. Defaults to 0.0.
        #' @param y The y position of the title relative to the alignment within chart.spacingTop and chart.spacingBottom. Defaults to 15.0.
        title = function(text = NULL, 
                         align = "center", 
                         floating = FALSE, 
                         margin = 15, 
                         style = list(
                             color = "#3E576F", 
                             fontSize = "16px"
                         ), 
                         useHTML = FALSE, 
                         verticalAlign = "top", 
                         x = 0, 
                         y = 15) {
            options$title <<- list(text = text, align = align, floating = floating, margin = margin, 
                 style = style, useHTML = useHTML, verticalAlign = verticalAlign, x = x, y = y)
        },
        
        #' Set a new subtitle for the chart
        #'
        #' For more information: http://api.highcharts.com/highcharts#subtitle
        #'
        #' @param text The subtitle of the chart. To disable the subtitle, set the text to NULL. Defaults to NULL.
        #' @param align The horizontal alignment of the title. Can be one of 'left', 'center' and 'right'. Defaults to 'center'.
        #' @param floating When the title is floating, the plot area will not move to make space for it. Defaults to FALSE.
        #' @param margin The margin between the title and the plot area, or if a subtitle is present, the margin between the subtitle and the plot area. Defaults to 15.0.
        #' @param style CSS styles for the title. Use this for font styling, but use align, x and yfor text alignment. Defaults to NULL.
        #' @param useHTML Whether to use HTML to render the title text. Using HTML allows for advanced formatting, images and reliable bi-directional text rendering. Note that exported images won't respect the HTML. Defaults to FALSE.
        #' @param verticalAlign The vertical alignment of the title. Can be one of 'top', 'middle' and 'bottom'. Defaults to 'top'.
        #' @param x The x position of the subtitle relative to the alignment within chart.spacingLeft and chart.spacingRight. Defaults to 0.0.
        #' @param y The y position of the subtitle relative to the alignment within chart.spacingTop and chart.spacingBottom. Defaults to 15.0.
        subtitle = function(text = NULL, 
                         align = "center", 
                         floating = FALSE, 
                         margin = 15, 
                         style = NULL, 
                         useHTML = FALSE, 
                         verticalAlign = "top", 
                         x = 0, 
                         y = 15) {
            options$subtitle <<- list(text = text, align = align, floating = floating, margin = margin, 
                                        style = style, useHTML = useHTML, verticalAlign = verticalAlign, x = x, y = y)
        },

        series = function(data,
                          name = NULL,
                          stack = NULL,
                          type = "line",
                          xAxis = 0.0,
                          yAxis = 0.0,
                          replace = FALSE
                          ) {
            
            add_srs <- list(data = data, 
                            name = name, 
                            stack = stack, 
                            type = type, 
                            xAxis = xAxis,
                            yAxis = yAxis)
            
            if (replace) options$series <<- list(add_srs)
            else options$series <<- c(options$series, list(add_srs))
        },
        
        #' Print chart as HTML
        #'
        #' Convert a chart object to HTML.
        #' After building a chart one usually wants to convert it to a HTML character string.
        #' The JavaScript files are included in the rHighcharts package, and thus automatically added to the HTML file.
        print = function() {
            jquery_js <- file.path(system.file(package = "rHighcharts"), "jquery.min.js")
            highcharts_js <- file.path(system.file(package = "rHighcharts"), "highcharts.js")
            html <- sprintf("\n<script type=\"text/javascript\">%s</script>\n\n<script type=\"text/javascript\">jQuery.noConflict();</script>\n\n<script type=\"text/javascript\">%s</script>\n\n<script type=\"text/javascript\">\n(function($){ $(function () { var chart = new Highcharts.Chart(%s);});})(jQuery);\n</script>\n\n<div id=\"highchart\"></div>", 
                            readChar(jquery_js, file.info(jquery_js)$size), readChar(highcharts_js, file.info(highcharts_js)$size), 
                            RJSONIO:::toJSON(options))
            return(html)
        }
    )
)
