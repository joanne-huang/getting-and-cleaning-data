
## Introduction

####Raw Data Set
Data was collected from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

Raw data files included "subject_test.txt", "X_test", "y_test", "subject_train.txt", "X_train.txt", "y_train.txt", "features.txt", and "activity_labels.txt".


subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#### Tidy Data Set
The R script run_analysis.R was used to clean up the raw data set and output "tidyData.txt", the clean data set.
subjectID is a number identifying the subject. activityName describes the activity the subject was performing.


## Variables
* activities is a table with the activity names.
* test_data is a table with the test data.
* train_data is a table with the training data.
* all_data is a table combining the test data and training data.
* features_col is character vector with the feature names.
* subsetted_data is a subset of all_data with the columns of interest.
* mergedData is a table with columns of interest and the activity names.
* melted is a melted version of mergedData.
* tidyData is the final data set.

## Transformations
* Using read.table, files were read into data tables.
* test_data and train_data were created using cbind(). all_data was created using rbind().
* Names of features were cleaned up using gsub().
* Using grep, columns of interest (mean and standard deviation) were selected for.
* melt() and dcast() were used to consolidate the data.


