library(plotly)
library(stringr)
library(dplyr)
library(lubridate)
library(httr)
library(jsonlite)
source("scripts/api.R")

data <- read.csv("data/tmdb_data.csv", stringsAsFactors = FALSE)

##Add a coloumn for just the release year
a = ymd(data$release_date)
data$release_year <- year(a)

##Get genre from the genre id
response <- GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

data <- select(data, title, release_year, genre_ids) 
action <- data[grepl("28", data$genre_ids),]
adventure <- data[grepl("12", data$genre_ids),]
animation <- data[grepl("16", data$genre_ids),]
comedy <-data[grepl("35", data$genre_ids),]



build_bar <- function(data, yearvar) {
  action <- filter(action, release_year == yearvar)
  action_count <- nrow(action)
  adventure <- filter(adventure, release_year == yearvar)
  adventure_count <- nrow(adventure)
  animation <- filter(animation, release_year == yearvar)
  animation_count <- nrow(animation)
    
  # a function to create a bar chart
  plot_ly(data,
          x = ~ yearvar, y = ~ action_count, type = "bar",
           name = "Action"
  ) %>%
    add_trace(y = ~ adventure_count, name = "Adventure") %>%
    add_trace(y = ~ animation_count, name = "Animation") %>%
    layout(
      yaxis = list(title = "count", xaxis = list(title = "Release Year"),
                   barmode = "Group")
    )
}


build_graph2 <- function(df, statevar2) {
  race_df <- filter(df, state == statevar2)
  # a function to create a bar chart
  plot_ly(race_df,
          x = ~ statevar2, y = ~ White, type = "bar",
          name = "White"
  ) %>%
    add_trace(y = ~ Black, name = "Black") %>%
    add_trace(y = ~ Native_American, name = "Native American") %>%
    add_trace(y = ~ Asian, name = "Asian") %>%
    add_trace(y = ~ Other, name = "Other") %>%
    layout(
      yaxis = list(title = "People"), xaxis = list(title = "State"),
      barmode = "Group"
    )
}
