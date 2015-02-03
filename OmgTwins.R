## Title: "OmgTwins"
## Date: 3-Feb-2015
## File: OmgTwins.r
## Author(s): Myfanwy Johnston
## Purpose: To generate endlessly cutesy pairs of names for twins.

## Current limitations: no option to select random letter

## Depends upon: dplyr, babynames, cowsay

OmgTwins <- function(genders, letter) { # gender = 'M', 'F', or 'B' (for both)
                                       # letter = any letter of the alphabet, in ''
  if (genders=='girls' ) {
  a <- tbl_df(babynames) %>%
     filter(sex=='F', n > 200, grepl(letter, name)) %>%
    # filter(sex=='F', n> 200, grepl('S', name)) %>% # for function testing
    sample_n(., 2)
  b <- select(a, name)
  say(what = "Well Congratulations!", by = "trilobite")
  print(b$name)

      } else {   
        if (genders == 'boys') {
          a <- tbl_df(babynames) %>%
          filter(sex=='M', n > 200, grepl(letter, name)) %>%
    #  filter(sex=='M', letter = 'S') %>% # for function testing
          sample_n(., 2)
           b <- select(a, name)
    say(what = "Well Congratulations!", by = "trilobite")
    print(b$name)
    } else {
      if (genders == 'both'){
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
      say(what = "Well Congratulations!", by = "trilobite")
      print(d$name)
    } else {
      a <- tbl_df(babynames) %>%
        filter(n > 200, grepl(letter, name)) %>%
        sample_n(., 2)
      b <- select(a, name)
      say(what = "I didn't know what you're having, so I guessed...", by = 'cat')
      print(b$name)
    }
  }
}}

OmgTwins('boys', 'M')
OmgTwins('girls', 'V')
OmgTwins('both', 'X')
OmgTwins('um', 'S')
