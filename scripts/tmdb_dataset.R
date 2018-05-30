library(httr)
library(jsonlite)
source("api.R")

# get the full url
pagenum <- 1
url <- function(pagenum) {
  base_url <- "https://api.themoviedb.org"
  resource <- paste0(
    "/3/discover/movie?api_key=", api_key,
    "&sort_by=popularity.desc&page=", pagenum
  )
  url_full <- paste0(base_url, resource)
  return(url_full)
}

# get one page dataset
get_data <- function(pagenum) {
  response <- GET(url(pagenum))
  response_content <- content(response, type = "text")
  body <- fromJSON(response_content)
  return(body)
}

# get 40 pages of dataset at each time, take 15 seconds to get another 40 pages
make_csv <- function(first_page, total_page) {
  last_page <- get_data(first_page)
  for (i in first_page + 1:total_page) {
    last_page <- rbind(last_page, get_data(i))
  }
  return(last_page)
}

page1 <- make_csv(1, 40)
page2 <- make_csv(41, 80)
tmdb_data <- rbind(page1, page2)
tmdb_data$genre_ids <- vapply(tmdb_data$genre_ids, paste,
  collapse = ", ",
  character(1L)
)
write.csv(tmdb_data, file = "data/tmdb_data.csv", row.names = FALSE)
