library(shiny)
library(dplyr)
library(plotly)
library(lubridate)

source("scripts/scatter_plot.R")
source("scripts/movie.R")
source("scripts/genre_bar.R")
source("api.R")

data <- read.csv("data/tmdb_data.csv", stringsAsFactor = FALSE)
a <- ymd(data$release_date)
data$release_year <- year(a)

shinyServer(function(input, output) {
  output$scatterplot <- renderPlotly({
    return(scatter_plot(
      data, min(input$slider1), max(input$slider1),
      input$genre, min(input$slider2),
      max(input$slider2)
    ))
  })

  output$barplot <- renderPlotly({
    return(build_graph(data, input$yearvar))
  })

  output$three_d_plot <- renderPlotly({
    return(three_d_rec(data, as.character(input$movie)))
  })
})
