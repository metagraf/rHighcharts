\name{includeJS}
\alias{includeJS}
\title{Highcharts JavaScript files to character string}
\usage{
  includeJS()
}
\description{
  The function returns all necessary Highcharts JavaScript
  files code as a HTML character string. For example, it is
  used in the \code{chartOutput} function. rHighcharts does
  not include jQuery since it is already attached within
  the Shiny package.
}

