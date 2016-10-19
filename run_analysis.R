#Coursera Course project: Getting and Cleaning data 
#Description of the runAnalysis.r File Description:

#Data for the project used:

#The R script run_analysis.R that does the following.

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Clean up of the workspace
rm(list=ls())

library(reshape2)

# DOWNLOADING DATA AND CREATING PROJECT FOLDER
if(!file.exists("./project")){dir.create("./project")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./project/project_Data.zip",method="curl")
unzip(zipfile="./project/project_Data.zip",exdir="./project")

# LIST FILES UNZIPPED IN THE PROJECT FOLDER 
Data_path <- "./project/UCI HAR Dataset"
Data_path_test <- "./project/UCI HAR Dataset/test"
Data_path_train <- "./project/UCI HAR Dataset/train"

ListFiles<-list.files(Data_path, recursive=TRUE)
ListFiles

# READING VALUES OF VARIABLE ACTIVITY FROM THE CORRESPONDING .TXT FILES
#TRAIN DATA
Subject_Traindata <- read.table(file.path(Data_path_train, "subject_train.txt"), header = FALSE)
Features_Traindata <- read.table(file.path(Data_path_train, "X_train.txt"), header = FALSE)
Activity_Traindata <- read.table(file.path(Data_path_train, "y_train.txt"), header = FALSE)

#TEST DATA
Subject_Testdata  <- read.table(file.path(Data_path_test, "subject_test.txt"), header = FALSE)
Features_Testdata  <- read.table(file.path(Data_path_test, "X_test.txt" ), header = FALSE)
Activity_Testdata  <- read.table(file.path(Data_path_test, "y_test.txt" ), header = FALSE)

# MERGING OF THE TRAIN AND TEST DATASETS FOR THE SUBJECT, FEATURES and ACTIVITY - BINDING BY ROWS
Subject_data <- rbind( Subject_Testdata, Subject_Traindata)
Features_data<- rbind(Features_Testdata, Features_Traindata)
Activity_data <- rbind(Activity_Testdata, Activity_Traindata)

# NAMING VARIABLES WITH DESCRIPTIVE NAMES, NAME OF THE FEATURES COMING FROM FEATURES.TXT)
# Reading the features.txt file that holds the variable names for Features_data
Features_Names <- read.table(file.path(Data_path, "features.txt"), header=FALSE)
names(Features_data)<- Features_Names$V2
# Applying the name of the variable Subject
names(Subject_data)<-c("SUBJECT")
# Applying the name of the variable Activity
names(Activity_data)<- c("ACTIVITY")


# MERGING COLUMNS TO 1 DATA FRAME IN TWO STEPS VIA CBIND
Bind_Activity_Subject <- cbind(Activity_data, Subject_data)
Data_All <- cbind(Bind_Activity_Subject, Features_data)

#EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT 
Features_Names_selection<-Features_Names$V2[grep("mean\\(\\)|std\\(\\)", Features_Names$V2)]
Names_selection<-c(as.character(Features_Names_selection), "SUBJECT", "ACTIVITY")
Data_All_StD_Mean<-subset(Data_All,select=Names_selection)

#USES DESCRIPTIVE ACITIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
#Levels of Varible Activity come from “activity_labels.txt”. Factorizing Variable activity in the Data_All_StD_Mean data frame
#using descriptive names of activities
Activity_Labels <- read.table(file.path(Data_path, "activity_labels.txt"), header = FALSE)
Data_All_StD_Mean$ACTIVITY <- factor(Data_All_StD_Mean$ACTIVITY, levels = Activity_Labels[,1], label = Activity_Labels[,2])

#APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES 
names(Data_All_StD_Mean)<-gsub("Gyro", "Gyroskope", names(Data_All_StD_Mean))
names(Data_All_StD_Mean)<-gsub("Mag", "Magnitude", names(Data_All_StD_Mean))
names(Data_All_StD_Mean)<-gsub("^t", "Time", names(Data_All_StD_Mean))
names(Data_All_StD_Mean)<-gsub("Acc", "Accelerometer", names(Data_All_StD_Mean))
names(Data_All_StD_Mean)<-gsub("BodyBody", "Body", names(Data_All_StD_Mean))
names(Data_All_StD_Mean)<-gsub("^f", "Frequency", names(Data_All_StD_Mean))

#CREATION OF AN INDEPENDENT TIDY DATA WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY
#AND EACH SUBJECT BASED ON THE DATA SET IN THE PREVIOUS STEP
Data_Final.melted <- melt(Data_All_StD_Mean, id = c("SUBJECT", "ACTIVITY"))
Data_Final.mean <- dcast(Data_Final.melted, SUBJECT + ACTIVITY ~ variable, mean)
write.table(Data_Final.mean, "./project/tidydata.txt", row.names = FALSE)
