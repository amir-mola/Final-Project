library(httr)
library(jsonlite)
source("./scripts/api.R")
library(shiny)
library(plotly)
library(lubridate)

data <- read.csv("data/tmdb_data.csv", stringsAsFactors = FALSE)
a <- ymd(data$release_date)
data$release_year <- year(a)
data <- arrange(data, -release_year)

response <- GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

shinyUI(navbarPage(
  "Information about movies",
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
                     choices = c("", genre_list$name)),
         sliderInput("slider1", label = "Please select a year range", min = 1920, 
                     max = 2020, value = c(1930, 2020)),
         sliderInput("slider2", label = "Please select a rating range", min = 0, 
                      max = 10, value = c(0, 10))
       ),
       mainPanel(plotlyOutput("scatterplot"))
     )
  ),
                    
  tabPanel(
     "barplot",
     titlePanel("genres by year"),
     sidebarLayout(
       sidebarPanel(
        selectInput("yearvar", label = "Please select release year", choices = data$release_year, selected = 4)
       ),
      mainPanel(plotlyOutput("barplot"))
     )
  )
))
