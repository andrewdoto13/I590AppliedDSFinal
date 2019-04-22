# Data Wrangling

# This code example was found at https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

# Load the gapminder dataset and the dplyr, the package for data wrangling
library(gapminder)
library(dplyr)

# Filter verb is for narrowing or selecting data that matches criteria
# mutate verb is for creating new variables
# arrange verb is for sorting data
gapminder %>% 
  filter(year == 2007) %>%
  mutate(lifeExpMonths = 12 * lifeExp) %>%
  arrange(desc(lifeExpMonths))

# the group_by verb allows you to group values in rows by the criteria
# the summarize verb allows you to perform a summary function on a vector to return a value
by_continent_2007 <- gapminder  %>%
  filter(year == 2007)  %>%
  group_by(continent)  %>%
  summarize(medianLifeExp = median(lifeExp), medianGdpPercap = median(gdpPercap))

by_continent_2007
