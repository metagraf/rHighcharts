require(shiny)
require(rHighcharts)
require(plyr)

shinyServer(function(input, output) {
    output$stacked <- renderChart({
        x <- as.data.frame(t(USPersonalExpenditure))
        a <- rHighcharts:::Chart$new()
        a$chart(type = "bar")
        a$plotOptions(bar = list(stacking = "normal"))
        a$xAxis(categories = rownames(x))
        a$title(text = "US Personal Expenditure")
        a$yAxis(title = list(text = "US dollars"))
        a$data(x)
        return(a)
    })
    
    output$column <- renderChart({
        x <- data.frame(USPersonalExpenditure)
        colnames(x) <- substr(colnames(x), 2, 5)
        a <- rHighcharts:::Chart$new()
        a$chart(type = "column")
        a$title(text = "US Personal Expenditure")
        a$xAxis(categories = rownames(x))
        a$yAxis(title = list(text = "US dollars"))
        a$data(x)
        return(a)
    })
    
    output$fruits <- renderChart({
        a <- rHighcharts:::Chart$new()
        a$title(text = "Fruits")
        a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "Amount")
        return(a)
    })
    
    output$scatter <- renderChart({
        a <- rHighcharts:::Chart$new()
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
        return(a)
    })
})
