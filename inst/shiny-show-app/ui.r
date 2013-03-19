library(shiny)
library(rHighcharts)

shinyUI(bootstrapPage(
        HTML(javascript()),
        htmlOutput("show")
))