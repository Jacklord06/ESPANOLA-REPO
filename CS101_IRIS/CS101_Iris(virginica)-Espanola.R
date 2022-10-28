#1. data(iris)
data("iris")
iris


#2. Subset the iris set into 3 files- per species(virginica)
subset(iris, Species == "virginica")


#3. Get the total mean for each species(viriginica)
#Each column will declare an object to get the total mean of viriginica
mean_1 <- iris$Sepal.Length[101:150]
mean_1
mean_2 <- iris$Sepal.Width[101:150]
mean_2
mean_3 <- iris$Petal.Length[101:150]
mean_3
mean_4 <- iris$Petal.Width[101:150]
mean_4

#total mean of viriginica
virginica_mean <- c(mean_1, mean_2, mean_3, mean_4)
virginica_mean

mean(virginica_mean)#4.285 is the total mean viriginica


#4.Get the mean of each characteristics of the species
#Sepal.Length
mean(mean_1)#6.588 is the mean

#Sepal.Width
mean(mean_2)#2.974 is the mean

#Petal.Length
mean(mean_3)#5.552 is the mean

#Petal.Width
mean(mean_4)#2.026 is the mean
