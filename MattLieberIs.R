library(rvest)
library(dplyr)
library(stringr)
ml <- read_html("https://gimletmedia.com/episode/71-the-picture-taker/")

mlq <- ml %>% 
  html_nodes("p") %>% 
  html_text() %>%
  str_match(., "Matt Lieber")
  

mlq
