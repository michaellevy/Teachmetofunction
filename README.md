# Teachmetofunction
All the entertaining functions I have written (most of currently related to naming babies) on my rocky learner's journey of writing functions in R.

# Functions Built So Far:

#### NameThatKid
##### Description
This function returns five random names for the gender and decade of your choice.
##### Usage
NameThatKid(gender, decade)
##### Arguments
 gender (character).  Only options are "M" or "F"
 decade (integer). 1880 - 2010.
##### Example
 NameThatKid('F', 1990)

#### OmgTwins
##### Description
This function generates endlessly cutesy pairs of names for twins.
##### Usage
OmgTwins(genders, letter)
##### Arguments
 gender (character).  Options are "boys", "girls", or "both".  Anything other than those will return a random guess.
 letter (character).  Choose a letter of the alphabet you want both names to start with.
##### Example
 OmgTwins("girls", "H")
 OmgTwins("both", "S")
 OmgTwins("um" , "T")
