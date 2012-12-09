# rHighcharts

An R package to generate Highcharts graphs from within R. The package depends on the [Highcharts JS](https://github.com/highslide-software/highcharts.com), a JavaScript charting library based on SVG and VML rendering, by [Highsoft Solutions AS](http://highsoft.com/).

rHighcharts is packaged with Highcharts JS v2.3.3 and jQuery v1.7.1.

## Installation

    library(devtools)
    install_github("rHighcharts", "reinholdsson")
    
## Example

See the example below for a simple illustration of how to use this package with a shiny web server. 

    library(shiny)
    runGist(4242266)

![](http://cloud.github.com/downloads/reinholdsson/rHighcharts/rHighcharts-app-screenshot.png)

The code for this example is available at [https://gist.github.com/4242266](https://gist.github.com/4242266).

## License

rHighcharts JS is released under the [GPL-2](http://www.gnu.org/licenses/gpl-2.0.html) licence. However, [Highcharts JS](https://github.com/highslide-software/highcharts.com), which is included in this package, is not free for commercial use. Read more about the Highcharts licence at [http://www.highcharts.com/license](http://www.highcharts.com/license).