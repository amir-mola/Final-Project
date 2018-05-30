library(httr)
library(jsonlite)
library(dplyr)
library(plotly)
source("api.R")

scatter_plot <- function(dataset, year_start, year_end, genre, rating_low,
                         rating_high) {
  # create new column called "release_year", get rid of NA for "release_year"
  # column
  dataset$release_year <- as.numeric(format(as.Date(dataset$release_date,
                                                    "%Y-%m-%d"), "%Y"))
  completeVec <- complete.cases(dataset[, "release_year"])
  dataset <- dataset[completeVec, ]

  # get genre list
  response <-
    GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=",
               api_key))
  response_content <- content(response, type = "text")
  genre_list <- fromJSON(response_content)$genres

  # get language list
  response_ <-
    GET(paste0("https://api.themoviedb.org/3/configuration/languages?api_key=",
               api_key))
  response_content_ <- content(response_, type = "text")
  language_list <- fromJSON(response_content_)

  # join dataset with language list
  language_list$original_language <- language_list$iso_639_1
  language <- language_list %>% select(original_language, english_name)
  dataset <- full_join(dataset, language)

  # max for x-axis and y-axis
  xmax <- max(dataset$release_year)
  ymax <- max(dataset$vote_average)

  # filter dataset
  if (genre != "") {
    genre <- as.character(genre_list[genre_list$name == genre, ]$id)
  }
  new_data <- dataset %>%
    filter(release_year >= year_start & release_year <= year_end) %>%
    filter(grepl(genre, genre_ids)) %>%
    filter(vote_average >= rating_low & vote_average <= rating_high)

  # scatter plot
  plot_ly(new_data,
    x = ~ release_year, y = ~ vote_average, hoverinfo = "text",
    text = ~ paste(
      "Movie: ", title, " (", original_title, ")", "<br>Year: ", release_date,
      "<br>Rating: ", vote_average, "<br>Language: ",
      english_name
    ),
    color = ~ english_name,
    mode = "markers", marker = list(opacity = .7, size = 10)
  ) %>%
    layout(
      title = "Movie Release Year vs Vote Average",
      xaxis = list(range = c(1920, xmax), title = "Release Year"),
      yaxis = list(range = c(0, ymax), title = "Vote Average")
    ) %>%
    return()
}
