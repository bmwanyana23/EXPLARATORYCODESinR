RCODES USED IN MY REGRESSION ANALYSIS CLASS

Simple Linear Regression Rcodes example
#importing data into R and attach
data<-read.csv(file.choose(),header=T)
data
attach(data)
#Drawing a Scatter Plot
plot(Age,Distance)
#To label axes and add a title
plot(Age,Distance,xlab = "Age of the driver",ylab = "Distance seen",main = "Regression of Distance seen vs the Age of the driver")
#To draw a regression line(abline)(You start with the Y variable(Dependent)
abline(lm(Distance~Age,data = data),col='red')
#perform linear regression
model1<-lm(Distance~Age)
summary(model1)

For Week 2 and 3
#Import data in R and attach
iqsize<-read.csv(file.choose(),header=T) 
attach(iqsize)
#Perform a Multilinear Regression
model <- lm(PIQ ~ Brain + Height + Weight)
summary(model)
model2<-lm(PIQ~Brain+Height)
summary(model2)
model3<-lm(PIQ~Brain+Weight)
summary(model3)
#To check for correllation
cor(iqsize)

Multilinear Regression Rcodes example

#Import data in R and attach

lungs<-read.csv(file.choose(),header = T)
attach(lungs)
summary(lungs)
str(lungs)
plot(lungs)
model1<-lm(LungCap~Age+Height)
summary(model1)
cor(Age,Height,method = "pearson")
#linearity assumptions
par(mfrow=c(2,2))
plot(model1) 

#Check for normality
#plot a histogram
hist(model1$residuals)
#gglpots packages
install.packages("dplyr")
install.packages("ggpubr")
library(dplyr)
library(ggpubr)
ggdensity(model1$residuals)
ggqqplot(model1$residuals)
#shapiro - wilk test
shapiro.test(model1$residuals)
#Anderson Darling test
install.packages("nortest")
library(nortest)
ad.test(model1$residuals)
#Kolmogrov snirnov test
ks.test(model1$residuals,mean(model1$residuals))
#model selection
reducedmodel<-lm(LungCap~Age)
summary(reducedmodel)
anova(reducedmodel,model1)

#check for constant variance
install.packages("car")
library(car)
leveneTest(LungCap,Height,center = median,data=lungs)

#prediction
predict(model1,data.frame(Age=14,Height=46 ),interval="confidence",level=0.95) 

Polynomial Regression Rcodes Example
bluegills <- read.csv(file.choose(), header=T)
attach(bluegills)
#make a scatter plot
plot(age,length)
abline(lm(length~age),col="green",lwd=3)
#perform a SLR
model1<-lm(length~age)
summary(model1)

#model diagonistics
library(dplyr)
library(ggpubr)
ggdensity(model1$residuals)
ggqqplot(model1$residuals)
hist(model1$residuals)
par(mfrow=c(2,2))
plot(model1) 
#Lets now dive into polynomial regression
#create a variable age square
agesq <- age^2
#include the square of age in your equation
model2 <- lm(length ~ age + agesq)
summary(model2)
# now, let's add this model to the plot, using a thick blue line
plot(age,length)
abline(lm(length~age),col="green",lwd=3)
lines(smooth.spline(age, predict(model2)), col="red", lwd=3)

# test if the model including Height^2 i signif. better than one without
# using the partial F-test
anova(model1, model2)
predict(model2, interval="prediction",newdata=data.frame(age=5, agesq=25))
predict(model2, interval="confidence",newdata=data.frame(age=5, agesq=25))
FROM DAN3020
CLEARING THE CONSOLE
dev.off()
CLEARING THE ENVIRONMENT
rm(list=ls())

FROM DAN4015
1.	SUBSETTING DATA
#CSV
data<-read.csv(file.choose(),header = T)
names(data)
attach(data)
ndata=data[c("BMI","AGE", "HEIGHT","WEIGHT")]
ndata

#subsetting
names(data)
ndata1=subset(data, select = (BMI:WEIGHT))
names(ndata1)

#selecting columns 
ndata2=data[c(2:5)]
ndata2
