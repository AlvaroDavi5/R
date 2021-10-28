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
fullname <- c(name, lastname) # create array
fullname[1]
#?c to show c function help
fullname <- str_c(name, " ", lastname) # concatenate

print(summary(newnumber)) # display summary of a element or a element group

attr <- c("Name", "Age", "Height", "Age", "Country")
attr <- as.factor(attr) # factor
print(summary(attr))
attr <- as.vector(attr)
print(is.vector(attr))
print(attr[1])

attr <- list("Sam", 17, FALSE) # list
print(attr)

MyList <- list(as.vector(c(1, 2, 3)), "MyList", TRUE)
print(MyList)
MyMatrix <- matrix(1:9, 3) # matrix
MyMatrix[2,3]

mode(attr) #type of
mode(fullname)
mode(mynumber)
class(attr)

input <- readline(prompt="Enter a value: ") # input
print(str_c("Your input is: ", input)) # output

# decision structures
if (newnumber >= mynumber)
{
	print(newnumber)
}
else
{
	print(mynumber)
}

# repetition structures
items <- c(0,1,2,3,4,5)
for (i in items)
{
	print(i)
}
items <- 5
while (items > 0)
{
	items <- items - 1
}
print(items)

# function
factorial <- function(x)
{
	if (x > 1)
	{
		y <- (x * factorial(x-1))
	}
	else
	{
		y <- 1
	}

	return(y)
}
print(factorial(5))

print(newnumber)
print(mystring)
print(fullname)

quit("no") # quit program

