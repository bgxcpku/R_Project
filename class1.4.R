install.packages('ggplot2')
library(ggplot2)
help(ggplot2)

attach(diamonds)
data(diamonds)
summary(diamonds)
head(diamonds)
dim(diamonds)

plot(price ~ carat, data=diamonds)
hist(price)
hist(carat)
boxplot(price)
?ggplot
ggplot(diamonds,aes(x=carat,y=price))+geom_point()
ggplot(diamonds,aes(x=carat,y=price,color=cut))+geom_point()
ggplot(diamonds,aes(x=carat,y=price,color=table))+geom_point()
ggplot(diamonds,aes(x=carat,y=price,color=cut))+geom_point(shape=1)
ggplot(diamonds,aes(x=carat,y=price,color=cut))+geom_point(shape=1,alpha=1/3)
g<-ggplot(diamonds,aes(x=carat,y=price,color=cut))+geom_point(shape=1)
summary(g)

g+facet_wrap(~cut)
g+facet_grid(color ~ cut)

ggplot(diamonds, aes(x=price)) + geom_histogram()
ggplot(diamonds, aes(x=price)) + geom_histogram(aes(fill=cut)) + facet_wrap(~cut)

ggplot(diamonds,aes(x=price)) + geom_density(color='red',fill='blue')
ggplot(diamonds,aes(x=price)) + geom_density(aes(color=cut, fill=cut))
ggplot(diamonds,aes(x=price)) + geom_density(aes(color=cut, fill=cut)) + facet_wrap(~cut)

ggplot(diamonds, aes(x=1, y=price)) + geom_boxplot()
ggplot(diamonds, aes(x=cut, y=price)) + geom_boxplot()
ggplot(diamonds, aes(x=cut, y=price)) + geom_violin()

install.packages('ggthemes')
library(ggthemes)
g
g+theme_economist()
g+theme_economist()+scale_color_economist()

g+theme_wsj()
g+theme_tufte()
g+theme_bw()


