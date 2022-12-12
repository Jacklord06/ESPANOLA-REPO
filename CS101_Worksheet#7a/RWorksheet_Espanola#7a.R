#Espanola, Jacklord BSIT 2-A
#Worksheet-7a in R

#Basic Statistics
#1. Create a data frame for the table below.
exam_result <- data.frame(
  Student = c(1:10),
  Pretest = c(55, 54, 57, 47, 51, 61, 57, 54, 63, 58),
  Posttest = c(61, 60, 56, 63, 56, 63, 59, 56, 62, 61)
)
exam_result                          

#a. Compute the descriptive statistics using different packages (Hmisc and 
#pastecs). Write the codes and its result.

#Using the Hmisc package
library(Hmisc)
describe(exam_result)

#Using the pastecs package
library(pastecs)
stat.desc(exam_result)


#2. The Department of Agriculture was studying the effects of several levels of
#a fertilizer on the growth of a plant. For some analyses, it might be useful to
#convert the fertilizer levels to an ordered factor.
#• The data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.

#a. Write the codes and describe the result.
fertilizer_levels <- c(10,10,10,20,20,50,10,20,10,50,20,50,20,10)

fertilizer_factor_levels <- factor(c(fertilizer_levels), ordered = TRUE, 
                                   levels = c(10,20,50))
fertilizer_factor_levels

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense

#a. What is the best way to represent this in R?
exercise_levels <- data.frame(
  subject_exercise_levels = c("l", "n", "n", "i", "l", "l", "n", "n", "i", "l")
)
exercise_levels


#4. Sample of 30 tax accountants from all the states and territories of
#Australia and their individual state of origin is specified by a character
#vector of state mnemonics as:
  state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
             "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
             "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
             "vic", "vic", "act")
  state
  str(state)
#a. Apply the factor function and factor level. Describe the results.
state_factor <- factor(c(state)) 
state_factor
#factor level                     
levels(state_factor)

#5. From #4 - continuation:
#• Suppose we have the incomes of the same tax accountants in another vector (in
#suitably large units of money)
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
incomes

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
income_mean <- tapply(incomes, state, mean)
income_mean

#b. Copy the results and interpret.

#The result shows the income mean of each state and its level as well. It shows
#"tas" has the highest income mean while the "act" has the lowest mean among 
#eight state


#6. Calculate the standard errors of the state income means (refer again to 
#number 3)
stdError <- sd(income_mean)/sqrt(length(income_mean))
stdError

#b. Interpret the result.
#The result simply shows the standard errors of the state income means through 
#dividing the standard deviation of the income mean by the square root of the 
#length of the income mean. Having larger sample size, the standard errors tend 
#decreases which mean the lesser spread out values are around the mean in a 
#dataset.


#7. Use the titanic dataset.
data(Titanic)
Titanic <- data.frame(Titanic)
#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.
survived <- subset(Titanic, Survived == "Yes")
survived

unsurvived <- subset(Titanic, Survived == "No")
unsurvived


#8. The data sets are about the breast cancer Wisconsin. The samples arrive
#periodically as Dr. Wolberg reports his clinical cases. The database therefore
#reflects this chronological grouping of the data. You can create this dataset 
#in Microsoft Excel.

#a. describe what is the dataset all about.
#The data sets are about the breast cancer Wisconsin. The samples arrive
#periodically as Dr. Wolberg reports his clinical cases. 

#b. Import the data from MS Excel. Copy the codes.
library(readxl)
dataSet <- read_excel("Breast_Cancer.xlsx")
View(dataSet)

#c. Compute the descriptive statistics using different packages. Find the
#values of:
#c.1 Standard error of the mean for clump thickness.
error.n <- length(dataSet$`CL. thickness`)
error.sd <- sd(dataSet$`CL. thickness`)
error.se <- error.sd/sqrt(dataSet$`CL. thickness`)
error.se

#c.2 Coefficient of variability for Marginal Adhesion.
coe_var <- sd(dataSet$`Marg. Adhesion`) / mean(dataSet$`Marg. Adhesion`) * 100
coe_var

#c.3 Number of null values of Bare Nuclei.
bare_nuclei <- subset(dataSet, `Bare. Nuclei` == "NA") 
bare_nuclei
  
#c.4 Mean and standard deviation for Bland Chromatin
mean(dataSet$`Bl. Cromatin`)
sd(dataSet$`Bl. Cromatin`)

#c.5 Confidence interval of the mean for Uniformity of Cell Shape

#Calculating the mean
mean_cshape <- mean(dataSet$`Cell Shape`)
mean_cshape

#Calculating the standard error of the mean
cshape.n <- length(dataSet$`Cell Shape`)
cshape.sd <- sd(dataSet$`Cell Shape`)
cshape.se <- cshape.sd/sqrt(cshape.n)
cshape.se

#Step 3: Find the t-score that corresponds to the confidence level
alpha = 0.05
df_cshape = cshape.n - 1
t.score = qt(p=alpha/2, df=df_cshape,lower.tail=F)
t.score

#Constructing the confidence interval
cInterval <- t.score * cshape.se
cInterval

#Lower
lower_cInterval <- mean_cshape - cInterval

#Upper
upper_cInterval <- mean_cshape + cInterval

c(lower_cInterval,upper_cInterval)


#d. How many attributes?
attributes(dataSet)

#e. Find the percentage of respondents who are malignant. Interpret the results.
mrespondents <- subset(dataSet, Class == "malignant")
mrespondents

#There 17 respondents who are malignant from the total of 49 respondent.

#Getting the percentage
17  / 49 * 100
#There are 34.69388 or 35% of respondents who are malignant.


#9. Export the data abalone to the Microsoft excel file. Copy the codes.
install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")
data(abalone)
View(abalone)
head(abalone)
summary(abalone)

#Exporting the data abalone to the Microsoft excel file
library(xlsx)
write.xlsx("abalone", "C:\\Abalone\\abalone.xlsx")

