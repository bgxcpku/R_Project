update.packages('glmnet')
library(glmnet)

theForm <- Income ~ NumBedrooms + NumChildren + NumPeople + 
  NumRooms + NumUnits + NumVehicles + NumWorkers + 
  OwnRent + YearBuilt + ElectricBill + FoodStamp + 
  HeatingFuel + Insurance + Language - 1

class(theForm)

library(useful)

acsX <- build.x(theForm,data=acs,contrasts=FALSE)
acsY <- build.y(theForm,data=acs)
dim(acsX)
class(acsX)
?build.x
?glmnet

set.seed(1)
sample(1:10,3)

acsCV1 <- cv.glmnet(x=acsX,y=acsY,family="binomial",nfold=5)
plot(acsCV1)

plot(acsCV1$glmnet.fit,xvar='lambda')

acsCV1 <- cv.glmnet(x=acsX,y=acsY,family="binomial",nfold=5,alpha=1)
acsCV2 <- cv.glmnet(x=acsX,y=acsY,family="binomial",nfold=5,alpha=0)
acsCV3 <- cv.glmnet(x=acsX,y=acsY,family="binomial",nfold=5,alpha=0.5)

#HW, how to figure out best alpha, Wednesday morning




