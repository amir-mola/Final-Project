library(httr)
library(jsonlite)
library(dplyr)
library(plotly)
source("scripts/api.R")

# returns a 3d plot of the recommended movies based on their vote count,
# vote average and date of released
three_d_rec <- function(data, movie_name){
  movie <- filter(data, title == movie_name)
  movie_id <- movie$id
  
  url <- paste0("https://api.themoviedb.org/3/movie/", movie_id,
                "/recommendations?api_key=", api_key)
  response <- GET(url)
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)
  
  dataset <- as.data.frame(body$results)
  if(nrow(dataset) == 0){
    p <- plot_ly(dataset, x = ~0, y = ~0, z = ~0, 
             text = ~"No Recommendation found") %>% 
      add_markers() %>%
      layout(title = "No Recommendation found")
      return(p)
  }else {
  p <- plot_ly(dataset, x = ~vote_count, y = ~vote_average, z = ~release_date, 
             text = ~original_title,
  marker = list(color = ~vote_average, colorscale = c('#FFE1A1', '#683531'),
                showscale = TRUE)) %>%
  add_markers() %>%
  layout(title = "Recommendation Analysis", scene = list(
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
  return(p)
  }
}


