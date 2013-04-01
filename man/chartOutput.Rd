\name{chartOutput}
\alias{chartOutput}
\title{chartOutput (use with Shiny)}
\usage{
  chartOutput(outputId)
}
\arguments{
  \item{outputId}{output variable to read the value from}
}
\description{
  Use rHighchart charts as Shiny output. First, use
  renderChart in server.R to assign the chart object to an
  Shiny output. Then create an chartOutput with the same
  name in ui.R. chartOutput is currently just an alias for
  htmlOutput.
}

