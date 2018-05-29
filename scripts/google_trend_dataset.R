library(gtrendsR)
library(dplyr)




# get 41-80 pages, should be 800 rows, if not wait 20 seconds to run the code

data <- read.csv("../data/tmdb_data.csv")

# for one movie
google_trend <- function(dataset, row_num) {
  movie_name <- dataset[row_num,]$title
  data <- gtrends(movie_name, geo = "US")$interest_by_region
  data_rotate <- data.frame(t(data))
  colnames(data_rotate) <- as.character(unlist(data_rotate[1,]))
  data_rotate$movie <- movie_name
  data_rotate <- data_rotate %>% select(movie, everything())
  data_rotate <- data_rotate["hit",]
  rownames(data_rotate) <- NULL
  return(data_rotate)
}

# combine all 1600 movies
google_data <- function(dataset) {
  first <- google_trend(dataset, 1)
  for (i in 2:nrow(dataset)) {
    first <- rbind(first, google_trend(dataset, i))
  }
  return(first)
}