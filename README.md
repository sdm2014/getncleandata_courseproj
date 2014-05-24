Course Project for "Getting and Cleaning Data" (Coursera May 2014)
========================

This is the README file for the repo related to the course project for
the "Getting and Cleaning Data" Coursera May 2014 project

The goal of this project is to generate a tidy data set according to the 
specifications listed for the assignment

## Table of Contents

The contents of this repo are as follows

1) CodeBook.Md

* This includes details about the starting and final dataset such as:
* Original dataset and a description of the variables 
* Transformations and major steps carried out to obtain the final, tidy data set
* A description of the variable names (in the tidy data set) for better understanding
    
2) run_analysis.R

* This is the actual R code used to generate the tidy data set
* Wherever necessary, appropriate comments have been added to the code to explain the approach used
* Please note that the original data set i.e. "UCI HAR Dataset" should be extracted
  to the user's R working directory i.e. there should already be an unzipped folder
  denoted as "UCI HAR Dataset" in the working directory
* As mentioned in the project specifications, the run_analysis.R code does not need to include any steps to download/unzip the data

3) tidydata.txt

* This is the final tidy data set output to the user's R working directory upon execution of the script "run_analysis.R"
* This data set contains information tabulated by subject identifier (numeric) and descriptive activity label (character), with each row pertaining to a unique combination of the two
* There are a total of 30 subjects x 6 activities = 180 rows in the final table
* There are a total of 68 columns (subject ID and activity label identifier + 66 data variable columns)
* Each variable included in the tidy dataset is in one column
* Variable names are all in lower case without special characters
* Note that "fully descriptive" variables names would be too long based on the nature of these variables. Hence, users are requested to read through the "CodeBook.md" in order to understand what these variables mean

    
## How to run the R script included in this repo

* First, ensure that the "UCI HAR Dataset" is downloaded, unzipped and extracted to the user's R working directory with the "UCI HAR Dataset" as the main folder
* Next, source the run_analysis.R file from the working directory
* There will be an output file "tidydata.txt" generated, which contains the final tidy data set. This file is written to the user's R working directory
* These are the only steps needed to generate the "tidydata.txt" file

## Acknowledgements
I am very grateful to my peers on this course and the Community TAs (especially David Hood) for their valuable insight