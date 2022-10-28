#1. data(iris) 
data("iris")
iris


#2. Subset the iris set into 3 files- per species(setosa)
subset(iris, Species == "setosa")


#3. Get the total mean for each species(setosa)
#Each column will declare an object to get the total mean of setosa
mean_1 <- iris$Sepal.Length[1:50]
mean_1
mean_2 <- iris$Sepal.Width[1:50]
mean_2
mean_3 <- iris$Petal.Length[1:50]
mean_3
mean_4 <- iris$Petal.Width[1:50]
mean_4

#total mean of setosa
setosa_mean <- c(mean_1, mean_2, mean_3, mean_4)
setosa_mean

mean(setosa_mean)#the total mean of setosa is 2.5355


#4.Get the mean of each characteristics of the species
#Sepal.Length
mean(mean_1)#5.006 is the mean

#Sepal.Width
mean(mean_2)#3.428 is the mean

#Petal.Length
mean(mean_3)#1.462 is the mean

#Petal.Width
mean(mean_4)#0.246 is the mean

