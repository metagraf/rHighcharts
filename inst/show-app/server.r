shinyServer(function(input, output) {
    output$show <- renderChart({
        .chart_object
    })
})
