shinyUI(bootstrapPage(
        HTML(javascript()),  # include all necessary javascript files
        htmlOutput("show")
))