
## Title: "Name That Kid r function"
## Date: 27-Jan-2015
## File: NameThatKid.r
## Author(s): Myfanwy Johnston, Noam Ross
## Purpose: To annoy all your pregnant friends with a selection of five random names from the decade of your choice.

## Current limitations: can only select male or female (not a random selection of both genders), clunky code structure.
 # Weighs all names equally, not by popularity. Have to put gender in quotes (is that normal?)

## Depends upon: dplyr, plyr, babynames

require(dplyr)
require(babynames)

NameThatKid <- function(gender, decade, byPop = FALSE, num = 5) {
  a <- babynames %>%
    filter(sex==gender) %>%
    # filter(sex=='M') %>% # for function testing
    mutate(dec = plyr::round_any(year, accuracy=10, f=floor)) %>% # Thanks Noam!
    group_by(dec) %>%
    sample_n(., num, weight = if(byPop) n else NULL)
  
  b <- a %>%
    filter(dec == decade)
  # filter(dec==1990) # for function testing
  c <- ungroup(b)
  c <- select(c, year, name, n)
  return(c)
}

#Example of use:
NameThatKid(gender= 'M', decade=1970)
NameThatKid(gender= 'M', decade=1880, TRUE, 20)
