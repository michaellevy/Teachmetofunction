## Title: "OmgTwins"
## Date: 3-Feb-2015
## File: OmgTwins.r
## Author(s): Myfanwy Johnston
## Purpose: To generate endlessly cutesy pairs of names for twins.

## Current limitations: 

## Depends upon: dplyr, babynames

OmgTwins <- function(genders, letter) { # gender = 'M', 'F', or 'B' (for both)
                                       # letter = any letter of the alphabet, in ''
  if (genders=='F' ) {
  a <- tbl_df(babynames) %>%
    filter(sex=='F', n > 200, grepl(letter, name)) %>%
    # filter(sex=='F', letter = 'S') %>% # for function testing
    sample_n(., 2)
  b <- select(a, name)
  return(b)

      } else {   
        if (genders == 'M') {
          a <- tbl_df(babynames) %>%
          filter(sex=='M', n > 200, grepl(letter, name)) %>%
    #  filter(sex=='M', letter = 'S') %>% # for function testing
          sample_n(., 2)
           b <- select(a, name)
           return(b)
    } else {
      
            a <- tbl_df(babynames) %>%
              filter(sex=='M', n > 200, grepl(letter, name)) %>%
        # filter(sex=='M', n >= 200, grepl('S', name)) %>% # for function testing
             sample_n(., 1)
      
            b <- tbl_df(babynames) %>%
            filter(sex=='F', n > 200, grepl(letter, name) ) %>%
      #  filter(sex=='F', n >= 200, grepl('S', name)) %>% # for function testing
            sample_n(., 1)
             c <- rbind(a, b)
             d <- select(c, name)
             return(d)
    }
  }
}

OmgTwins('B', 'M')
