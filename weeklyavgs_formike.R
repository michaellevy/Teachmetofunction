# Required packages (install if you haven't already with install.packages("pkg"))

library(dplyr)
library(lubridate)

d <- read.csv("flow2013.csv", header = TRUE, stringsAsFactors = FALSE)
str(d)

# convert Date column to date/time format

d$Date <- mdy(d$Date) #lubridate now recognizes as a date format, can do manipulations
d$week <- week(d$Date) # lubridate automatically recongizes the week # of the year and this line just adds it as a column.  When you have year data, you can do the same with year(week$Date)

d2 <- d %>%
  group_by(week) %>% 
  mutate(weekavg = mean(Flow_cfs))

head(d2) # should be good to go!  you can check with:
d[1:9, ] # complete week is rows 2:8
mean(d$Flow_cfs[2:8])
filter(d2, week == 14) # values match - you should be good.
