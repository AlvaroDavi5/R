
# set work directory
setwd("/home/alvaro/Álvaro Davi/Programação/R/data manipulation")

df <- read.csv("database.csv")

print(df)
print("\n")
print(df$TEMPO) # select column by id
print("\n")
print(df[9]) # select column by number
print("\n")

df$UPS <- NULL # delete column
df$UPS <- 0 # create and fill column
df$UPS[1:5] <- c(1,5,7,NA,9)

Name <- c("John", "Maren", "Naveen", "Marina")
Four <- length(Name)
Number <- c(Four, 6, 8, 7)
dataframe <- data.frame(Name, Number)
print(dataframe)

quit("no")

