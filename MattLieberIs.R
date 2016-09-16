library(rvest)
library(dplyr)
library(stringr)


## Full web-page scraping script: have to repeat for each page of episodes, though :( )
toMatch <- "Matt Lieber is"

url <- "https://gimletmedia.com/show/reply-all/episodes/"
pgfull <- read_html(url)
texts <- pgfull %>% 
  html_nodes(".feedItem~ .feedItem+ .feedItem .primary-color , .feedItem:nth-child(1) .primary-color") %>%
  html_attr("href") %>%
  xml2::url_absolute(url)

p1 <- lapply(texts, . %>% read_html() %>% html_text())
p1 <- as.character(unlist(p1))
p1 <- unlist(strsplit(p1,split="\\."))[grep(paste(toMatch, collapse="|"),unlist(strsplit(p1,split="\\.")))]
p1

# Trying to functionalize
getallpages <- function(pgno) {
    url <- paste0("https://gimletmedia.com/show/reply-all/episodes/page/", pgno)
pgfull <- read_html(url)
try(
    texts <- pgfull %>% 
      html_nodes(".feedItem~ .feedItem+ .feedItem .primary-color , .feedItem:nth-child(1) .primary-color") %>%
      html_attr("href") %>%
      xml2::url_absolute(url)
   )
p1 <- lapply(texts, . %>% read_html() %>% html_text())
p1 <- as.character(unlist(p1))
toMatch <- "Matt Lieber is"
unlist(strsplit(p1,split="\\."))[grep(paste(toMatch, collapse="|"),unlist(strsplit(p1,split="\\.")))]
}

pgnos <- c(2:8)
total <- lapply(pgnos, getallpages)
phrases <- unlist(total)

robbie <- str_replace(phrases, "\n", '')
robbie <- str_replace_all(robbie, "( Matt Lieber)", "Robbie")
robbie

write.csv(robbie, "robbie.csv")
robbie <- str_replace(robbie, "\")
