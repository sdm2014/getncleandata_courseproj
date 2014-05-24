## code for Course Project of "Getting and Cleaning Data"
## offered by Coursera from May 2nd 2014
## Copyright SDM2014

## We assume that the "UCI HAR Dataset" has been extracted 
## to the R working directory since that has been left out of the requirements
## for this code
## The file structure within this extracted directory is unchanged 

## The data used here will be referenced within R code by "har" prefix since 
## it relates to the Human Activity Recognition effort

## Approach:
## 1st step is to read in the appropriate data files for test and train to form
## a starting data frame
## Next, we merge in the subject and activity labels along with the appropriate
## descriptions
## This forms the main starting data frame, but without variable names
## Next, we take the variable names as per the "features.txt" and convert them
## into usable and unique variable names compatible with R
## Next, we extact the column positions of the variables corresponding to the
## mean and standard deviation of the measurements
## Following this, we subset the main dataframe to include only the mean and 
## standard deviation measurements, for each subject and labeled activity
## Next, we summarize the mean for each of these variables by subject and activity
## This summary is written to a new data frame which represents the tidy data set
## Finally, we output a .txt file of this tidy data set as per requirements


## form a data frame of all measurements
har.test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = "")

har.train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep = "")

har.data <- rbind(har.test,har.train)

## form a data frame of all subjects

subject.test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep = "")

subject.train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep = "")

har.subject <- rbind(subject.test,subject.train)

## extract activity by number

activ.test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", sep = "")

activ.train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", sep = "")

har.activ <- rbind(activ.test,activ.train)

## merge activity label descriptions to the numeric activity descriptors

activ.label <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", sep = "")

## need to use the "join" function in plyr in order to preserve the sequence of
## the activity labels described by numbers

install.packages("plyr")
library(plyr)

har.activ.label <- join(x = har.activ, y = activ.label, by = 1, type = "left", match = "first")

## need to remove the initial columns as they only contain numeric activity labels
har.activ.label <- as.data.frame(har.activ.label[ , -(1:3)])

colnames(har.activ.label) <- "activity"
    
## merge the subject, labeled activity and data to one large data frame

har.activ.label.subject.data <- cbind(har.subject, har.activ.label, har.data)

## variable names cleanup. start with the raw variables.

har.features.raw <- read.table(".\\UCI HAR Dataset\\features.txt", sep = "")

har.features.raw.char <- as.character(har.features.raw[ ,2])

## form clean variables by
## i) removing punctuation like ( ) - , . etc.
## ii) changing variables to lower case since that is the "standard" format
## Note: we have some repeated variables names in "bands energy" group,
## but we chose to ignore them since we will extract only mean and std variables

har.features.clean <- tolower(gsub(pattern="[[:punct:]]", x = har.features.raw.char, replacement=""))

## extract the indices where std or mean occur in variable names
## BUT, we also exclude "mean"freq or angle variables including mean since they
## do not actually correspond to the specification in the assignment i.e. 
## not direct mean or std.dev

meanstd.indices <- which(grepl("std|mean", har.features.clean)&!grepl("meanfreq|angle", har.features.clean))

meanstd.labels <- har.features.clean[meanstd.indices]

## need to shift the indices, since the 1st two cols of the final dataframe 
## will be subject & activity

meanstd.indices.shift <- meanstd.indices+2

## form a subset dataframe with only the mean & std variables
har.activ.label.subject.data.sub <- har.activ.label.subject.data[ ,c(1:2,meanstd.indices.shift)]

## use a shorter name for the dataframe :-)
har.df.sub <- har.activ.label.subject.data.sub

## assign the column names in order of subject, activity and the mean & std variables
colnames(har.df.sub) <- c("subject", "activity",har.features.clean[meanstd.indices])

## create a different data set composed of the means of the variables
## summarize variable means by subject and labeled activity

install.packages("reshape2")
library(reshape2)

## melt first to arrange by id variables of subject and activity
har.df.sub.melt <- melt(har.df.sub, id.vars = c("subject", "activity"))

## then dcast with aggregation = mean for subject and activity
har.df.sub.mean <- dcast(har.df.sub.melt, subject+activity ~ variable, fun.aggregate = mean, na.rm = TRUE)

## writes the output to a file called tidydata.txt, removes the row nums
write.table(har.df.sub.mean, file = "tidydata.txt", sep = " ", row.names = FALSE)

## we're done :)





