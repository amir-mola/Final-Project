library(httr)
library(jsonlite)
library(dplyr)
library(plotly)
source("scripts/api.R")

# Reads in the tmbd data file --------------------------------------------
data <- read.csv("data/tmdb_data.csv", stringsAsFactors = FALSE)


# GIven a movie name, will find the id of that movie ----------------------
id_finder <- function(movie_name){
  movie <- filter(data, title == movie_name)
  return(movie$id)
}

  
# Based on a given movie name, gets movie recommendation data -------------
get_data <- function(movie_name){
  movie_id <- id_finder(movie_name)
  url <- paste0("https://api.themoviedb.org/3/movie/", movie_id,
                "/recommendations?api_key=", api_key)
  response <- GET(url)
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)
  return(flatten(body$results))
  
}

# Returns movie recommendation based on the movie name and maximum of 20
# recommendation
recommendation <- function(movie_name, count) {
  body <- get_data(movie_name)
  if(count > 20){
    return(body[["results"]][["original_title"]])
  }else{
    return(head(body[["results"]][["original_title"]], count))
  }
}

# returns a 3d plot of the recommended movies based on their vote count,
# vote average and date of released
three_d_rec <- function(movie_name){
  dataset <- get_data(movie_name)
  plot_ly(dataset, x = ~vote_count, y = ~vote_average, z = ~release_date, 
             text = ~original_title,
  marker = list(color = ~vote_average, colorscale = c('#FFE1A1', '#683531'),
                showscale = TRUE)) %>%
  add_markers() %>%
  layout(title = "Recommendation Analysis", scene = list(scene="amir",
                      xaxis = list(title = 'Vote Average'),
                      yaxis = list(title = 'Vote Count'),
                      zaxis = list(title = 'Date')),
         annotations = list(
           x = 1.13,
           y = 1.05,
           text = 'Vote Average',
           xref = 'paper',
           yref = 'paper',
           showarrow = FALSE
         ))
}


