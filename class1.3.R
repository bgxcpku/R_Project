tomato <- read.table('http://jaredlander.com/data/Tomato%20First.csv',
                     header=TRUE,sep = ',',stringsAsFactors = FALSE)
head(tomato)
names(tomato)
summary(tomato)
# don't read excel files