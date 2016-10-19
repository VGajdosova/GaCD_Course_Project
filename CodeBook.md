### Coursera course: Getting and Cleaning data (Data Science Specialization)
### Veronika Gajdosova
### October 2016

*********************************************************************************************************************
##														CODEBOOK
*********************************************************************************************************************

This Codebook contains additional information about the project itself, the information about the data set, variables and the process applied to prepare a tidy data set as per the project instructions.

*********************************************************************************************************************
##												INSTRUCTIONS FOR THE PROJECT
*********************************************************************************************************************


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*********************************************************************************************************************
##												    PROJECT INFORMATION
*********************************************************************************************************************

* DATA FOR THE PROJECT:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Attribute Information:

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


*********************************************************************************************************************
##										ADDITIONAL INFORMATION & VARIABLE DESCRIPTION
*********************************************************************************************************************

For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:

##Files used for analysis

* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

##Explanation of the connection between the data files and the variables

A. Values of Variable Activity consist of: <br />
	1. data from “Y_train.txt” <br />
	2. data from “Y_test.txt” <br />

B. Values of Variable Subject consist of: <br />
	1. data from “subject_train.txt” <br />
	2. and subject_test.txt" <br />

C. Values of Variable Features consist of: <br />
    1. data from “X_train.txt” <br />
    2. data from “X_test.txt” <br />


D. Particular levels of Variable Activity come from “activity_labels.txt”

E. Names of Variable Features come from “features.txt”

In order to have descriptive variables, "Activity" "Subject" and "Features" will be used in the variable names. To distinguish between the test and train data, _testdata or _traindata, will be used as suffixes to variable names.


### VARIABLE DESCRIPTION FOR THE VARIABLES USED IN THE CODE LEADING TO A CLEAN DATA SET (steps for the tidy data process are described below)

* str(Activity_Traindata)
'data.frame':	7352 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...

* str(Activity_Testdata)
'data.frame':	2947 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...

* str(Subject_Traindata)
'data.frame':	7352 obs. of  1 variable:
 $ V1: int  1 1 1 1 1 1 1 1 1 1 ...

* str(Subject_Testdata)
'data.frame':	2947 obs. of  1 variable:
 $ V1: int  2 2 2 2 2 2 2 2 2 2 ...

* str(Features_Traindata)
'data.frame':	7352 obs. of  561 variables:
 $ V1  : num  0.289 0.278 0.28 0.279 0.277 ...
 $ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ V3  : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ V4  : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ V5  : num  -0.983 -0.975 -0.967 -0.983 -0.981 ... <br />
 

(list output truncated) <br />

* str(Features_Testdata)
'data.frame':	2947 obs. of  561 variables:
 $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
 $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ V3  : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ V4  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 $ V5  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ... <br />

(list output truncated) <br />

## AFTER MERGING TEST DATA AND TRAINING DATA TO HAVE ONE DATA SET FOR SUBJECT/ACTIVITY/FEATURES(RBINDING)

* str(Subject_data)
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  2 2 2 2 2 2 2 2 2 2 ...

* str(Features_data)
'data.frame':	10299 obs. of  561 variables:
 $ V1  : num  0.257 0.286 0.275 0.27 0.275 ...
 $ V2  : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ V3  : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ V4  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 $ V5  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ... <br />

(list output truncated)

* str(Activity_data)
'data.frame':	10299 obs. of  1 variable:
 $ V1: int  5 5 5 5 5 5 5 5 5 5 ...


## Data_All data frame after all data sets are merged together:

* str(Data_All)
'data.frame':	10299 obs. of  563 variables:
 $ ACTIVITY                            : int  5 5 5 5 5 5 5 5 5 5 ...
 $ SUBJECT                             : int  2 2 2 2 2 2 2 2 2 2 ...
 $ tBodyAcc-mean()-X                   : num  0.257 0.286 0.275 0.27 0.275 ...
 $ tBodyAcc-mean()-Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ tBodyAcc-mean()-Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ tBodyAcc-std()-X                    : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 $ tBodyAcc-std()-Y                    : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...



## EXTRACTING THE MEASUREMENTS ON THE MEAN AND STD FOR EACH MEASUREMENT 
## Data set with with measurements on the mean and standard deviation only

