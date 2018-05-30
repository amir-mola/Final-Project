library(httr)
library(jsonlite)
source("api.R")
library(shiny)
library(plotly)
library(lubridate)

data <- read.csv("./data/tmdb_data.csv", stringsAsFactors = FALSE)
a <- ymd(data$release_date)
data$release_year <- year(a)
data <- arrange(data, -release_year)

response <- GET(paste0(
<<<<<<< HEAD
  "https://api.themoviedb.org/3/genre/movie/list?api_key=",
  api_key
=======
  "https://api.themoviedb.org/3/genre/movie/list?api_key=", api_key
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
))
response_content <- content(response, type = "text")
genre_list <- fromJSON(response_content)$genres

shinyUI(navbarPage(
  theme = "style.css",
  "MOVIE DATA REPORT",
  tabPanel(
    "OVERVIEW",
    tags$div(
<<<<<<< HEAD
      tags$h2("Project Overview"),
      tags$p("This report demonstrates an overview of movie titles, popularities
       , and genres. The purpose of the report is to provide information
       regarding highly rated movies so that the viewer can see which year
       released multiple hits, which genres are popular, and which movie they
       should watch given their preferences. We believe that the production side
       of the movie industry could heavily benefit from our data, as it will
       show general trends amongst movies.
             "),
      tags$h2("Audience"),
      tags$p("While most people enjoy watching movies, our group narrowed down
       our audience to movie producers who are interested in seeing what kinds
       are movies are highly ranked and if trends differ depending on year. We
       also intend movie enthusiasts to benefit from our data as they could find
       movie ratings and recommendations.
"),
      tags$h2("Data"),
      tags$p("Using an API from TMBD, we created a dataset that includes 1600
       movie titles from 1931 to 2018. Along with the title, other critical
       information that our data contains are a vote count, vote average,
       popularity, original language, genre ids, and overview. 
=======
      HTML('<center>
           <img src="https://content.mycutegraphics.com/graphics/movie/movie-night.png"
           width="400"></center>'),
      tags$h2("Project Overview"),
      tags$p("This report demonstrates an overview of movie titles,
              popularities, and genres. The purpose of the report is to provide
              information regarding highly rated movies so that the viewer can
              see which year released multiple hits, which genres are popular,
              and which movie they should watch given their preferences. We
              believe that the production side of the movie industry could
              heavily benefit from our data, as it will show general trends
              amongst movies.
             "),
      tags$h2("Audience"),
      tags$p("While most people enjoy watching movies, our group narrowed down
              our audience to movie producers who are interested in seeing what
              kinds of movies are highly ranked and if trends differ depending
              on year. We also intend movie enthusiasts to benefit from our
              data as they could find movie ratings and recommendations.
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
"),
      tags$h2("Data"),
      tags$p("Using an API from ",
             tags$a(href="https://www.themoviedb.org/documentation/api", "TMDB"),
              ", we created a dataset that includes 1600
              movie titles from 1931 to 2018. Along with the title, other
              critical information that our data contains are a vote count,
              vote average, popularity, original language, genre ids, and
              overview. "),

      tags$h2("Questions"),
      tags$li("What genres were popular in a given year?"),
      tags$li("Did certain years have more highly voted movies?"),
<<<<<<< HEAD
      tags$li("What movies are recommended given a previously liked movie
              title?"),

      tags$h2("Structure"),
      tags$li("The first tab is a scatterplot that shows"),
      tags$li("The second tab is a bar graph that provides the viewer
        information regarding release years and genres. The user selects a year
        from the side bar and is shown a bar graph of the movies released that
        year categorized by genre. Most movies have multiple genres, so there 
        are overlaps within the shown data."),
      tags$li("The last tab shows a 3D plot of maximum of 20 recommended movies
       (based on the selected movie), and their vote count, vote average and
       release date."),
      tags$h2("Further Analysis"),
      tags$p("While our analysis does answer some useful questions, we can
       further analyse to answer more specific questions such as: 
"),
      tags$li("Does the  original language affect the voting ranking as some
       languages are more widely spoken?
"),
      tags$h2("Project Creators"),
      tags$li("Amir Mola"),
      tags$img(src = "https://scontent.fsea1-1.fna.fbcdn.net/v/t1.0-1/18033341
        _417189041992204_458043244687472060_n.jpg?_nc_cat=0&_nc_eui2=AeHl4Q81BR
        0RuOkZgK43sNHzeGyugdy9yucKgCnE0gbYcNyB-KuTm-cgxkpvEFozFTwmfvyNL7JMcvLbiR
        p6DmdTmt3Sz4pMOZnhrMr8P-_U-w&oh=15a95c2ea00a8588df116c50204d3543&oe=
        5BBADD44", width = "200px", height = "200px"),
      tags$li("Leona Wada"),
      tags$img(src = "https://media.licdn.com/dms/image/C4D03AQFfLeltdKQYdQ/
        profile-displayphoto-shrink_800_800/0?e=1533168000&v=beta&t=9esnBSPiB-
        lu3lrz98j_FXX5TeJaGgCMIZC4QUDWs-U", width = "200px", height = "200px"),
      tags$li("Katie Chen"),
      tags$img(src = "https://media.licdn.com/dms/image/C5603AQHh_BurGeIptQ/
        profile-displayphoto-shrink_800_800/0?e=1533168000&v=beta&t=LR8Uad5pJuw
        lzBxArst6z3Bb6COIaptqc1VID5dH_N0", width = "200px", height = "200px"),
      tags$li("Jennifer Li"),
      tags$img(src = "https://scontent-sea1-1.xx.fbcdn.net/v/t1.0-9/27067724_
       2060265067333436_3074257672452513759_n.jpg?oh=1a75daafb7fb762458c914dc26b
       5f99b&oe=5AEB5A9A", width = "200px", height = "200px")
=======
      tags$li("What movies are recommended given a previously liked movie?"),

      tags$h2("Structure"),
      tags$li("The first tab is a scatterplot that shows the relationship
               between movies’ years of release and their vote averages. The
               user is able to select the genre, year, and the vote count to
               find this relationship more in detail. The data is colored
               based on the original language of the movie. "),
      tags$li("The second tab is a bar graph that provides the viewer
               information regarding release years and genres. The user
               selects a year from the side bar and is shown a bar graph of
               the movies released that year categorized by genre. Most movies
               have multiple genres, so there are overlaps within the shown
               data."),
      tags$li("The last tab shows a 3D plot of a maximum of 20 recommended
               movies (based on a selected movie), and information regarding
               the recommended movies' vote counts, vote averages and
               release dates. "),
      tags$h2("Further Analysis"),
      tags$p("While our analysis does answer some useful questions, we can
              further analyse to answer more specific questions such as:"),
      tags$li("Does the  original language affect the voting ranking as some
            languages are more widely spoken?"),
      tags$li("Are certain movie genres voted on more than others overall?"),
      tags$li("What percent of highly voted movies are rated for adults?"),
      
      tags$h2("Project Creators"),

      tags$div(
        class = "people-container",

        tags$div(
          tags$img(
            src = "image/amir.jpg", width = "200px",
            height = "200px"
          ),
          tags$h5("Amir Mola"),
          "Sophomore",
          tags$br("Computer Science")
        ),
        tags$div(
          tags$img(
            src = "image/katie.jpg", width = "200px",
            height = "200px"
          ),
          tags$h5("Katie Chen"),
          "Junior",
          tags$br("Statistics")
        ),
        tags$div(
          tags$img(
            src = "image/leona.jpg", width = "200px",
            height = "200px"
          ),
          tags$h5("Leona Wada"),
          "Junior",
          tags$br("Economics")
        ),
        tags$div(
          tags$img(
            src = "image/jennifer.jpg", width = "200px",
            height = "200px"
          ),
          tags$h5("Jennifer Li"),
          "Sophomore",
          tags$br("Human Centered Design & Engineering")
        )
      )
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
    )
  ),

  tabPanel(
<<<<<<< HEAD
    "scatterplot",
    titlePanel("Movie explore"),
    tags$p("The first tab is a scatterplot that shows"),
    sidebarLayout(
      sidebarPanel(
        tags$p("The first tab is a scatterplot that shows"),
=======
    "SCATTER PLOT",
    titlePanel("Explore Movies by Year, Genre, and Vote Averages"),
    tags$p("The first tab is a scatterplot that shows the relationship between
            movies’ year of release and their vote average. User is able to
            select the genre, year and the vote count to find see this
            relationship more in detail. The data are colored based on the
            language of the movie."),
    sidebarLayout(
      sidebarPanel(
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
        selectInput("genre",
          label = "Please select a genre",
          choices = c("", genre_list$name)
        ),
        sliderInput("slider1",
          label = "Please select a year range", min = 1920,
          max = 2020, value = c(1930, 2020)
        ),
        sliderInput("slider2",
          label = "Please select a rating range", min = 0,
          max = 10, value = c(0, 10)
        )
      ),
      mainPanel(plotlyOutput("scatterplot"))
    )
  ),

  tabPanel(
<<<<<<< HEAD
    "barplot",
    titlePanel("genres by year"),
    tags$p("The second tab is a bar graph that provides the viewer information
      regarding release years 
      and genres. The user selects a year from the side bar and is shown a bar
      graph of the movies released that year categorized by genre. Most movies
      have multiple genres, so there are overlaps within the shown data."),
    sidebarLayout(
      sidebarPanel(
        tags$p("The second tab is a bar graph that provides the viewer 
          information regarding release years 
          and genres. The user selects a year from the side bar and is shown
          a bar graph of the movies released that year categorized by genre.
          Most movies have multiple genres, so there are overlaps within the
          shown data."),
        selectInput("yearvar",
          label = "Please select release year", choices =
            data$release_year, selected = 4
=======
    "BAR GRAPH",
    titlePanel("Movies in a Certain Year Categorized by Genre"),
    tags$p("The second tab is a bar graph that provides the viewer information
           regarding release years and genres. The user selects a year from
           the side bar and is shown a bar graph of the movies released that
           year categorized by genre. Most movies have multiple genres, so
           there are overlaps within the shown data."),
    sidebarLayout(
      sidebarPanel(
        selectInput("yearvar",
          label = "Please select release year",
          choices = data$release_year, selected = 4
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
        )
      ),
      mainPanel(plotlyOutput("barplot"))
    )
  ),
  tabPanel(
<<<<<<< HEAD
    "three_d_plot",
    titlePanel("movie recommandations"),
=======
    "3D PLOT",
    titlePanel("Movie Recommandations Given a Previously Liked Movie"),
    tags$p("The last tab shows a 3D plot of maximum of 20 recommended movies
            (based on the selected movie), and their vote count, vote average
              and release date.
            "),
>>>>>>> e2f4e4837a811e2a96ab804c845e1f3a82d7befc
    sidebarLayout(
      sidebarPanel(
        selectInput("movie",
          label = "Please select a movie",
          choices = data$title, selected = "Deadpool 2"
        )
      ),
      mainPanel(plotlyOutput("three_d_plot"))
    )
  )
))
