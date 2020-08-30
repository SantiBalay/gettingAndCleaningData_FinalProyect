run_analysis <- function() {
  
  

  ##load data
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = list("code", "activity"))
  features <- read.table("UCI HAR Dataset/features.txt", col.names = list("n","functions"))
  
  xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  
  yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActivityCode")
  yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActivityCode")
  
  subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "SubjectCode")
  subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "SubjectCode")
  
  #merge dfs
  x <- rbind(xTest,xTrain)
  y <- rbind(yTest,yTrain)
  subject <- rbind(subjectTest,subjectTrain)
  
  #merge into dataset
  mergedDataset <- cbind(subject,x,y)
  mergedDataset <- as_tibble(mergedDataset)
  
  #get means and stds only
  
  finalDataSet <- mergedDataset %>% select(SubjectCode, ActivityCode, contains("mean"), contains("std"))
  
  #adding descriptive names to the activities
  
  finalDataSet$ActivityCode <- factor(finalDataSet$ActivityCode, levels = activities[,1], labels = activities[,2])
  #changing variable labels to more descriptive names
  
  names(finalDataSet)<-gsub("Gyro", "Gyroscope", names(finalDataSet))
  names(finalDataSet)<-gsub("Acc", "Accelerometer", names(finalDataSet))
  names(finalDataSet)<-gsub("Mag", "Magnitude", names(finalDataSet))
  names(finalDataSet)<-gsub("fBody", "FrequencyBody", names(finalDataSet))
  names(finalDataSet)<-gsub("tBody", "TimeBody", names(finalDataSet))
  names(finalDataSet)<-gsub("\\.","", names(finalDataSet))
  names(finalDataSet)<-gsub("^t","", names(finalDataSet))
  names(finalDataSet)<-gsub("mean","Mean", names(finalDataSet))
  names(finalDataSet)<-gsub("std","Std", names(finalDataSet))
  
  #create averages
  grouped <- test1 %>% group_by(ActivityCode,SubjectCode) %>% summarise_all(mean)

  #wirte files
  write.table(finalDataSet, "finalDataSet.txt", row.name=FALSE)
  write.table(grouped, "avarageDataSet.txt", row.name=FALSE)
  
}