1+1
4/3
# this is a comment
w <- 3
w
rm(w)
w
w <- 5
class(w)
w <- 5L
class(w)
is.numeric(w)
is.integer(w)
w <- "abc"
class(w)

date1 <- as.Date("2015-07-06")
date1
class(date1)
as.numeric(date1)
?as.Date
date1 <- as.Date("15-07-6", format="%y-%m-%d")
date1

date2 <- as.POSIXct("2015-07-06 09:38")
date2
as.numeric(date2)
?as.POSIXct

TRUE

FALSE

TRUE*5
FALSE*5

2 == 3

x <- c(1,2,3,4,5)
?c()
x+2
sqrt(x)
