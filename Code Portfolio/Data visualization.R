#This code comes from https://datacamp-community-prod.s3.amazonaws.com/e63a8f6b-2aa3-4006-89e0-badc294b179c

library(gapminder) # gapminder is a dataset
library(dplyr) # dplyr helps with data manipulation
library(ggplot2) # ggplot is for data visualization

#filter for the year 1952
gapminder_1952 <- gapminder %>%
  filter(year == 1952) 

# first argument is the dataset
# second is the aes function, with the x and y axes of columns from dataset
# adding the geom_point
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) + geom_point()

# here, I've added some extra features, such as 
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent,
                           size = gdpPercap)) + geom_point() + scale_x_log10()


# here is an example of a histogram, used to evaluate the distribution
ggplot(gapminder_1952, aes(x = pop)) + geom_histogram() + scale_x_log10()

# here is an example of a box plot, useful for comparing distributions by different categories
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + ggtitle("Comparing GDP per capita across continents")
