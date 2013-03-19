\name{renderChart}
\alias{renderChart}
\title{Render Chart.js}
\usage{
  renderChart(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
  \item{expr}{An expression that returns a rchartjs
  object.}

  \item{env}{The environment in which to evaluate expr.}

  \item{quoted}{If it is a qouted expression.}
}
\description{
  Render Chart.js graphs as Shiny output. Wrap a list
  object (with json options) in server.R. Then use
  htmlOutput in the ui.R.
}

