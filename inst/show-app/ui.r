require(rHighcharts)
shinyUI(bootstrapPage(
        chart_js(),
        htmlOutput("show")
))