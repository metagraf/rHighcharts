# rHighcharts

rHighcharts package is an R wrapper for the [Highcharts JS](https://github.com/highslide-software/highcharts.com), which is a JavaScript charting library based on SVG and VML rendering by [Highsoft Solutions AS](http://highsoft.com/). Highcharts JS is not free for commercial use, so make sure you have a valid license to use it.

rHighcharts is packaged with Highcharts JS v2.3.3 and jQuery v1.7.1.

## Installation

    library(devtools)
    install_github("rHighcharts", "reinholdsson")
    
## Example

See the example below for a simple illustration of how to use this package with a shiny web server. 

    library(shiny)
    runGist(4242266)

![](http://cloud.github.com/downloads/reinholdsson/rHighcharts/rHighcharts-app-screenshot.png)

The example is also available live at [http://glimmer.rstudio.com/reinholdsson/rHighcharts-app-1/](http://glimmer.rstudio.com/reinholdsson/rHighcharts-app-1/) and the code can be found at at [https://gist.github.com/4242266](https://gist.github.com/4242266).

## License

rHighcharts is licensed under [GPL-2](http://www.gnu.org/licenses/gpl-2.0.html). However, the Highcharts JavaScript library that is included in this package is **not free** for commercial use. Read more about its license at [http://www.highcharts.com/license](http://www.highcharts.com/license).
