library(reshape2)

#Load the data.
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Combine test and training data.
test_data<-cbind(subject_test, y_test, x_test )
train_data<-cbind(subject_train, y_train, x_train)
all_data<-rbind(test_data, train_data)

#Load and clean up column names.
features_col<-(as.character(features[,2]))
features_col<-gsub('-mean\\(\\)', ' Mean', features_col)
features_col<- gsub('-std\\(\\)', ' Std', features_col)

#Assign column names to data table.
names(all_data) <- c("subjectID","activityID",features_col)
names(activities)<-c("activityID", "activityNAME")

#Look for column names of interest (containing mean or std) and subset those columns.
mean_stdINDEX<-grep("Mean|Std", colnames(all_data))
mean_stdData<-all_data[,c(mean_stdINDEX)]
subsetted_data<-all_data[,c(1, 2, mean_stdINDEX)]

#Add activity names using activityID.
mergedData<-merge(activities,subsetted_data, by="activityID")

#Remove activityID column.
mergedData$activityID<-NULL

#Convert subjectID and activityName columns to factors.
mergedData$subjectID<-as.factor(mergedData$subjectID)
mergedData$activityNAME<-as.factor(mergedData$activityNAME)

#Melt data by subjectID and activityNAME.
melted<-melt(mergedData, id=c("subjectID", "activityNAME"))

#Convert values column to numeric.
melted[,4]<-as.numeric(melted[,4])

#Tidy up data set with dcast.
tidyData<-dcast(melted, subjectID+activityNAME ~ variable, mean)

#Write data to output file.
write.table(tidyData, "tidyData.txt")

