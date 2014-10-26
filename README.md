README
=====

Getting and Cleaning Data Course Project
-----------------------------------

###  Code Description for Script run_analysis.R

The purpose of this README file basically describes how the script run_analysis.R generate the tidy dataset.

The code in the script also comes with command lines that give the brief explanation on what each part of the code does so to increase the readability of the code in the script. 

The script in general is organized and divided into parts based on the project requirements.

1. **Load data from files**
  
        subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
        subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
        X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
        X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
        y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names="y")
        y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names="y")
        
        * The first six lines load files using data.table()
        
        
2. **Merge the test and train datasets**

        subject<-rbind(subject_test,subject_train)
        x<-rbind(X_test,X_train)
        y<-rbind(y_test,y_train)
        
        * The next three lines will merge the data from both test and train sets using rbind(), adding rows from train set after test set
        
        
3. **Extract measurements on mean and std**

        dataset<-cbind(subject,y,x[,1:6],x[,41:46],x[,81:86],x[,121:126],x[,161:166],x[,201:202],
                  x[,214:215],x[,227:228],x[,240:241],x[,253:254],x[,266:271],x[,345:350],
                  x[,424:429],x[,503:504],x[,516:517],x[,529:530],x[,542:543])
                  
        * After merging both test and train datasets, select measurements data such as mean and std only and use cbind() to combine all columns that are required to represent in the dataset
        

4. **Ude descriptive name to name the activities**

        for(i in 1:dim(dataset)[1]) {
          if(dataset$y[i]==1) {
            dataset$y[i]="WALKING"
          }
          else if(dataset$y[i]==2) {
            dataset$y[i]="WALKING_UPSTAIRS"
          }
          .....
          }
        }
    
      * The for loop following by is used for naming the acvitivites in the observations rather than represented in number1-6
        
        
5. **Label the dataset with descriptive names**

          names(dataset)[1]<-paste("Subject")
          names(dataset)[2]<-paste("Activity")
          names(dataset)[3]<-paste("tBodyAcc_Mean_X")
          names(dataset)[4]<-paste("tBodyAcc_Mean_Y")
          names(dataset)[5]<-paste("tBodyAcc_Mean_Z")
          .....
          
      * These 68 lines of code give descriptive names for each column of the dataset
      
      
6. **Create a second dataset with the mean of each combination of Subject+Activity and export a text file**

          dataset<-ddply(rawDataset,.(Subject,Activity),summarize,
            Avg_tBodyAcc_Mean_X=mean(tBodyAcc_Mean_X),
            Avg_tBodyAcc_Mean_Y=mean(tBodyAcc_Mean_Y),
            Avg_tBodyAcc_Mean_Z=mean(tBodyAcc_Mean_Z),
            .....
          )
          write.table(dataset,"./tidyDataset.txt",row.names=FALSE)
          
        * After obtaining the complete tidy dataset, ddply() is used to created a second dataset containing the mean of each measurement, classified by combination of Subject+Activity
          
          
  
    