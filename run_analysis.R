run_analysis <- function() {
  
  #the script and UCI HAR Dataset have to be in the same folder 
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
  X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names="y")
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names="y")
  
  #Step1: merge the test and train datasets
  #test dataset has 2947 rows and train dataset has 7352 rows, a total of 10299 rows
  subject<-rbind(subject_test,subject_train)
  x<-rbind(X_test,X_train)
  y<-rbind(y_test,y_train)
  
  #Step2: extract measurements on mean and sd for each measurement
  dataset<-cbind(subject,y,x[,1:6],x[,41:46],x[,81:86],x[,121:126],x[,161:166],x[,201:202],
                  x[,214:215],x[,227:228],x[,240:241],x[,253:254],x[,266:271],x[,345:350],
                  x[,424:429],x[,503:504],x[,516:517],x[,529:530],x[,542:543])
  
  #Step3: use descriptive names to name the activities 
  for(i in 1:dim(dataset)[1]) {
    if(dataset$y[i]==1) {
      dataset$y[i]="WALKING"
    }
    else if(dataset$y[i]==2) {
      dataset$y[i]="WALKING_UPSTAIRS"
    }
    else if(dataset$y[i]==3) {
      dataset$y[i]="WALKING_DOWNSTAIRS"
    }
    else if(dataset$y[i]==4) {
      dataset$y[i]="SITTING"
    }
    else if(dataset$y[i]==5) {
      dataset$y[i]="STANDING"
    }
    else if(dataset$y[i]==6) {
      dataset$y[i]="LAYING"
    }
  }
  
  #Step4: label dataset with descriptive names
  names(dataset)[1]<-paste("Subject")
  names(dataset)[2]<-paste("Activity")
  names(dataset)[3]<-paste("tBodyAcc_Mean_X")
  names(dataset)[4]<-paste("tBodyAcc_Mean_Y")
  names(dataset)[5]<-paste("tBodyAcc_Mean_Z")
  names(dataset)[6]<-paste("tBodyAcc_Std_X")
  names(dataset)[7]<-paste("tBodyAcc_Std_Y")
  names(dataset)[8]<-paste("tBodyAcc_Std_Z")
  names(dataset)[9]<-paste("tGravityAcc_Mean_X")
  names(dataset)[10]<-paste("tGravityAcc_Mean_Y")
  names(dataset)[11]<-paste("tGravityAcc_Mean_Z")
  names(dataset)[12]<-paste("tGravityAcc_Std_X")
  names(dataset)[13]<-paste("tGravityAcc_Std_Y")
  names(dataset)[14]<-paste("tGravityAcc_Std_Z")
  names(dataset)[15]<-paste("tGravityAccJerk_Mean_X")
  names(dataset)[16]<-paste("tGravityAccJerk_Mean_Y")
  names(dataset)[17]<-paste("tGravityAccJerk_Mean_Z")
  names(dataset)[18]<-paste("tGravityAccJerk_Std_X")
  names(dataset)[19]<-paste("tGravityAccJerk_Std_Y")
  names(dataset)[20]<-paste("tGravityAccJerk_Std_Z")
  names(dataset)[21]<-paste("tBodyGyro_Mean_X")
  names(dataset)[22]<-paste("tBodyGyro_Mean_Y")
  names(dataset)[23]<-paste("tBodyGyro_Mean_Z")
  names(dataset)[24]<-paste("tBodyGyro_Std_X")
  names(dataset)[25]<-paste("tBodyGyro_Std_Y")
  names(dataset)[26]<-paste("tBodyGyro_Std_Z")
  names(dataset)[27]<-paste("tBodyGyroJerk_Mean_X")
  names(dataset)[28]<-paste("tBodyGyroJerk_Mean_Y")
  names(dataset)[29]<-paste("tBodyGyroJerk_Mean_Z")
  names(dataset)[30]<-paste("tBodyGyroJerk_Std_X")
  names(dataset)[31]<-paste("tBodyGyroJerk_Std_Y")
  names(dataset)[32]<-paste("tBodyGyroJerk_Std_Z")
  names(dataset)[33]<-paste("tBodyAccMag_Mean")
  names(dataset)[34]<-paste("tBodyAccMag_Std")
  names(dataset)[35]<-paste("tGravityAccMag_Mean")
  names(dataset)[36]<-paste("tGravityAccMag_Std")
  names(dataset)[37]<-paste("tBodyAccJerkMag_Mean")
  names(dataset)[38]<-paste("tBodyAccJerkMag_Std")
  names(dataset)[39]<-paste("tBodyGyroMag_Mean")
  names(dataset)[40]<-paste("tBodyGyroMag_Std")
  names(dataset)[41]<-paste("tBodyGyroJerkMag_Mean")
  names(dataset)[42]<-paste("tBodyGyroJerkMag_Std")
  names(dataset)[43]<-paste("fBodyAcc_Mean_X")
  names(dataset)[44]<-paste("fBodyAcc_Mean_Y")
  names(dataset)[45]<-paste("fBodyAcc_Mean_Z")
  names(dataset)[46]<-paste("fBodyAcc_Std_X")
  names(dataset)[47]<-paste("fBodyAcc_Std_Y")
  names(dataset)[48]<-paste("fBodyAcc_Std_Z")
  names(dataset)[49]<-paste("fBodyAccJerk_Mean_X")
  names(dataset)[50]<-paste("fBodyAccJerk_Mean_Y")
  names(dataset)[51]<-paste("fBodyAccJerk_Mean_Z")
  names(dataset)[52]<-paste("fBodyAccJerk_Std_X")
  names(dataset)[53]<-paste("fBodyAccJerk_Std_Y")
  names(dataset)[54]<-paste("fBodyAccJerk_Std_Z")
  names(dataset)[55]<-paste("fBodyGyro_Mean_X")
  names(dataset)[56]<-paste("fBodyGyro_Mean_Y")
  names(dataset)[57]<-paste("fBodyGyro_Mean_Z")
  names(dataset)[58]<-paste("fBodyGyro_Std_X")
  names(dataset)[59]<-paste("fBodyGyro_Std_Y")
  names(dataset)[60]<-paste("fBodyGyro_Std_Z")
  names(dataset)[61]<-paste("fBodyAccMag_Mean")
  names(dataset)[62]<-paste("fBodyAccMag_Std")
  names(dataset)[63]<-paste("fBodyAccJerkMag_Mean")
  names(dataset)[64]<-paste("fBodyAccJerkMag_Std")
  names(dataset)[65]<-paste("fBodyGyroMag_Mean")
  names(dataset)[66]<-paste("fBodyGyroMag_Std")
  names(dataset)[67]<-paste("fBodyGyroJerkMag_Mean")
  names(dataset)[68]<-paste("fBodyGyroJerkMag_Std")
  
  #Save a copy for dataset for step5
  rawDataset<-dataset
  
  #Step5: create a second dataset with average of each activity+subject combination
  dataset<-ddply(rawDataset,.(Subject,Activity),summarize,
      Avg_tBodyAcc_Mean_X=mean(tBodyAcc_Mean_X),
      Avg_tBodyAcc_Mean_Y=mean(tBodyAcc_Mean_Y),
      Avg_tBodyAcc_Mean_Z=mean(tBodyAcc_Mean_Z),
      Avg_tBodyAcc_Std_X=mean(tBodyAcc_Std_X),
      Avg_tBodyAcc_Std_Y=mean(tBodyAcc_Std_Y),
      Avg_tBodyAcc_Std_Z=mean(tBodyAcc_Std_Z),
      Avg_tGravityAcc_Mean_X=mean(tGravityAcc_Mean_X),
      Avg_tGravityAcc_Mean_Y=mean(tGravityAcc_Mean_Y),
      Avg_tGravityAcc_Mean_Z=mean(tGravityAcc_Mean_Z),
      Avg_tGravityAcc_Std_X=mean(tGravityAcc_Std_X),
      Avg_tGravityAcc_Std_Y=mean(tGravityAcc_Std_Y),
      Avg_tGravityAcc_Std_Z=mean(tGravityAcc_Std_Z),
      Avg_tGravityAccJerk_Mean_X=mean(tGravityAccJerk_Mean_X),
      Avg_tGravityAccJerk_Mean_Y=mean(tGravityAccJerk_Mean_Y),
      Avg_tGravityAccJerk_Mean_Z=mean(tGravityAccJerk_Mean_Z),
      Avg_tGravityAccJerk_Std_X=mean(tGravityAccJerk_Std_X),
      Avg_tGravityAccJerk_Std_Y=mean(tGravityAccJerk_Std_Y),
      Avg_tGravityAccJerk_Std_Z=mean(tGravityAccJerk_Std_Z),
      Avg_tBodyGyro_Mean_X=mean(tBodyGyro_Mean_X),
      Avg_tBodyGyro_Mean_Y=mean(tBodyGyro_Mean_Y),
      Avg_tBodyGyro_Mean_Z=mean(tBodyGyro_Mean_Z),
      Avg_tBodyGyro_Std_X=mean(tBodyGyro_Std_X),
      Avg_tBodyGyro_Std_Y=mean(tBodyGyro_Std_Y),
      Avg_tBodyGyro_Std_Z=mean(tBodyGyro_Std_Z),
      Avg_tBodyGyroJerk_Mean_X=mean(tBodyGyroJerk_Mean_X),
      Avg_tBodyGyroJerk_Mean_Y=mean(tBodyGyroJerk_Mean_Y),
      Avg_tBodyGyroJerk_Mean_Z=mean(tBodyGyroJerk_Mean_Z),
      Avg_tBodyGyroJerk_Std_X=mean(tBodyGyroJerk_Std_X),
      Avg_tBodyGyroJerk_Std_Y=mean(tBodyGyroJerk_Std_Y),
      Avg_tBodyGyroJerk_Std_Z=mean(tBodyGyroJerk_Std_Z),
      Avg_tBodyAccMag_Mean=mean(tBodyAccMag_Mean),
      Avg_tBodyAccMag_Std=mean(tBodyAccMag_Std),
      Avg_tGravityAccMag_Mean=mean(tGravityAccMag_Mean),
      Avg_tGravityAccMag_Std=mean(tGravityAccMag_Std),
      Avg_tBodyAccJerkMag_Mean=mean(tBodyAccJerkMag_Mean),
      Avg_tBodyAccJerkMag_Std=mean(tBodyAccJerkMag_Std),
      Avg_tBodyGyroMag_Mean=mean(tBodyGyroMag_Mean),
      Avg_tBodyGyroMag_Std=mean(tBodyGyroMag_Std),
      Avg_tBodyGyroJerkMag_Mean=mean(tBodyGyroJerkMag_Mean),
      Avg_tBodyGyroJerkMag_Std=mean(tBodyGyroJerkMag_Std),
      Avg_fBodyAcc_Mean_X=mean(fBodyAcc_Mean_X),
      Avg_fBodyAcc_Mean_Y=mean(fBodyAcc_Mean_Y),
      Avg_fBodyAcc_Mean_Z=mean(fBodyAcc_Mean_Z),
      Avg_fBodyAcc_Std_X=mean(fBodyAcc_Std_X),
      Avg_fBodyAcc_Std_Y=mean(fBodyAcc_Std_Y),
      Avg_fBodyAcc_Std_Z=mean(fBodyAcc_Std_Z),
      Avg_fBodyAccJerk_Mean_X=mean(fBodyAccJerk_Mean_X),
      Avg_fBodyAccJerk_Mean_Y=mean(fBodyAccJerk_Mean_Y),
      Avg_fBodyAccJerk_Mean_Z=mean(fBodyAccJerk_Mean_Z),
      Avg_fBodyAccJerk_Std_X=mean(fBodyAccJerk_Std_X),
      Avg_fBodyAccJerk_Std_Y=mean(fBodyAccJerk_Std_Y),
      Avg_fBodyAccJerk_Std_Z=mean(fBodyAccJerk_Std_Z),
      Avg_fBodyGyro_Mean_X=mean(fBodyGyro_Mean_X),
      Avg_fBodyGyro_Mean_Y=mean(fBodyGyro_Mean_Y),
      Avg_fBodyGyro_Mean_Z=mean(fBodyGyro_Mean_Z),
      Avg_fBodyGyro_Std_X=mean(fBodyGyro_Std_X),
      Avg_fBodyGyro_Std_Y=mean(fBodyGyro_Std_Y),
      Avg_fBodyGyro_Std_Z=mean(fBodyGyro_Std_Z),
      Avg_fBodyAccMag_Mean=mean(fBodyAccMag_Mean),
      Avg_fBodyAccMag_Std=mean(fBodyAccMag_Std),
      Avg_fBodyAccJerkMag_Mean=mean(fBodyAccJerkMag_Mean),
      Avg_fBodyAccJerkMag_Std=mean(fBodyAccJerkMag_Std),
      Avg_fBodyGyroMag_Mean=mean(fBodyGyroMag_Mean),
      Avg_fBodyGyroMag_Std=mean(fBodyGyroMag_Std),
      Avg_fBodyGyroJerkMag_Mean=mean(fBodyGyroJerkMag_Mean),
      Avg_fBodyGyroJerkMag_Std=mean(fBodyGyroJerkMag_Std)
  )
  
  #export the dataset from step5 as a text file
  write.table(dataset,"./tidyDataset.txt",row.names=FALSE)
  
}