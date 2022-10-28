#1. data(iris) 
data("iris")
iris

#2. Subset the iris set into 3 files- per species(versicolor)
subset(iris, Species == "versicolor")

#3. Get the total mean for each species(setosa)
#Each column will declare an object to get the total mean of versicolor
mean_1 <- iris$Sepal.Length[51:100]
mean_1
mean_2 <- iris$Sepal.Width[51:100]
mean_2
mean_3 <- iris$Petal.Length[51:100]
mean_3
mean_4 <- iris$Petal.Width[51:100]
mean_4

#total mean of versicolor
versicolor_mean <- c(mean_1,mean_2,mean_3, mean_4)
versicolor_mean

mean(versicolor_mean)#3.573 is the total mean of versicolor

#4.Get the mean of each characteristics of the species
#Sepal.Length
mean(mean_1)#5.936 is the mean

#Sepal.Width
mean(mean_2)#2.77 is the mean

#Petal.Length
mean(mean_3)#4.26 is the mean

#Petal.Width
mean(mean_4)#1.326 is the mean



