library(httr)
library(jsonlite)
source("api.R")

url <- function(movie_id){
  base_url <- "https://api.themoviedb.org"
  resource <- paste0("/3/movie/", movie_id,"?api_key=", api_key)
  url_full <- paste0(base_url, resource)
  return(url_full)
}
get_data <- function(movie_id){
  response <- GET(url(movie_id))
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)
  
  C <- body[["production_companies"]][["name"]]
  co <- body[["production_companies"]][["origin_country"]]
  con <- body[["production_companies"]][["origin_country"]]
  spl <- body[["spoken_languages"]][["iso_639_1"]]
  df <- data.frame(c,co,con,spl)
  return(df)
}