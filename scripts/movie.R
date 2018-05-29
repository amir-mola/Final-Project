library(httr)
library(jsonlite)
source("api.R")
movie_id <- 383498

  base_url <- "https://api.themoviedb.org"
  resource <- paste0("/3/movie/", movie_id,"?api_key=", api_key)
  url_full <- paste0(base_url, resource)
  


  response <- GET(url_full)
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)$results
   
  