
library(babynames)
library(dplyr)
library(ggplot2)


flashback <- function(name, sex) {
  
  x <- babynames[name == babynames$name & sex == babynames$sex , ]
  # x <- babynames[babynames$name == "Daphne" & babynames$sex == "F" , ] # function testing
  
  p <-  ggplot(x, aes(x = year, y = n))
  
  p <- p + geom_line(color="hotpink", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
  print(p)
  
}

flashback("Daphne", "F")