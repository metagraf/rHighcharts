\name{Chart}
\alias{Chart}
\title{Chart class}
\description{
  The Chart class is a wrapper for the Highcharts API. It
  also includes \code{data()} and \code{html()} to extend
  with some additional functionality specific for R users.
}
\section{\code{data()}}{
  A method that may take either vectors or data frames as
  input.
}

\section{\code{html()}}{
  A method to convert the chart object to HTML code. The
  code does not include necessary JavaScript files (e.g.
  Highcharts and jQuery); however, when used interactively
  (\code{show()}) or with Shiny, those are automatically
  included.
}

\section{Further documentation}{
  For more documentation on the specific Highcharts
  methods, please visit
  \url{http://api.highcharts.com/highcharts}.
}
\examples{
\dontrun{

library(rHighcharts)

### Bar chart
a <- rHighcharts:::Chart$new()
a$chart(type = "bar")
a$plotOptions(column = list(stacking = "normal"))
a$title(text = "US Personal Expenditure")
a$yAxis(title = list(text = "US dollars"))
x <- as.data.frame(t(USPersonalExpenditure))
a$xAxis(categories = rownames(x))
a$data(x)
a  # show chart in browser

### Pie chart
a <- rHighcharts:::Chart$new()
a$title(text = "Fruits")
a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "amount")
a
}
}

