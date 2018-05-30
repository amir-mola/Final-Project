# Final-Project
Group members: Leona Wada, Katie Chen, Jennifer Li and Amir Mola

For our final project, we will look into popular movies by genres and years, and also build a search system that users can search for movies based on years, genres, rating, and recommendations of the movie they like.

We will use **The Movie Database API** from [TMDB](www.themoviedb.org/documentation/api) to access the information of movies, such as popularity, vote average, genre type, release date, etc. 

Our **target audience** is for *film producers* who would like to see which kinds of movies are highly ranked and the trends differ by year. Also for any *film enthusiast* that would want to look for movie ratings/recommendation to watch.

Our project will specifically answer:

`What genres were popular in a given year?`

`Did certain years have more highly voted movies?`

`What movies are recommended given a previously liked movie?`


We will use The Movie Database API from [TMDB](www.themoviedb.org/documentation/api) to access movie dataset by using an API. In this project, we will need to read in several datasets such as the general movie dataset, language list and genre list, etc. 

We will combine several datasets by using **join** and **rbind** function. After that, we will use **select** function to select some columns that we want to keep. We will need to reformat the data by year and also by the name of the movies. For data visualization we will make a **scatter plot**, **bar graph** and **3D plot** to give audience information directly. 

In this project, *httr*, *jsonlite*, *plotly*, *lubridate*, *shiny* libraries will be used. 

The major challenges in this project would be getting the exact information we need. For example, by using TMDB API, we can only access 20 movies at a time, so we need to write a function to get the number of movies we want by combining all small dataset into a single csv file. Others such as gathering the data and sorting them in order, rendering the data into plot, turning our analysis into a shiny app are also major challenges that we need to overcome. 

**Final Project Website**: https://katiechen.shinyapps.io/Final-Project/
