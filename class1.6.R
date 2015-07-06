acs <- read.table('http://www.jaredlander.com/data/acs_ny.csv',
                  sep=',',head=TRUE,stringsAsFactors = FALSE)
dim(acs)
head(acs)
tail(acs)
acs$Income <- acs$FamilyIncome >= 150000
View(acs)
attach(acs)
income1 <- glm(Income~HouseCosts+NumWorkers+OwnRent+NumBedrooms+FamilyType,
               data=acs, family=binomial)
summary(income1)
coefplot(income1,sort='mag')
class(house_lm)
class(income1)

children1 <- glm(NumChildren ~ FamilyIncome+FamilyType+OwnRent,
                 data=acs,family=poisson)
coefplot(children1,sort='mag')
children1$family

children2 <- glm(NumChildren ~ FamilyIncome+FamilyType+OwnRent,
                 data=acs,family=quasipoisson)
multiplot(children1,children2)+theme(legend.position='none')
