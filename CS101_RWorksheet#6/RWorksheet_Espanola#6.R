#Espanola, Jacklord BSIT 2-A
#WorkSheet-6
#Plotting using ggplot() and plot()

#Use the dataset mpg
library(ggplot2)

#to get the mpg dataset, load the ggplot package first
data(mpg)
#to get the mpg dataset, load the ggplot package first
data(mpg)
data1 <- as.data.frame(data(mpg)) #converting from list to data frame

str(mpg)
#use of glimpse() - much tidier compared to str()
library(dplyr) #glimpse() is a function under dplyr package
glimpse(mpg)

#Example. graph using ggplot()
ggplot(mpg, aes(cty, hwy)) +
  geom_point()
#1. How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.
nrow(mpg) #234
ncol(mpg) #11


#2. Which manufacturer has the most models in this data set? Which model has the
# most variations? Ans: dodge has 37 models

manufc <- mpg %>% 
  group_by(manufacturer) %>% 
  tally(sort = TRUE)
manufc

#a. Group the manufacturers and find the unique models. Copy the codes and
#result.
mydata <- mpg
grp_manufc <- mydata %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
grp_manufc

#b. Graph the result by using plot() and ggplot(). Write the codes and its
#result.
qplot(manufacturer, data=mpg, geom = "bar", fill=manufacturer )


ggplot(mpg, aes(model, manufacturer))+ geom_point()


#3. Same dataset will be used. You are going to show the relationship of the 
#model and the manufacturer.
data1 <- mpg
data2 <- data1 %>% group_by(manufacturer, model) %>%
  distinct() %>% count()
data2

colnames(data2) <- c("Manufacturer", "Model")
data2

#a. What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
ggplot(mpg, aes(model, manufacturer))+ geom_point()
#Answer: It shows the geometric point graph of model and manufacturer in mpg.

#b. For you, is it useful? If not, how could you modify the data to make it more
#informative
#Answer: Yes, it is useful because you can track down the data for each model of
#the manufacturer and modify it.


#4. Using the pipe (%>%), group the model and get the number of cars per model.
#Show codes and its result.
grp_model <- grp_manufc %>% group_by(model) %>% count()
grp_model

colnames(grp_model) <- c("model","Counts")

#a. Plot using the geom_bar() + coord_flip() just like what is shown below. Show
#codes and its result.
qplot(model, data=mpg, main = "Number of Cars per Model",
      xlab="Model",
      ylab="Number of cars",
      geom="bar", fill=manufacturer)
      coord_flip()

#b. Use only the top 20 observations. Show code and results
barplot(grp_model$Counts[1:20],names.arg=grp_model$model[1:20])


#5. Plot the relationship between cyl - number of cylinders and displ - engine 
#displacement using geom_point with aesthetic colour = engine displacement. 
#Title should be “Relationship between No. of Cylinders and Engine Displacement”
#a. Show the codes and its result.
ggplot(data = mpg , mapping = aes(x = displ, y = cyl, 
      main = "Relationship between No. of Cylinders and Engine Displacement")) + 
      geom_point(mapping=aes(colour = "engine displacement")) + geom_jitter()

#b. How would you describe its relationship?
#Answer: Looking at the graph, the cyl represents the y, the graph is gittered 
#and the pink dots represent the engine displacements that were located in 
#straight horizontal position.


#6. Get the total number of observations for drv - type of drive train
#(f = front-wheel drive, r = rear wheel drive, 4 = 4wd) and class - type of
#class (Example: suv, 2seater, etc.).
#Plot using the geom_tile() where the number of observations for class be used 
#as a fill for aesthetics.

#a. Show the codes and its result for the narrative in #6.
ggplot(data = mpg, mapping = aes(x=drv, y=class)) +
  geom_point() + geom_tile (aes(fill=class))

#b. Interpret the result.
#Answer: Areas covered with black are "mapped" using the mapping geometric point
#graph. The y as class and x as drv.


#7. Discuss the difference between these codes. Its outputs for each are shown
#below.
#Code #1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#Code #2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")
#In the expression, colour = "blue", "blue" is interpreted as a categorical
#variable which only takes a single value "blue". Considering how colour = 1:234
#and colour = 1 are interpreted by aes().

#8. Try to run the command ?mpg. What is the result of this command?
mpg

#a. Which variables from mpg dataset are categorical?
#Categorical variables in mpg include: manufacturer, model, trans
#(type of transmission), drv (front-wheel drive, rear-wheel, 4wd),
#fl (fuel type), and class (type of car).

#b. Which are continuous variables?
#Continuous variables in mpg include: displ (engine displacement in litres),cyl 
#(number of cylinders), cty (city miles/gallon), and hwy (highway gallons/mile).

#c. Plot the relationship between displ (engine displacement) and hwy(highway 
#miles per gallon). Mapped it with a continuous variable you have identified in 
#5-b.
ggplot(mpg, aes(x=displ, y=hwy, colour=cty)) +geom_point()

#What is its result? Why it produced such output?
#Answer: data tracks the cty by placing cty(city miles per gallon) at color 
#having a variation or hues of blue.


#9. Plot the relationship between displ (engine displacement) and hwy(highway
#miles per gallon) using geom_point(). Add a trend line over the existing plot
#using geom_smooth() with se = FALSE. Default method is “loess”.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE,  method = loess)


#10. Using the relationship of displ and hwy, add a trend line over existing
#plot. Set the se = FALSE to remove the confidence interval and method = lm to
#check for linear modeling.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)

