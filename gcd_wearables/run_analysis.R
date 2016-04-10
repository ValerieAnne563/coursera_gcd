library(dplyr)
setwd("~/Documents/personal/coursera/datasciencecoursera/gcd_wearables/UCI HAR Dataset")

#Objective
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Getting
download.file("http://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip", 
              "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")
setwd("~/Documents/personal/coursera/datasciencecoursera/gcd_wearables/UCI HAR Dataset")


#Pull the column name vectors
feature_labels = read.csv('features.txt', sep = "", header = FALSE)
activity_labels = read.csv('activity_labels.txt', sep = "", header = FALSE)

clean_feature_set <- function(set_name){
  
  #Data comes from X_setname, space-delimited, has no header
  # and apply the column names
  feature_file <- paste0(set_name, "/X_", set_name, ".txt")
  #    This is the slow line.
  feature_set <- tbl_df(read.csv(feature_file, sep="", header = FALSE, col.names = feature_labels$V2))
  
  #Get the subject IDs
  subject_file <- paste0(set_name, "/subject_", set_name, ".txt")
  subject_ids <- read.csv(subject_file, header = FALSE, col.names = c("subject_id"))
  
  #Get the activity IDs
  activity_file <- paste0(set_name, "/y_", set_name, ".txt")
  activity_labels <- read.csv(activity_file, header = FALSE, col.names = c("activity_id"))
  
  return(feature_set %>%
           bind_cols(activity_labels) %>%
           bind_cols(subject_ids) %>%
           mutate(dataset = set_name))
}

test_set <- clean_feature_set('test')
training_set <- clean_feature_set('train')

combined_set <- bind_rows(test_set, training_set) %>%
  select(matches("mean"), matches("std"))


#For each record in the dataset it is provided: 
#  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
# The "Inertial Signals" folder has files labeled 'total_acc' and 'body_acc'. That must be them.
#total_acc_test_x <- tbl_df(data.frame(x = read.csv("test/Inertial Signals/total_acc_x_test.txt", sep="")))
# Cleanup: Space - delimited, and needs 128 meaningful labels, then do the same to y and z and join

#  - Triaxial Angular velocity from the gyroscope. 
# The "Inertial Signals" folder has files labeled 'body_gyro'. That must be them.
#test_acc_test_x <- tbl_df(data.frame(x = read.csv("test/Inertial Signals/total_acc_x_test.txt", sep="")))