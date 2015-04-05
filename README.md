# Teachmetofunction

The entertaining functions I have written thus far (currently all related to naming babies, but I wouldn't read too much into that) on my learner's journey.

# Functions Built:

#### 'NameThatKid()'
##### Description
This function returns five random names for the gender and decade of your choice.
##### Usage
```R
NameThatKid(gender, decade)
```
##### Arguments
* 'gender' (character).  Only options are "M" or "F"
* 'decade' (integer). Enter any decade between 1880 - 2010.

##### Example
```R 
NameThatKid('F', 1990)
```
#### 'OmgTwins()'
##### Description
This function generates endlessly cutesy pairs of names for twins.
##### Usage
```R
OmgTwins(genders, letter)
```
##### Arguments
* 'genders' (character).  Options are "boys", "girls", or "both".  Anything other than those will return a random guess.
* 'letter' (character).  Choose the letter of the alphabet you want both names to start with.

##### Examples
```R
 OmgTwins("girls", "H")
 OmgTwins("both", "S")
 OmgTwins("um" , "T")
```
#
