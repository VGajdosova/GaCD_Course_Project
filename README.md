
### Coursera: COURSE PROJECT
### Data science specialization course: Getting and Cleaning Data
### Veronika Gajdosova


## GENERAL INFORMATION

This repository holds all my work for the "Getting and Cleaning data" project course. The description of the files can be found below (script file-run_analysis.R, codeBook.md, tidydata.txt)

## OBJECTIVE OF THE PROJECT

Create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each * activity and each subject.

## DATA SOURCE:
The data for the project were downloaded from the following source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### DESCRIPTION OF THE DATA FILES IN THIS REPOSITORY:

1. SCRIPT FILE (run_analysis.R): The R script file run_analysis.R does the following steps:

 * Downloads the dataset into a folder named project and unzips data (checking is introduced to see if the folder exists first)
 * Loads the information on features and activity from the corresponding text files (both train and test data)
 * Merges the training and the test sets to create one data set
 * Names variables with descriptive names (loading information from the features.txt file) 
 * Merges columns of all datasets into one data frame
 * Extracts only measurements on the mean and standard deviation for each measurement
 * Uses descriptive activity names to name the activities in the data set - Levels of Varible Activity come from “activity_labels.txt”, factorizing variable activity
 * Appropriately labels the data set with descriptive variable names (changes shortenings/prefixes for full descriptive name. The following substitutions were applied: <br />

	`Gyro -> Gyroskope`
	`Mag -> Magnitude`
	`Prefix "t" -> Time`
	`Acc -> Accelerometer`
	`BodyBody -> Body`
	`Prefix "f" -> Frequency`

 * Creates an independent tidy data set with the average of each variable for each activity and each subject.
 * Finally, the script will create a tidy data set containing the means of all the columns (per test subject & per activity). The name of this tidy dataset is called tidydata.txt, and it can also be found in this repository together with the codebook and run_analysis.R code.

 

2. THE CODEBOOK (CodeBook.md)

The file provides project information (objectives of the project, information on the data, variables, as well as any transformation and work performed in the process of tidying the data to the final stage. <br />

3. TIDY DATA SET (tidydata.txt)

Tidy data set containing the means of all the columns per test subject and per activity
