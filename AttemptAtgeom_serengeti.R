library(ggplot2)
library(grid)
library(dplyr)

d <- read.csv("~/Dropbox/GitHubRepos/funforfriends/Serengeti_HWC_generalized_file_012916.csv", stringsAsFactors = FALSE, header = T)

d2 <- d %>% 
  group_by(Season, PROBLEM_ANIMAL) %>% 
  summarise(count = n())
head(d2)

d2 <- filter(d2, PROBLEM_ANIMAL != "")

## replace by a named list with matrices to be displayed
## by rasterGrob
images <- list.files(path = "~/Dropbox/GitHubRepos/funforfriends/images/toloop/", pattern = ".png", full.names = TRUE)

hyena <- readPNG("~/Dropbox/GitHubRepos/funforfriends/images/toloop/hyena.png")


rl = lapply(images, png::readPNG)
gl = lapply(rl, grid::rasterGrob)
gridExtra::grid.arrange(grobs=gl) # visualize

names <- c(unique(d2$PROBLEM_ANIMAL, na.rm = TRUE))
names(gl) <- names
gl["Elephant"]

AnimalGrob <- function(x, size=1, alpha=1){
  rasterGrob(image=x)
}

g <- AnimalGrob(x=hyena)
grid.draw(g)

drawDetails.animal <- function(x, recording=FALSE){
  
  for(ii in seq_along(x$animal)){
    grid.raster(x$x[ii], x$y[ii], 
                width = x$size[ii]*unit(1,"mm"), height = x$size[ii]*unit(0.5,"mm"),
                image = gl[animal], interpolate=FALSE)
  }
}



GeomAf <- ggproto("GeomAf", Geom,
                    required_aes = c("x", "y", "animal"),
                    default_aes = aes(size = 5, animal="hyena"))

geom_af <- function(mapping = NULL, data = NULL, stat = "identity",
                      position = "identity", na.rm = FALSE, show.legend = NA, 
                      inherit.aes = TRUE, ...) {
  draw_key = function (data, params, size) 
  {
    flagGrob(0.5,0.5, animal=data$animal)
  }
  
  layer(
    geom = GeomAf, mapping = mapping,  data = data, stat = stat, 
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}



ggplot(d2, aes(x=Season, y=count)) + geom_af(aes(animal = PROBLEM_ANIMAL)) 

