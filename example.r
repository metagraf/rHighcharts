        df <- data.frame(USPersonalExpenditure)
        colnames(df) <- paste("Year", substr(colnames(df), 2, 5))
        
        a <- rHighcharts:::Chart$new()
        a$chart(type = "column")
        a$title(text = "Personal Expenditures")
        
        a$xAxis(categories = rownames(df))
        a$yAxis(title = list(text = "Expenditures"))
        
        a$data(df)
        a
        