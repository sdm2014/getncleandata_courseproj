Code Book for "Getting and Cleaning Data" course project (Coursera May 2014)
========================

This is the Code Book file for the course project, which is to generate a tidy data
set based on the UCI HAR Dataset (according to the project specifications)

The contents of this Code Book are as follows

1) Original dataset and a description (general) of the variables

* The dataset is known as the "UCI HAR Dataset" and pertains to data for Human Activity Recognition which was obtained using a Samsung Galaxy S smartphone
* The data is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Note: this data should be unzipped and extracted to the user's R working directory in order to enable the run_analysis.R script to execute properly
* For more details, please refer to the "README.txt" and "features_info.txt" files included in the dataset
* Essentially the data was from experiments carried out on 30 subjects who were made to perform 6 different activities (walking, walking upstairs, walking downstairs,   sitting, standing and lying down), all while motion data was captured using the embedded accelerometer and gyroscope for the Samsung Galaxy S smartphone worn by the subjects on the waist
* A significant amount of processing was done on the raw data (please look through the README.txt file) in order to extract both time- and frequency- domain variables corresponding to sensor signals from gravitational and body motion components (as a 561 feature vector)
* The original UCI HAR Dataset was organized as follows
    - Partitioned into a test and training dataset, with appropriate activity labels
    - Subject identification information was also divided into the test and train datasets
    - An overall "features_info.txt" file contained information on the postprocessing of the data for both gravitational and body acceleration (along X,Y,Z axes as appropriate)
    - The actual variables were based on summaries of these raw variables such as mean, standard deviation (std. dev.), max, min, energy etc. and others described in detail in the file above
    - Note that the variable names for the test and train data sets were present in the "features.txt" file and not as headers in these datasets to start with
    
2) Transformations carried out to obtain the final, tidy data set

* The approach was divided into 2 major parts
* The first part was focused on forming the "full" data table from the test & train datasets, while including the information regarding the subject and activity
* This involved appending the test and train datasets first
* Then the subject and activity label information is merged into the test+train dataset, while preserving the row order information
* The descriptive activity labels like "walking, sitting" etc. are used to replace the numeric descriptors originally present, in order to conform to tidy data principles
* Next, the raw variable names (561 original) are converted to R-compatible variable names by removing special characters. All variables are also converted to lowercase
* As per the assignment, the "mean" and "standard deviation" variables are identified and this information is used to form a subset of the original data tables, while merging in the modified variables names
* Next, a summary (average) is calculated for these mean/stdev variables, summarizing by subject ID and activity
* Finally, a tidy data set is generated from this summary table

3) A description of the variables names (in the tidy data set)

* The variables extracted all represent the AVERAGE of the mean/stdev original variables, as summarized by subject ID and activity label
* There are a total of 68 columns, which correspond to 2 key columns (subject ID and labeled activity) and 66 data columns which contain the required measured variables
* These variables correspond to various time- and frequency- domain measurements of gravitational and body acceleration signals as described below

