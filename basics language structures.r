# install packages
install.packages("stringr")
install.packages("ggplot2", "dplyr")
install.packages('jsonlite', dependencies=TRUE)

# load packages
library(stringr)
library(ggplot2)
library(jsonlite)


# variables
mystring = "Hello World!"
mynumber <- 55
(mynumber + 170) -> newnumber


name <- "John"
lastname <- "Smith"
#fullname <- c(name, lastname)
#?c to show c function help
fullname <- str_c(name, " ", lastname)
print(summary(newnumber))


# output
print(newnumber)
print(mystring)
print(fullname)

# built-in functions
quit("no")

