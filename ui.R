library(httr)
library(jsonlite)
source("./scripts/api.R")
library(shiny)
library(plotly)
library(lubridate)

data <- read.csv("./data/tmdb_data.csv", stringsAsFactors = FALSE)
a <- ymd(data$release_date)
data$release_year <- year(a)
data <- arrange(data, -release_year)

response <- GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

shinyUI(navbarPage(
  theme = "style.css",
  "Information about movies",
  tabPanel(
    "Summary",
    titlePanel("Summary of movie dataset"),
    tags$div(
      tags$h2("Project Overview"), 
      tags$p("This report demonstrates an overview of movie titles, popularities, and genres. The purpose of the report is to provide information regarding highly rated movies so that the viewer can see which year released multiple hits, which genres are popular, and which movie they should watch given their preferences. We believe that the production side of the movie industry could heavily benefit from our data, as it will show general trends amongst movies.
             "), 
      tags$h2("Audience"), 
      tags$p("While most people enjoy watching movies, our group narrowed down our audience to movie producers who are interested in seeing what kinds are movies are highly ranked and if trends differ depending on year. We also intend movie enthusiasts to benefit from our data as they could find movie ratings and recommendations.
"), 
      tags$h2("Data"),
      tags$p("Using an API from TMBD, we created a dataset that includes 1600 movie titles from 1931 to 2018. Along with the title, other critical information that our data contains are a vote count, vote average, popularity, original language, genre ids, and overview. 
")
      
    )
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
  ),
  tabPanel(
    "threeDplot",
    titlePanel("movie recommandations"),
    sidebarLayout(
      sidebarPanel( 
        selectInput("movie_name", label = "Please select a movie", choices = data$title, selected = "Deadpool 2")
      ),
      mainPanel(plotlyOutput("threeDplot"))
    )
  )
))
