library(httr)
library(jsonlite)
source("api.R")

# get the full url
url <- function(pagenum) {
  base_url <- "https://api.themoviedb.org"
  resource <- paste0("/3/discover/movie?api_key=", api_key, "&sort_by=popularity.desc&page=", pagenum)
  url_full <- paste0(base_url, resource)
}

# get one page dataset 
get_data <- function(pagenum) {
  response <- GET(url(pagenum))
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)$results
}

# get more page of dataset
make_csv <- function(pagenum) {
  last_page <- get_data(1)
  for (i in 2:pagenum) {
    last_page <- rbind(last_page, get_data(i))
  }
  return(last_page)
}

response <- GET("https://api.themoviedb.org/3/discover/movie?api_key=d0c718e2a61b92b6173965005833dea8&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=2")
response_content <- content(response, type = "text")
body <- fromJSON(response_content)