* str(Names_selection)
 chr [1:81] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" ...

* str(Data_All_StD_Mean)
'data.frame':	10299 obs. of  68 variables:
 $ tBodyAcc-mean()-X          : num  0.257 0.286 0.275 0.27 0.275 ...
 $ tBodyAcc-mean()-Y          : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ tBodyAcc-mean()-Z          : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ tBodyAcc-std()-X           : num  -0.938 -0.975 -0.994 -0.995 -0.994 ... <br />
 ...(truncated) <br />
 $ SUBJECT                    : int  2 2 2 2 2 2 2 2 2 2 ...
 $ ACTIVITY                   : int  5 5 5 5 5 5 5 5 5 5 ... <br />



## Appropriately labels the data set with descriptive variable names (changes shortenings/prefixes for full descriptive name. The following substitutions were applied: 

1. Gyro -> Gyroskope
2. Mag -> Magnitude
3. Prefix "t" -> Time
4. Acc -> Accelerometer
5. BodyBody -> Body
6. Prefix "f" -> Frequency


* names(Data_All_StD_Mean)
 [1] "TimeBodyAccelerometer-mean()-X"                
 [2] "TimeBodyAccelerometer-mean()-Y"                
 [3] "TimeBodyAccelerometer-mean()-Z"                
 [4] "TimeBodyAccelerometer-std()-X"                 
 [5] "TimeBodyAccelerometer-std()-Y"                 
 [6] "TimeBodyAccelerometer-std()-Z"                 
 [7] "TimeGravityAccelerometer-mean()-X"             
 [8] "TimeGravityAccelerometer-mean()-Y"             
 [9] "TimeGravityAccelerometer-mean()-Z"             
[10] "TimeGravityAccelerometer-std()-X"              
[11] "TimeGravityAccelerometer-std()-Y"              
[12] "TimeGravityAccelerometer-std()-Z"              
[13] "TimeBodyAccelerometerJerk-mean()-X"            
[14] "TimeBodyAccelerometerJerk-mean()-Y"            
[15] "TimeBodyAccelerometerJerk-mean()-Z"            
[16] "TimeBodyAccelerometerJerk-std()-X"             
[17] "TimeBodyAccelerometerJerk-std()-Y"             
[18] "TimeBodyAccelerometerJerk-std()-Z"             
[19] "TimeBodyGyroskope-mean()-X"                    
[20] "TimeBodyGyroskope-mean()-Y"                    
[21] "TimeBodyGyroskope-mean()-Z"                    
[22] "TimeBodyGyroskope-std()-X"                     
[23] "TimeBodyGyroskope-std()-Y"                     
[24] "TimeBodyGyroskope-std()-Z"                     
[25] "TimeBodyGyroskopeJerk-mean()-X"                
[26] "TimeBodyGyroskopeJerk-mean()-Y"                
[27] "TimeBodyGyroskopeJerk-mean()-Z"                
[28] "TimeBodyGyroskopeJerk-std()-X"                 
[29] "TimeBodyGyroskopeJerk-std()-Y"                 
[30] "TimeBodyGyroskopeJerk-std()-Z"                 
[31] "TimeBodyAccelerometerMagnitude-mean()"         
[32] "TimeBodyAccelerometerMagnitude-std()"          
[33] "TimeGravityAccelerometerMagnitude-mean()"      
[34] "TimeGravityAccelerometerMagnitude-std()"       
[35] "TimeBodyAccelerometerJerkMagnitude-mean()"     
[36] "TimeBodyAccelerometerJerkMagnitude-std()"      
[37] "TimeBodyGyroskopeMagnitude-mean()"             
[38] "TimeBodyGyroskopeMagnitude-std()"              
[39] "TimeBodyGyroskopeJerkMagnitude-mean()"         
[40] "TimeBodyGyroskopeJerkMagnitude-std()"          
[41] "FrequencyBodyAccelerometer-mean()-X"           
[42] "FrequencyBodyAccelerometer-mean()-Y"           
[43] "FrequencyBodyAccelerometer-mean()-Z"           
[44] "FrequencyBodyAccelerometer-std()-X"            
[45] "FrequencyBodyAccelerometer-std()-Y"            
[46] "FrequencyBodyAccelerometer-std()-Z"            
[47] "FrequencyBodyAccelerometerJerk-mean()-X"       
[48] "FrequencyBodyAccelerometerJerk-mean()-Y"       
[49] "FrequencyBodyAccelerometerJerk-mean()-Z"       
[50] "FrequencyBodyAccelerometerJerk-std()-X"        
[51] "FrequencyBodyAccelerometerJerk-std()-Y"        
[52] "FrequencyBodyAccelerometerJerk-std()-Z"        
[53] "FrequencyBodyGyroskope-mean()-X"               
[54] "FrequencyBodyGyroskope-mean()-Y"               
[55] "FrequencyBodyGyroskope-mean()-Z"               
[56] "FrequencyBodyGyroskope-std()-X"                
[57] "FrequencyBodyGyroskope-std()-Y"                
[58] "FrequencyBodyGyroskope-std()-Z"                
[59] "FrequencyBodyAccelerometerMagnitude-mean()"    
[60] "FrequencyBodyAccelerometerMagnitude-std()"     
[61] "FrequencyBodyAccelerometerJerkMagnitude-mean()"
[62] "FrequencyBodyAccelerometerJerkMagnitude-std()" 
[63] "FrequencyBodyGyroskopeMagnitude-mean()"        
[64] "FrequencyBodyGyroskopeMagnitude-std()"         
[65] "FrequencyBodyGyroskopeJerkMagnitude-mean()"    
[66] "FrequencyBodyGyroskopeJerkMagnitude-std()"     
[67] "SUBJECT"                                       
[68] "ACTIVITY"



