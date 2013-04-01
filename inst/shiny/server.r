require(rHighcharts)
shinyServer(function(input, output) {
    output$show <- renderChart({
        return(.chart_object)
    })
})
