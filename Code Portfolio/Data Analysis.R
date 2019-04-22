# Data Analysis

# data came from the cluster practice Rmd and 

# Import packages
library(gapminder) # gapminder is a dataset
library(dplyr) # dplyr helps with data manipulation
library(ggplot2) # ggplot is for data visualization
library(tidyverse)  # data manipulation
library(cluster)  # clustering algorithms

# For the first part of the analysis, let's visualize the data for the year 1952

#filter for the year 1952
gapminder_1952 <- gapminder %>%
  filter(year == 1952) 

# first argument is the dataset
# second is the aes function, with the x and y axes of columns from dataset
# adding the geom_point to add the scatter plot
# adding the log10 scales helps when you have a large variation in a variable
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) + geom_point() + scale_x_log10()

str(gapminder_1952)

# simple linear regression
# response variable of gdpercap with predictor of life expectancy
lm_model <- lm(gdpPercap ~ lifeExp, data = gapminder_1952)

# view the model
lm_model

# plot the data with the regression line
ggplot(gapminder_1952, aes(x = lifeExp, y = gdpPercap)) + geom_point() + geom_smooth(method = "lm") + scale_y_log10()

  
# function to compute total within-cluster sum of square 
  wss <- function(k) {
    kmeans(df, k, nstart = 10 )$tot.withinss
  }

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

# use this function to run the Kmeans algorithm
km_model <- kmeans(df, centers = 2)  # centers  = K
str(k2)

# use these functions to visualize the cluster
final <- kmeans(df, 4, nstart = 25)
fviz_cluster(final, data = df)


