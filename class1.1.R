x <- 10:1
y<- -4:5
q <- c("Hockey", "a", "b", "c", "golf", "tennis", "cc", "dd",
       "ss", "ff")
df <- data.frame(x,y,q)
class(df)
class(df$x)
df
class(df$q)

df <- data.frame(First=x, Second=y, Sport=q)
df

df <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)
df
class(df$Sport)
nrow(df)
ncol(df)
dim(df)

names(df)

x
x[2]
x[2:4]
x[c(2,3,5)]
x[-2]
x[-c(2,5)]
x[length(x)]
df[4,2]
df[4,'Second']
df[c(2,4,6),1:2]
df[c(2,4),]

df[df$First<4,]
df[,2:3]
df[,2]
df[,2,drop=FALSE]

list(1,2,3)
list(c(1,2,3))

list1 <- list(One=x, Two=y, Sport=q, DF=df)
list1

list2 <- list(df,x,list1)
