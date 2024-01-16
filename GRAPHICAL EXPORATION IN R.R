> #Grouped plots
  > par(mfrow=c(3,4))
> hist(diamonds$carat,  xlab="Carat", main = "Carat Histogram")
> hist(diamonds$price,  xlab="Price",  main = "Price Histogram")
> hist(diamonds$depth,  xlab="depth",  main = "Depth Histogram")
> hist(diamonds$table,  xlab="table",  main = "Table Histogram")
> hist(diamonds$x, xlab = "X", main = "X Histogram")
> hist(diamonds$y, xlab = "Y", main = "Y Histogram")
> hist(diamonds$z, xlab = "Z", main = "Z Histogram")
>par(mfrow=c(1,1))
> #using geo_histogram()
  > #histogram for depth/table
  > ggplot(data = diamonds, aes(x=table))+
  +   geom_histogram(fill="pink",color="black")+
  +   ggtitle("Histogram of Table Values")
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
> ggplot(data = diamonds, aes(x=depth))+
  +   geom_histogram(fill="steelblue",color="black")+
  +   ggtitle("Histogram of Depth Values")
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
>#scatter plot for multiple variables
  >#using geom_point()
  >#using three variables price,carat, cut
  >ggplot(data = diamonds,aes(x=price,y=carat, color=cut))+
  geom_point()
> ggplot(data = diamonds,aes(x=depth,y=table, color=color))+
  +   geom_point()
>#boxplot for single variable
  >boxplot(diamonds$table, main="Table boxplot")
> boxplot(diamonds[,0:5],main="BOXPLOTS") #boxplot for multiple variables
> #scatter plot for multiple variables
  > #using price and color
  > ggplot(data = diamonds, aes(x=cut,y=price))+
  +   geom_boxplot(fill="pink")
> ggplot(data=diamonds, aes(x=color, y=depth)) + 
  +   geom_boxplot(fill="yellow")
> #plotting missing data
  > library(finalfit)
Warning message:
  package ‘finalfit’ was built under R version 4.2.1 
> diamonds%>%
  +   missing_plot()
