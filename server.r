library(rHighcharts)
library(MASS)

shinyServer(function(input, output) {
    output$chart <- reactiveText(function() {
        
        a <- rHighcharts:::Chart$new()
        
        a$chart(inverted = FALSE, type = "scatter")
        a$title(text = "Survey")
        a$subtitle(text = "Data from 2002 to 2012")
        a$xAxis(title = list(text = "Age"))
        a$yAxis(title = list(text = "Pulse"))

        #a$data(survey)  # Example 1
        
        a$data(x = survey$Age, y = survey$Pulse)  # Example 2a
        a$data(x = survey$Age + 25, y = survey$Pulse, name = "fixed data")  # Example 2b
        
        a$print()
        
        
    })
})
