sayhello <- function()
{
  print("hello, world!")
}

sayhello()

times2 <- function(x)
{
  return(x*2)
}

times2(10)

times2 <- function(x)
{
  x * 2
}

times2(10)

timesX <- function(n, x=2)
{
  n*x
}

timesX(5)

runThis <- function(x,func) # pass a function
{
  func(x)
}

runThis(1:10, sum)