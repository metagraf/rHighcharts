shinyServer(function(input, output) {
    output$show <- renderText({
        chart_html  # global variable set by the Chart-class
    })
})
