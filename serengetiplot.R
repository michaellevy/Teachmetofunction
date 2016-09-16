library(extrafont)
library(dplyr)
library(ggplot2)
library(lubridate)

# font_import() # only do when you have new fonts
loadfonts()

d <- read.csv("~/Dropbox/GitHubRepos/funforfriends/Serengeti_HWC_generalized_file_012916.csv", stringsAsFactors = FALSE, header = T)
head(d)

d[d$Season == "", ] <- "Unknown"

d2 <- d %>% 
  group_by(Season, PROBLEM_ANIMAL) %>% 
  summarise(count = n())
head(d2)


dfs <- split(d2, with(d2, list(d2$PROBLEM_ANIMAL)), drop = TRUE)
head(dfs)
dfs <- dfs[-1]
names(dfs)
list2env(dfs,envir=.GlobalEnv)

head(Elephant)
p <- ggplot(Elephant, aes(x = Season, y = log(count))) + geom_text(label = "e", family = "serengeti", size =100, color = "#393C25") 

p <- p + geom_text(data = Hyena, label = "h", family = "serengeti", size = 32,
                   color = "#CA590F")

p <- p + geom_text(data = Hippopotamus, label = "i", family = "serengeti", size = 90,
                   color = "#452139", position = position_nudge(y = 0.4, x = -.05))

p <- p + geom_text(data = Leopard, label = "k", family = "serengeti", size = 50,
                   color = "#891300", position = position_nudge(x = 0.05))

p <- p + geom_text(data = Lion, label = "l", family = "serengeti", size = 64,
                   color = "#FFBA04", position = position_nudge(x = -0.05))

p <- p + geom_text(data = Porcupine, label = "p", family = "serengeti", size = 25,
                   color = "#3364C9", position = position_nudge(y = 0.5))

p <- p + geom_text(data = Baboon, label = "b", family = "serengeti", size = 32,
                   color = "#5E2F18", position = position_nudge(x = 0.05))

p <- p + geom_text(data = Bushpig, label = "!", family = "serengeti", size = 40,
                  color = "#007EC2")

p <- p + geom_text(data = Crocodile, label = "c", family = "serengeti", size = 45,
                   color = "#547137" )


p <- p + theme(legend.position = "none",
               text = element_text(size = 36)) + ylim(c(0, 10)) + scale_x_discrete(labels = c("Dry Season",  "Early Rainy Season", "Late Rainy Season", "Transition", "Unknown")) + 
  labs(x = NULL, y = "Log Incidents") 

p <- p + theme(plot.margin = unit(c(10,30, 10, 5) ,"points"))

p <- p + geom_text(aes(x = 4.8, y = 9.3), label = "K.L.D-S, Ph.D", family = "Megrim", 
              size = 28)

ggsave(p, file = "Serengeti_replace.jpeg", width = 1217, height = 794, units = "mm")
p


### Second Option
d <- read.csv("~/Dropbox/GitHubRepos/funforfriends/Serengeti_HWC_generalized_file_012916.csv", stringsAsFactors = FALSE, header = T)
head(d)
d <- filter(d, Conflict_Year != "Unknown" | PROBLEM_ANIMAL != "Unknown")

d <- filter(d, PROBLEM_ANIMAL != "")

unique(d$PROBLEM_ANIMAL)
p <- p + theme(legend.position = "none") + labs(x = NULL, y = NULL)
p

d$Conflict_Year <- as.numeric(d$Conflict_Year)

head(d$Conflict_Year)

cols <- c("#393C25", "#CA590F", "#452139", "#891300", "#FFBA04",  "#3364C9","#5E2F18",
          "#007EC2", "#547137" )

g <- ggplot(d, aes(x = PROBLEM_ANIMAL, y = as.numeric(Reports_filed), group = PROBLEM_ANIMAL)) + geom_bar(aes(fill = PROBLEM_ANIMAL), stat = "identity", position = "dodge")
g  
g + theme(legend.position = "none") + labs(x = NULL, y = "Incident Reports Filed, 2008-2014") + scale_color_manual(values = cols)
