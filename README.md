# Final-Project
For our final project, we will look into popular movies by state, and also build a search system that users can search for the popularity of movies, recommendations and similarity of the movie they like.

**What is the dataset you'll be working with? Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.**

We will use The Movie Database API from TMDB to access the information of movies, such as popularity, vote average, genre type, keywords, etc. We will also using csv files the Google has collected from its searches. We access it through Google Trends, which allows us to see the frequency of specific movies that were googled from 2004 to now by state.

**Who is your target audience? Depending on the domain of your data, there may be a variety of audiences interested in using the dataset. You should hone in on one of these audiences.**

Our target audience is for film producers who would like to see which kinds of movies are popular amongst specific regions. Also for any film enthusiast that would want to
look for movie ratings/recommendation to watch.

**What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.**

It will answer:
>where a specific movie is googled the most

>what genres are popular amongst states

>which state holds least interest in movies.

**Create at least 5 GitHub Issues as your first set of steps to take in the project.  You should assign these to individual group members to complete**

**How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?**

We will use The Movie Database API from TMDB to access the top 20 most popular movies. We will then use Google Trends and enter the movie name and download a movie specific .csv file. The .csv file will have each state as an individual row, and provide an indexed and normalized value for its web searches. The value is calculated as (# of queries for keyword) / (total Google search queries). Moreover, the 0 - 100 values are relative, not absolute, measures.

**What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?**

We will combine several datasets by using join method. After that, we will use select method to select some columns that we want to keep. We will need to reformat the data by state and also by the name of the movies. For data visualization we will need to make a map of U.S. with the most popular movies displayed on each state, or multiple movies based on the trend.

**What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)?**

httr, jsonlite, plotly, knitr, stringr libraries.

**What major challenges do you anticipate?**

The major challenges would be getting the exact information we need. For example, by using TMDB api, we need the movie id to get access the recommendation and similarity of that movie. This would be a big challenge since we haven't figured out how to get the id by the movie name. Gathering the data and sorting them in order, rendering the data into a map, turning our analysis into a shiny app are also major challenges.
