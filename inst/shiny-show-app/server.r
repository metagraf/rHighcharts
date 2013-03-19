library(shiny)
library(rHighcharts)

shinyServer(function(input, output) {
    
    output$show <- renderText({
        
        df <- data.frame(USPersonalExpenditure)
        colnames(df) <- paste("Year", substr(colnames(df), 2, 5))
        
        a <- rHighcharts:::Chart$new()
        a$chart(type = "column")
        a$title(text = "Personal Expenditures")
        a$subtitle(text = as.character(input$obs))
        
        a$xAxis(categories = rownames(df))
        a$yAxis(title = list(text = "Expenditures"))
        
        a$data(df)
        a$print()
    })
})