| #  | variable name            | description                                                  |
|----|--------------------------|--------------------------------------------------------------|
| 1  | subject                  | subject number                                               |
| 2  | activity                 | labeled activity descriptor                                  |
| 3  | tbodyaccmeanx            | x-axis mean of body acceleration in time domain              |
| 4  | tbodyaccmeany            | y-axis mean of body acceleration in time domain              |
| 5  | tbodyaccmeanz            | z-axis mean of body acceleration in time domain              |
| 6  | tbodyaccstdx             | x-axis std. dev. of body acceleration in time domain         |
| 7  | tbodyaccstdy             | y-axis std. dev. of body acceleration in time domain         |
| 8  | tbodyaccstdz             | z-axis std. dev. of body acceleration in time domain         |
| 9  | tgravityaccmeanx         | x-axis mean of gravity acceleration in time domain           |
| 10 | tgravityaccmeany         | y-axis mean of gravity acceleration in time domain           |
| 11 | tgravityaccmeanz         | z-axis mean of gravity acceleration in time domain           |
| 12 | tgravityaccstdx          | x-axis std. dev of gravity acceleration in time domain       |
| 13 | tgravityaccstdy          | y-axis std. dev of gravity acceleration in time domain       |
| 14 | tgravityaccstdz          | z-axis std. dev of gravity acceleration in time domain       |
| 15 | tbodyaccjerkmeanx        | x-axis mean of body acceleration jerk in time domain         |
| 16 | tbodyaccjerkmeany        | y-axis mean of body acceleration jerk in time domain         |
| 17 | tbodyaccjerkmeanz        | z-axis mean of body acceleration jerk in time domain         |
| 18 | tbodyaccjerkstdx         | x-axis std. dev of body acceleration jerk in time domain     |
| 19 | tbodyaccjerkstdy         | y-axis std. dev of body acceleration jerk in time domain     |
| 20 | tbodyaccjerkstdz         | z-axis std. dev of body acceleration jerk in time domain     |
| 21 | tbodygyromeanx           | x-axis mean of body gyro in time domain                      |
| 22 | tbodygyromeany           | y-axis mean of body gyro in time domain                      |
| 23 | tbodygyromeanz           | z-axis mean of body gyro in time domain                      |
| 24 | tbodygyrostdx            | x-axis std. dev. of body gyro in time domain                 |
| 25 | tbodygyrostdy            | y-axis std. dev. of body gyro in time domain                 |
| 26 | tbodygyrostdz            | z-axis std. dev. of body gyro in time domain                 |
| 27 | tbodygyrojerkmeanx       | x-axis mean of body gyro jerk in time domain                 |
| 28 | tbodygyrojerkmeany       | y-axis mean of body gyro jerk in time domain                 |
| 29 | tbodygyrojerkmeanz       | z-axis mean of body gyro jerk in time domain                 |
| 30 | tbodygyrojerkstdx        | x-axis std. dev. of body gyro jerk in time domain            |
| 31 | tbodygyrojerkstdy        | y-axis std. dev. of body gyro jerk in time domain            |
| 32 | tbodygyrojerkstdz        | z-axis std. dev. of body gyro jerk in time domain            |
| 33 | tbodyaccmagmean          | mean of body acceleration magnitude in time domain           |
| 34 | tbodyaccmagstd           | std. dev. of body acceleration magnitude in time domain      |
| 35 | tgravityaccmagmean       | mean of gravity acceleration magnitude in time domain        |
| 36 | tgravityaccmagstd        | std. dev. of gravity acceleration magnitude in time domain   |
| 37 | tbodyaccjerkmagmean      | mean of body acceleration jerk magnitude in time domain      |
| 38 | tbodyaccjerkmagstd       | std. dev. of body acceleration jerk magnitude in time domain |
| 39 | tbodygyromagmean         | mean of body gyro magnitude in time domain                   |
| 40 | tbodygyromagstd          | std. dev. of body gyro magnitude in time domain              |
| 41 | tbodygyrojerkmagmean     | mean of body gyro jerk magnitude in time domain              |
| 42 | tbodygyrojerkmagstd      | std. dev. of body gyro jerk magnitude in time domain         |
| 43 | fbodyaccmeanx            | x-axis mean of body acceleration in freq domain              |
| 44 | fbodyaccmeany            | y-axis mean of body acceleration in freq domain              |
| 45 | fbodyaccmeanz            | z-axis mean of body acceleration in freq domain              |
| 46 | fbodyaccstdx             | x-axis std. dev. of body acceleration in freq domain         |
| 47 | fbodyaccstdy             | y-axis std. dev. of body acceleration in freq domain         |
| 48 | fbodyaccstdz             | z-axis std. dev. of body acceleration in freq domain         |
| 49 | fbodyaccjerkmeanx        | x-axis mean of body acceleration jerk in freq domain         |
| 50 | fbodyaccjerkmeany        | y-axis mean of body acceleration jerk in freq domain         |
| 51 | fbodyaccjerkmeanz        | z-axis mean of body acceleration jerk in freq domain         |
| 52 | fbodyaccjerkstdx         | x-axis std. dev of body acceleration jerk in freq domain     |
| 53 | fbodyaccjerkstdy         | y-axis std. dev of body acceleration jerk in freq domain     |
| 54 | fbodyaccjerkstdz         | z-axis std. dev of body acceleration jerk in freq domain     |
| 55 | fbodygyromeanx           | x-axis mean of body gyro in freq domain                      |
| 56 | fbodygyromeany           | y-axis mean of body gyro in freq domain                      |
| 57 | fbodygyromeanz           | z-axis mean of body gyro in freq domain                      |
| 58 | fbodygyrostdx            | x-axis std. dev. of body gyro in freq domain                 |
| 59 | fbodygyrostdy            | y-axis std. dev. of body gyro in freq domain                 |
| 60 | fbodygyrostdz            | z-axis std. dev. of body gyro in time domain                 |
| 61 | fbodyaccmagmean          | mean of body acceleration magnitude in freq domain           |
| 62 | fbodyaccmagstd           | std. dev. of body acceleration magnitude in freq domain      |
| 63 | fbodybodyaccjerkmagmean  | mean of body acceleration jerk magnitude in freq domain      |
| 64 | fbodybodyaccjerkmagstd   | std. dev. of body acceleration jerk magnitude in freq domain |
| 65 | fbodybodygyromagmean     | mean of body gyro magnitude in freq domain                   |
| 66 | fbodybodygyromagstd      | std. dev. of body gyro magnitude in freq domain              |
| 67 | fbodybodygyrojerkmagmean | mean of body gyro jerk magnitude in freq domain              |
| 68 | fbodybodygyrojerkmagstd  | std. dev. of body gyro jerk magnitude in freq domain         |
