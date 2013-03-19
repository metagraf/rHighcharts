library(shiny)
library(rHighcharts)

df <- data.frame(USPersonalExpenditure)
colnames(df) <- paste("Year", substr(colnames(df), 2, 5))

shinyServer(function(input, output) {
    output$barchart <- renderChart({
        a <- rHighcharts:::Chart$new()
        a$chart(type = "bar")
        a$title(text = as.character(input$obs))
        a$xAxis(categories = rownames(df))
        a$yAxis(title = list(text = "Expenditures"))
        a$data(df)
        return(a)
    })
    output$colchart <- renderChart({
        a <- rHighcharts:::Chart$new()
        a$chart(type = "column")
        a$data(df)
        return(a)
    })
})
