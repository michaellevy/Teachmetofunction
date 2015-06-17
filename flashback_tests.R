## Broken, for sure

flashback1 <- function(name, sex) {
  
  x <- filter(babynames, name == name, sex == sex)
  
  p <-  ggplot(x, 
               aes(x = x$year, 
                   y = x$n), 
               environment = environment())
  
  p + geom_line(color="maroon3", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
}

flashback1("Shiree", "F")

## Also broken for sure:
flashback2 <- function(name, sex) {
  
  x <- filter(babynames, name == name, sex == sex)
  x <- filter(babynames, name == "Daphne", sex == "F")
  p <-  ggplot(x, 
               aes(x = x$year, 
                   y = x$n), 
               environment = environment())
  
  p <- p + geom_line(color="hotpink", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
  print(p)
  
}

flashback2("Shiree", "F")

## Works, for sure:

flashbackw <- function(name, sex) {
  
  x <- babynames[name == babynames$name & sex == babynames$sex , ]
 # x <- babynames[babynames$name == "Daphne" & babynames$sex == "F" , ]
  
  p <-  ggplot(x, 
               aes(x = x$year, 
                   y = x$n), 
               environment = environment())
  
  p <- p + geom_line(color="hotpink", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
  print(p)
  
}

flashbackw("Shiree", "F")

## checking to see if all the extra shit matters:

flashbacke <- function(name, sex) {
  
  x <- babynames[name == babynames$name & sex == babynames$sex , ]
  # x <- babynames[babynames$name == "Daphne" & babynames$sex == "F" , ]
  
  p <-  ggplot(x, aes(x = year, y = n))
  
  p <- p + geom_line(color="hotpink", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
  print(p)
  
}

flashbacke("Daphne", "F")

## It doesn't.

## Making sure one last time - what if I call it individually?
flashbackd2 <- function(name, sex) {
 
   x <- dplyr::filter(babynames, name == name & sex == sex)
  
  p <-  ggplot(x, aes(x = year, y = n))
  
  p <- p + geom_line(color="hotpink", size = 3) + geom_area(aes(alpha = 0.5)) + theme(legend.position ="none") +
    labs(list(x = "Year", y = "n")) + ggtitle(paste(c(deparse(substitute(name))), "Over the Years"))
  
  print(p)
  
}

flashbackd2("Shiree", "F")

# nope
