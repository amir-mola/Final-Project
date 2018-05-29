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

response <- GET(paste0("https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres


data_summary <- group_by(data, release_year) %>%
  summarise(
    Under_Poverty_Child = mean(percchildbelowpovert, na.rm = TRUE),
    Under_Poverty_Adult = mean(percadultpoverty, na.rm = TRUE),
    Under_Poverty_Elderly = mean(percelderlypoverty, na.rm = TRUE)
  )
