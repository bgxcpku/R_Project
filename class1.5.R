install.packages('UsingR')
library(UsingR)
attach(father.son)
head(father.son)
ggplot(father.son,aes(x=fheight,y=sheight))+geom_point()
ggplot(father.son,aes(x=fheight,y=sheight))+geom_point()+geom_smooth(method='lm')

heightsLM <- lm(sheight~fheight)
summary(heightsLM)
dim(father.son)

housing <- read.table('http://www.jaredlander.com/data/housing.csv',
                      header=TRUE,sep=',',stringsAsFactors = FALSE)
summary(housing)
names(housing)
dim(housing)
head(housing)
names(housing) <- c("Neighborhood", "Class", "Units", "YearBuilt", 
                    "SqFt", "Income", "IncomePerSqFt", "Expense", 
                    "ExpensePerSqFt", "NetIncome", "Value", 
                    "ValuePerSqFt", "Boro")
names(housing)
View(housing)
?View

ggplot(housing,aes(x=ValuePerSqFt)) + geom_histogram(binwidth=10)
ggplot(housing,aes(x=ValuePerSqFt)) + geom_histogram(binwidth=10,aes(fill=Boro))

housing <- housing[housing$Units<1000,]
dim(housing)

head(model.matrix(ValuePerSqFt ~Boro, data=housing))
head(model.matrix(~Boro+Units+Income, data=housing))
head(model.matrix(~Boro+Units*Income, data=housing))
head(model.matrix(~Units*SqFt*Income, data=housing))

?model.matrix

house_lm <- lm(ValuePerSqFt~Units+SqFt+Boro,data=housing)

install.packages('coefplot')
library(coefplot)
coefplot(house_lm,sort='mag')

#scale(housing,center=TRUE,scale=TRUE)

house_lm2 <- lm(ValuePerSqFt~Units*SqFt+Boro,data=housing)
house_lm3 <- lm(ValuePerSqFt~Units:SqFt+Boro,data=housing)
multiplot(house_lm,house_lm2,house_lm3)
anova(house_lm,house_lm2,house_lm3)
AIC(house_lm,house_lm2,house_lm3)

nullModel <- lm(ValuePerSqFt~1, data=housing)
fullModel <- lm(ValuePerSqFt~Units+SqFt*Boro+Boro*Class,data=housing)
houseStep <- step(nullModel,
                  scope=list(lower=nullModel,upper=fullModel),
                  direction="both")
summary(houseStep)
?formula

housingNew <-read.table('http://jaredlander.com/data/housingNew.csv',
                        header=TRUE,sep=',',stringsAsFactors = FALSE)
head(housingNew)
housePredict<-predict(house_lm,newdata=housingNew,se.fit = TRUE,interval = 'prediction',level=.95)
head(housePredict$fit)

