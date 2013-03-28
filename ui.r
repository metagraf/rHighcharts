require(shiny)
require(rHighcharts)

shinyUI(bootstrapPage(
    mainPanel(
        chart_js(),
        h2("rHighcharts: An R wrapper for Highcharts JS"),
        p(HTML('<a href="https://github.com/metagraf/rHighcharts">https://github.com/metagraf/rHighcharts</a>')),
        p("rHighcharts package is an R wrapper for the Highcharts JS, which is a JavaScript charting library based on SVG and VML rendering by Highsoft Solutions AS. Highcharts JS is not free for commercial use, so make sure you have a valid license to use it."),
        p("rHighcharts is packaged with Highcharts JS v3.0.0."),
        h4("Installation"),
        pre('
            library(devtools)
            install_github("rHighcharts", "metagraf")'),
        h3("Examples"),
        p("We will introduce with some examples on how to use rHighcharts."),
        h4("Column chart"),
        pre(
            'require(rHighcharts)
            
            # Prepare data
            x <- data.frame(USPersonalExpenditure)
            colnames(x) <- substr(colnames(x), 2, 5)
            
            # Create new chart
            a <- rHighcharts:::Chart$new()
            
            # Set options
            a$chart(type = "column")
            a$title(text = "US Personal Expenditure")
            a$xAxis(categories = rownames(x))
            a$yAxis(title = list(text = "Billions of dollars"))
            
            a$data(x)  # add data
            a  # a$show()'),
        htmlOutput("column"),
        
        h4("Bar chart"),
        pre(
            'a <- rHighcharts:::Chart$new()
            a$chart(type = "bar")
            a$plotOptions(column = list(stacking = "normal"))
            a$xAxis(categories = rownames(x))
            a$title(text = "US Personal Expenditure")
            a$yAxis(title = list(text = "US dollars"))
            
            x <- as.data.frame(t(USPersonalExpenditure))
            a$data(x)
            a'),
        htmlOutput("stacked"),
        
        h4("Pie chart"),
        pre(
            'a <- rHighcharts:::Chart$new()
            a$title(text = "Fruits")
            a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "Amount")
            a'),
htmlOutput("fruits"),

h4("Scatter plot"),
pre(
'a <- rHighcharts:::Chart$new()
a$title(text = "Student Survey Data")
a$subtitle(text = "Venables, W. N. and Ripley, B. D. (1999) Modern Applied Statistics with S-PLUS")
a$chart(type = "scatter")
a$legend(align = "right", verticalAlign = "middle", layout = "vertical")
a$xAxis(title = list(text= "Age"))
a$yAxis(title = list(text= "Pulse"))

x <- subset(MASS::survey, !is.na(Sex) & Age <= 20)
plyr::ddply(x, .(Sex), function(x) {
a$data(x = x$Age, y = x$Pulse, name = unique(x$Sex))
return(NULL)
})
a'),
htmlOutput("scatter"),        

h3("License"),
p("rHighcharts is licensed under GPL-2. However, the Highcharts JavaScript library that is included in this package is not free for commercial use. Read more about its license at http://www.highcharts.com/license.")
)
))
