# rHighcharts: An R wrapper for Highcharts JS

Created by Thomas Reinholdsson (<reinholdsson@gmail.com>).

rHighcharts package is an R wrapper for the [Highcharts JS](https://github.com/highslide-software/highcharts.com), which is a JavaScript charting library based on SVG and VML rendering by [Highsoft Solutions AS](http://highsoft.com/). Highcharts JS is not free for commercial use, so make sure you have a valid license to use it.

rHighcharts is packaged with Highcharts JS v3.0.0.

## Installation

    library(devtools)
    install_github("rHighcharts", "metagraf")
    
## How to use

See instructions on the following page: [http://glimmer.rstudio.com/reinholdsson/rHighcharts/](http://glimmer.rstudio.com/reinholdsson/rHighcharts/).

## Examples

- [Simple forecasting](http://glimmer.rstudio.com/reinholdsson/savings/)
- [BI dashboard](http://glimmer.rstudio.com/reinholdsson/shiny-dashboard/)


## Use with Shiny

#### server.R
```
library(rHighcharts)
shinyServer(function(input, output) {
    output$chart <- renderChart({
        a <- rHighcharts:::Chart$new()
        a$title(text = "Fruits")
        a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "Amount")
        return(a)
    })
})
```

#### ui.R
```
library(rHighcharts)
shinyUI(bootstrapPage(
    chartOutput("chart")
))
```

## See also

- [rNVD3](https://github.com/ramnathv/rNVD3) by [Ramnath Vaidyanathan](https://github.com/ramnathv)


## License

rHighcharts is licensed under [GPL-2](http://www.gnu.org/licenses/gpl-2.0.html). However, the Highcharts JavaScript library that is included in this package is **not free** for commercial use. Read more about its license at [http://www.highcharts.com/license](http://www.highcharts.com/license).
