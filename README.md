# Final-Project
 For our final project, we will look into popular movies by state.

**What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.**
We are using csv files the Google has collected from its searches. We access it through Google Trends, which allows us to see the frequency of specific movies that were googled from 2004 to now by state.

**Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should hone in on one of these audiences.**
Our target audience is for film producers who would like to see which kinds of movies are popular amongst specific regions.

**What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.**
It will answer where a specific movie is googled the most, what genres are popular amongst states, and which state holds least interest in movies.

**Create at least 5 GitHub Issues as your first set of steps to take in the project.  You should assign these to individual group members to complete**

**How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?**
We will use the data collected from IMDB regarding the top 20 movies of all time. We will then use Google Trends and enter the movie name and download a movie specific .csv file. The .csv file will have each state as an individual row, and provide an indexed and normalized value for its web searches. The value is calculated as (# of queries for keyword) / (total Google search queries). Moreover, the 0 - 100 values are relative, not absolute, measures. 

**What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?**

**What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)?**

**What major challenges do you anticipate?**