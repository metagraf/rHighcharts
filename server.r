library(charts)

shinyServer(function(input, output) {
    output$chart <- reactiveText(function() {
        
        df <- data.frame(USPersonalExpenditure)
        colnames(df) <- paste("Year", substr(colnames(df), 2, 5))
        
        a <- charts:::Chart$new()
        a$chart(type = "column")
        a$title(text = "Personal Expenditures")
        a$subtitle(text = "Data from 1940 to 1960")
        
        a$xAxis(categories = rownames(df))
        a$yAxis(title = list(text = "Expenditures"))
        
        a$data(df)
        a$print()
    
    })
})
