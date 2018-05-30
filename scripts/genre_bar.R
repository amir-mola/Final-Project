##Set up
library(plotly)
library(stringr)
library(dplyr)
library(lubridate)
library(httr)
library(jsonlite)
source("scripts/api.R")

data <- read.csv("data/tmdb_data.csv", stringsAsFactors = FALSE)

## Add a coloumn for just the release year
a <- ymd(data$release_date)
data$release_year <- year(a)

## Get genre from the genre id
response <- GET(paste0(
  "https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key
))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

## Make dataframe for each genre
data <- select(data, title, release_year, genre_ids)
action <- data[grepl("28", data$genre_ids), ]
adventure <- data[grepl("12", data$genre_ids), ]
animation <- data[grepl("16", data$genre_ids), ]
comedy <- data[grepl("35", data$genre_ids), ]
crime <- data[grepl("80", data$genre_ids), ]
documentary <- data[grepl("99", data$genre_ids), ]
drama <- data[grepl("18", data$genre_ids), ]
family <- data[grepl("10751", data$genre_ids), ]
fantasy <- data[grepl("14", data$genre_ids), ]
history <- data[grepl("36", data$genre_ids), ]
horror <- data[grepl("27", data$genre_ids), ]
music <- data[grepl("10402", data$genre_ids), ]
mystery <- data[grepl("9648", data$genre_ids), ]
romance <- data[grepl("10749", data$genre_ids), ]
sci_fi <- data[grepl("878", data$genre_ids), ]
tv <- data[grepl("10770", data$genre_ids), ]
thriller <- data[grepl("53", data$genre_ids), ]
war <- data[grepl("10752", data$genre_ids), ]
western <- data[grepl("37", data$genre_ids), ]

# Build bar graph
build_graph <- function(data, yearvar) {
  ## Filter out genre to the specific year and count how many movies there are
  action <- filter(action, release_year == yearvar)
  action_count <- if(nrow(action) > 0) {
    action_count <- nrow(action)
  } else {
    action_count <- 0
  }
  adventure <- filter(adventure, release_year == yearvar)
  adventure_count <- if(nrow(adventure) > 0) {
    adventure_count <- nrow(adventure)
  } else {
    adventure_count <- 0
  }
  animation <- filter(animation, release_year == yearvar)
  animation_count <- if(nrow(animation) > 0) {
    animation_count <- nrow(animation)
  } else {
    animation_count <- 0
  }
  comedy <- filter(comedy, release_year == yearvar)
  comedy_count <- if(nrow(comedy) > 0) {
    comedy_count <- nrow(comedy)
  } else {
    comedy_count <- 0
  }
  crime <- filter(crime, release_year == yearvar)
  crime_count <- if(nrow(crime) > 0) {
    crime_count <- nrow(crime)
  } else {
    crime_count <- 0
  }
  documentary <- filter(documentary, release_year == yearvar)
  doc_count <- if(nrow(documentary) > 0) {
    doc_count <- nrow(documentary)
  } else {
    doc_count <- 0
  }
  drama <- filter(drama, release_year == yearvar)
  drama_count <- if(nrow(drama) > 0) {
    drama_count <- nrow(drama)
  } else {
    drama_count <- 0
  }
  family <- filter(family, release_year == yearvar)
  fam_count <- if(nrow(family) > 0) {
    fam_count <- nrow(family)
  } else {
    fam_count <- 0
  }
  fantasy <- filter(fantasy, release_year == yearvar)
  fantasy_count <- if(nrow(fantasy) > 0) {
    fantasy_count <- nrow(fantasy)
  } else {
    fantasy_count <- 0
  }
  history <- filter(history, release_year == yearvar)
  hist_count <- if(nrow(history) > 0) {
    hist_count <- nrow(history)
  } else {
    hist_count <- 0
  }
  horror <- filter(horror, release_year == yearvar)
  horror_count <- if(nrow(horror) > 0) {
    horror_count <- nrow(horror)
  } else {
    horror_count <- 0
  }
  music <- filter(music, release_year == yearvar)
  music_count <- if(nrow(music) > 0) {
    music_count <- nrow(music)
  } else {
    music_count <- 0
  }
  mystery <- filter(mystery, release_year == yearvar)
  mystery_count <- if(nrow(mystery) > 0) {
    mystery_count <- nrow(mystery)
  } else {
    mystery_count <- 0
  }
  romance <- filter(romance, release_year == yearvar)
  rom_count <- if(nrow(romance) > 0) {
    rom_count <- nrow(romance)
  } else {
    rom_count <- 0
  }
  sci_fi <- filter(sci_fi, release_year == yearvar)
  sci_fi_count <- if(nrow(sci_fi) > 0) {
    sci_fi_count <- nrow(sci_fi)
  } else {
    sci_fi_count <- 0
  }
  tv <- filter(tv, release_year == yearvar)
  tv_count <- if(nrow(tv) > 0) {
    tv_count <- nrow(tv)
  } else {
    tv_count <- 0
  }
  thriller <- filter(thriller, release_year == yearvar)
  thriller_count <- if(nrow(thriller) > 0) {
    thriller_count <- nrow(thriller)
  } else {
    thrilker_count <- 0
  }
  war <- filter(war, release_year == yearvar)
  war_count <- if(nrow(war) > 0) {
    war_count <- nrow(war)
  } else {
    war_count <- 0
  }
  western <- filter(western, release_year == yearvar)
  western_count <- if(nrow(western) > 0) {
    western_count <- nrow(western)
  } else {
    western_count <- 0
  }
  
  ## Use genre count data to make the bar graph
  plot_ly(data,
    x = ~ yearvar, y = ~ action_count, type = "bar",
    name = "Action"
  ) %>%
    add_trace(y = ~ adventure_count, name = "Adventure") %>%
    add_trace(y = ~ animation_count, name = "Animation") %>%
    add_trace(y = ~ comedy_count, name = "Comedy") %>%
    add_trace(y = ~ crime_count, name = "Crime") %>%
    add_trace(y = ~ doc_count, name = "Documentary") %>%
    add_trace(y = ~ drama_count, name = "Drama") %>%
    add_trace(y = ~ fam_count, name = "Family") %>%
    add_trace(y = ~ fantasy_count, name = "Fantasy") %>%
    add_trace(y = ~ hist_count, name = "History") %>%
    add_trace(y = ~ horror_count, name = "Horror") %>%
    add_trace(y = ~ music_count, name = "Music") %>%
    add_trace(y = ~ mystery_count, name = "Mystery") %>%
    add_trace(y = ~ rom_count, name = "Romance") %>%
    add_trace(y = ~ sci_fi_count, name = "Sci-Fi") %>%
    add_trace(y = ~ tv_count, name = "TV") %>%
    add_trace(y = ~ thriller_count, name = "Thriller") %>%
    add_trace(y = ~ western_count, name = "Western") %>%
    add_trace(y = ~ war_count, name = "War") %>%
    layout(
      yaxis = list(title = "Count", range = c(0,max(adventure_count, animation_count,
                                                    comedy_count, crime_count, doc_count,
                                                    drama_count, fam_count, fantasy_count,
                                                    hist_count, horror_count, music_count,
                                                    mystery_count, rom_count, sci_fi_count,
                                                    tv_count, thriller_count, western_count,
                                                    war_count))),
      xaxis = list(title = "Release Year"),
      barmode = "Group"
    )
}
