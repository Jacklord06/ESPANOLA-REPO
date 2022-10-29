#JACKLORD ESPANOLA BSIT-2A

#Using functions seq(), assign(), min(), max(), c(), sort(), sum(), filter()

#1. Set up a vector named age consisting of 34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37,
#34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41, 51, 35, 24, 33, 41.

age <- c( 34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37,
          34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41, 51, 35, 24, 33, 41)
age

# a. a.How many data points? 
length(age)

#b.Write the R code and its output.

#2.Find the reciprocal of the values for age.
#Write the R code and its output.
reciprocal <- function(age) vec <- 1/age 
rage <- reciprocal(age)
rage

#3.Assign also new_age <- c(age, 0, age). 
#What happen to the new_age?
new_age <-c (age, 0, age)
new_age

#4.Sort the values for age.
#Write the R code and its output.
sort(age)

#5. Find the minimum and maximum value for age.
#Write the R code and its output.
min(age)
max(age)

#6.Set up a vector named data, consisting of 2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
#2.5, 2.3, 2.4, and 2.7.
data_vector <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7)
#a. How many data points?
length(data_vector)#12 is the data points

#7.Generates a new vector for data where you double every value of the data. What happen
#to the data?
data_vector*2 #This will display the double value of every data

#8.Generate a sequence for the following scenario:
#8.1 Integers from 1 to 100
int <- seq(1:100)
int
length(seq(1:100))

#8.2 Numbers from 20 to 60
num <- seq(20,60)
num
length(seq(20,60))

#8.3 Mean of numbers from 20 to 60
num <- mean(20:60)
num
length(mean(20:60))

#8.4 Sum of numbers from 51 to 91
num <- sum(51:91)
num
length(sum(51:91))

#8.5 Integers from 1 to 1,000
int <- seq(1:1000)
int

#a. How many data points from 8.1 to 8.4?_______
dp<- sum(100,40,1,1)
dp

#9. *Print a vector with the integers between 1 and 100 that are not divisible by 3, 5 and 7
#using filter option.
#Write the R code and its output.
Filter(function(i) { all(i%%c(3,5,7) !=0) }, seq(100))

#10. Generate a sequence backwards of the integers from 1 to 100.
#Write the R code and its output.
c(100:1)

#11. List all the natural numbers below 25 that are multiples of 3 or 5.
#Find the sum of these multiples.
sum((1:25)[((1:25)%%3 == 0) | ((1:25)%%5 == 0)])
#a. How many data points from 10 to 11?
  #ANSWER: 101

#12 Enter this statement:
  { x <- 0+ x + 5 + }
#Describe the output:
  #The output is error

#13. *Set up a vector named score, consisting of 72, 86, 92, 63, 88, 89, 91, 92, 75,
#75 and 77. To access individual elements of an atomic vector, one generally uses the x[i]
#construction.
#Find x[2] and x[3]. Write the R code and its output.
sc <- c(72, 86, 92, 63, 88, 89, 91, 92, 75,75, 77)
sc

#14. Create a vector a = c(1,2,NA,4,NA,6,7)
#a. Change the NA to 999 using the codes print(a,na.print="-999").
a <- c(1,2,NA,4,NA,6,7)
a
print(a,na.print="-999")

#15. What is the output of the above code?
class(x) <- "foo"
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ")
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)
#OUTPUT: "My name is and I am years old."

