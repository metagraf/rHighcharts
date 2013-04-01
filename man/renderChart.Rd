\name{renderChart}
\alias{renderChart}
\title{renderChart (use with Shiny)}
\usage{
  renderChart(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
  \item{expr}{An expression that returns a chart object}

  \item{env}{The environment in which to evaluate the
  expression.}

  \item{quoted}{Is expr a quoted expression (with quote())?
  This is useful if you want to save an expression in a
  variable.}
}
\description{
  Use rHighchart charts as Shiny output. First, use
  renderChart in server.R to assign the chart object to an
  Shiny output. Then create an chartOutput with the same
  name in ui.R. chartOutput is currently just an alias for
  htmlOutput.
}

