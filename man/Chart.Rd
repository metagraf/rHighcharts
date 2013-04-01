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
  Highcharts and jQuery); however, when used with Shiny,
  those are included by using \code{chart_js()}. When
  plotting an object interactively with \code{show()}, all
  necessary files are automatically included.
}

\section{Further documentation}{
  For more documentation on the specific Highcharts
  methods, please visit
  \url{http://api.highcharts.com/highcharts}.
}

