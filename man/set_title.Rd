\docType{methods}
\name{set_title}
\alias{set_title}
\title{Set a new title for the chart}
\arguments{
  \item{object}{Chart object}

  \item{text}{The title of the chart. To disable the title,
  set the text to NULL. Defaults to NULL.}

  \item{align}{The horizontal alignment of the title. Can
  be one of 'left', 'center' and 'right'. Defaults to
  'center'.}

  \item{floating}{When the title is floating, the plot area
  will not move to make space for it. Defaults to FALSE}

  \item{margin}{The margin between the title and the plot
  area, or if a subtitle is present, the margin between the
  subtitle and the plot area. Defaults to 15.0.}

  \item{style}{CSS styles for the title. Use this for font
  styling, but use align, x and yfor text alignment.
  Defaults to: list(color: '#3E576F', fontSize: '16px').}

  \item{useHTML}{Whether to use HTML to render the title
  text. Using HTML allows for advanced formatting, images
  and reliable bi-directional text rendering. Note that
  exported images won't respect the HTML. Defaults to
  FALSE.}

  \item{verticalAlign}{The vertical alignment of the title.
  Can be one of 'top', 'middle' and 'bottom'. Defaults to
  'top'.}

  \item{x}{The x position of the title relative to the
  alignment within chart.spacingLeft and
  chart.spacingRight. Defaults to 0.0.}

  \item{y}{The y position of the title relative to the
  alignment within chart.spacingTop and
  chart.spacingBottom. Defaults to 15.0.}
}
\description{
  For more information:
  http://api.highcharts.com/highcharts#title
}

