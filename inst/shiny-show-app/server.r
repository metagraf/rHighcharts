shinyServer(function(input, output) {
    output$show <- renderText({
        readChar(tmp, file.info(tmp)$size)  # read chart html from tempfile
    })
})