The TIDY.TXT file contains the fields that will be described below:

## IDENTIFIERS:

* `SUBJECT` - Corresponds to the test subject ID
* `ACTIVITY` - Corresponds to the type of activity performed during the measurements


## Activity Labels

* 1. WALKING: subject was walking during the test
* 2. WALKING_UPSTAIRS: subject was walking up a staircase during the test
* 3. WALKING_DOWNSTAIRS: subject was walking down a staircase during the test
* 4. SITTING: subject was sitting during the test
* 5. STANDING: subject was standing during the test
* 6. LAYING: subject was laying down during the test


*********************************************************************************************************************
												    CREATING THE CLEAN DATAFILE
*********************************************************************************************************************
## GETTING THE DATA 

Downloading of data from the source and unzipping it in the project folder (./project). Unzipping of the data into the project subfolder UCI HAR Dataset

## READING OF DATA FROM THE PARTICULAR FILES

* Reading of data from the files into the variables <br />

 * Read the Activity files <br />
 * Read the Subject files <br />
 * Read Features files <br /> 

As mentioned above - Explanation of the connection between the data files and the variables

A. Values of Variable Activity consist of: <br />
	* data from “Y_train.txt” <br />
	* data from “Y_test.txt” <br />

B. Values of Variable Subject consist of: <br />
	* data from “subject_train.txt” <br />
	* and subject_test.txt" <br />

C. Values of Variable Features consist of: <br />
    * data from “X_train.txt” <br />
    * data from “X_test.txt” <br />


D. Particular levels of Variable Activity come from “activity_labels.txt”

E. Names of Variable Features come from “features.txt”

## CREATING ONE DATA SET BY MERGING THE TRAINING AND THE TEST SETS 
* merging the data tables by rows
* naming the variables with Subject and Activity names
* creating one data set for all data (merging by columns)


## EXTRACTING THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR PARTICULAR MEASUREMENTS
* Subsetting the Name of Features by measurements on the mean and standard deviation and using these selected feature names to subset the data frame.

## USING DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET 
* Descriptive activity names are read from “activity_labels.txt”
* Variable Activity is factorized in the data frame using descriptive activity names

## APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES 

The following substitutions were applied: <br />

* Gyro -> Gyroskope 
* Mag -> Magnitude
* Prefix "t" -> Time
* Acc -> Accelerometer
* BodyBody -> Body
* Prefix "f" -> Frequency

7. CREATING A SECOND, INDEPENDENT TIDY DATA SET AND OUTPUTING IT INTO TIDYDATA.TXT 

Tidy data set is created with the average of each variable for each activity and each subject based on the data set in the previous step. It is saved in the project folder.























