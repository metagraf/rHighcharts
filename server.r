library(charts)
library(MASS)

shinyServer(function(input, output) {
    output$chart <- reactiveText(function() {
        
        a <- charts:::Chart$new()
        a$chart(inverted = FALSE, type = "line")
        a$title(text = "Survey")
        a$subtitle(text = "Data from 2002 to 2012")
        a$xAxis(title = list(text = "Age"))
        a$yAxis(title = list(text = "Pulse"), type = "logarithmic")
        a$data(x = c(1,2,3,5), y = c(10,54,21,65))  # Example 2a
        a$print()
    
    })
})
