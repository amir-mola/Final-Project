library(httr)
library(jsonlite)
source("./scripts/api.R")
library(shiny)
library(plotly)

response <- GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

my_ui <- navbarPage("Information about movies",
                    tabPanel(
                      "Summary",
                      titlePanel("Summary of movie dataset"),
                      tags$p("gfgdgdfgdf")
                    ),
                    
                    tabPanel(
                      "scatterplot",
                      titlePanel("Movie explore"),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("genre", label = "Please select a genre", 
                                      choices = genre_list$name),
                          
                          sliderInput("slider1", label = "Please select a year range", min = 1920, 
                                      max = 2020, value = c(2002, 2018)),
                          
                          sliderInput("slider2", label = "Please select a rating range", min = 0, 
                                      max = 10, value = c(2, 6))
                            ),
                      mainPanel(plotlyOutput("scatterplot"))
                        )
                          ),
                    
                    tabPanel(
                      "barplot",
                      titlePanel("genres by year"),
                      sidebarLayout(
                        sidebarPanel(
                          numericInput("released_year", label = "Please select a released year", 
                                      value = "")
                        ),
                        mainPanel(plotlyOutput("barplot"))
                      )
                    )
                      )

shinyUI(my_ui)
