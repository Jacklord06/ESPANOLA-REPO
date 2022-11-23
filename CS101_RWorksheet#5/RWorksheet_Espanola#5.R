#Worksheet-5 in R
#Espanola, Jacklord BSIT 2-A
#1. The table shows the enrollment of BS in Computer Science, SY 2010-2011.
#a. Plot the data using a bar graph. Write the codes and copy the result.
year_2019_2020 <- c(80,75,70,60)
barplot(year_2019_2020)

#b. Using the same table, label the barchart with
#Title = ” Enrollment of BS Computer Science
#horizontal axis = “Curriculum Year” and
#vertical axis = “number of students”
course_year <- c("1st","2nd","3rd","4th")

enrollment <- barplot(year_2019_2020,
                  main = "Enrollment of BS Computer Science",
                  xlab = "Curriculum Year", names.arg = course_year,
                  ylab = "number of students")

#2. The monthly income of De Jesus family was spent on the following:
#60% on Food, 10% on electricity, 5% for savings, and
#25% for other miscellaneous expenses.


#a. Create a table for the above scenario.
#Write the codes and its result.
incomeExpenses <- c(60,10,5,25)

barplot(incomeExpenses,names.arg = c("Food", "Electricity", "Savings", "Other Miscellaneous"))

#b. Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.
pie(incomeExpenses)
expenses <- pie(incomeExpenses,
              col = rainbow(length(incomeExpenses)),
              labels = c(60,10,5,25))

samp_labels <- round(incomeExpenses/sum(incomeExpenses) * 100, 1)

samp_labels <- paste(samp_labels,"%",sep = "")
pie(incomeExpenses, main = "Expenses",col=rainbow(length(incomeExpenses)),labels = samp_labels,cex=0.8)

legend(1, c("Food", "Electricity", "Savings", "Miscllaneous"),
       cex = 0.8,fill = rainbow((length(incomeExpenses))))


#3. Open the mtcars dataset.
data("mtcars")

#a. Create a simple histogram specifically for mpg (miles per gallon) variable.
#Use $ to select the mpg only. Write the codes and its result.
data2 <- hist(mtcars$mpg, main = "Historam of mpg", xlab = "Miles per gallon")

#b. Colored histogram with different number of bins.
#hist(mtcars$mpg, breaks=12, col="red")
#Note: breaks= controls the number of bins
data3 <- hist(mtcars$mpg, main = "Historam of mpg", xlab = "Miles per gallon",
              breaks = 12, col = "red")

#c. Add a Normal Curve
##Copy the result.
data4<- mtcars$mpg
h<-hist(data4, breaks=12, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(data4),max(data4),length=40)
yfit<-dnorm(xfit,mean=mean(data4),sd=sd(data4))
yfit <- yfit*diff(h$mids[1:2])*length(data4)
lines(xfit, yfit, col="blue", lwd=2)

#4. Open the iris dataset. Create a subset for each species.
#a. Write the codes and its result.
data("iris")

species1 <- subset(iris, Species == "setosa")
species2 <- subset(iris, Species == "versicolor")
species3 <- subset(iris, Species == "virginica")

#b. Get the mean for every characteristics of each species using colMeans().
#Write the codes and its result.
#Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])
species1 <- subset(iris, Species == "setosa")
setosa <- colMeans(species1[sapply(species1,is.numeric)])
setosa

species2 <- subset(iris, Species == "versicolor")
versicolor <- colMeans(species2[sapply(species2,is.numeric)])
versicolor

species3 <- subset(iris, Species == "virginica")
virginica <- colMeans(species3[sapply(species3,is.numeric)])
virginica

#c. Combine all species by using rbind()
#The table should be look like this:
combine_data <- rbind(setosa,
                      versicolor,
                      virginica)
combine_data

#d. From the data in 4-c: Create the barplot().
#Write the codes and its result.
#The barplot should be like this.
barplot(combine_data, beside = TRUE,
        main = "Iris Data",
        xlab = "Characteristics",
        ylab = "Mean Scores",
        col = c("red","green","blue"))

