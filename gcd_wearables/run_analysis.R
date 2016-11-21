library(dplyr)

## if the dataset is already in the current working directory, proceed! (submission state)
if(any(dir() == "features.txt")){
  data_dir = "./"
} else {
  data_dir = "UCI HAR Dataset"
  ## Otherwise, check to see if the working directory has the unzipped folder (local state)
  ## If not, download it!
  if(! any(dir() == data_dir)){
    zip.name <- "UCI_HAR_Dataset.zip"
    download.file("http://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip", 
                  zip.name)
    unzip(zip.name)
    file.remove(zip.name)
  }
}

## First time the script is run, download the data and change the working directory

means_and_stds <- (function(data_dir){
  clean_feature_set <- function(data_dir, set_name){
    
    #Example: (function(old_label) gsub("[\\(\\)]", "", gsub("-", "_", "tBodyAcc-mad()-X")))("tBodyAcc-mad()-X") 
    feature_labels <- read.csv(paste0(data_dir, '/features.txt'), sep = "", header = FALSE)
    feature_labels <- lapply(feature_labels, (function(old_label) gsub("[\\(\\)]", "", gsub("-", "_", old_label))))  
    
    #Data comes from X_setname, space-delimited, has no header
    # and apply the column names  
    feature_file <- paste0(data_dir, "/", set_name, "/X_", set_name, ".txt")
    cat(paste("Fetching [", set_name, "] data set. This may take a few moments..."))
    feature_set <- tbl_df(read.csv(feature_file, sep="", header = FALSE, 
                                   col.names = feature_labels$V2))  #    This is the slow line.
    
    #Get the subject IDs
    subject_file <- paste0(data_dir, "/", set_name, "/subject_", set_name, ".txt")
    subject_ids <- read.csv(subject_file, header = FALSE, col.names = c("subject_id"))
    
    #Get the activity IDs
    activity_file <- paste0(data_dir, "/", set_name, "/y_", set_name, ".txt")
    activity_ids <- read.csv(activity_file, header = FALSE, col.names = c("activity_id"))
    
    cat("done.\n")
    return(feature_set %>%
             bind_cols(activity_ids) %>%
             bind_cols(subject_ids) %>%
             mutate(dataset = set_name))
  }
  
  test_set <- clean_feature_set(data_dir, 'test')
  training_set <- clean_feature_set(data_dir, 'train')
  
  activity_labels = read.csv(paste0(data_dir, '/activity_labels.txt'), 
                             sep = "", header = FALSE, col.names = c("activity_id", "activity_name"))
  
  means_and_stds <- bind_rows(test_set, training_set) %>%
    select(matches("_mean"), matches("_std"), matches("activity_id"), matches("subject_id")) %>%
    left_join(activity_labels) %>%                   # use the activity_id to attach the activity names
    select(-activity_id) %>%                         # don't need activity_id anymore
    select(subject_id, activity_name, everything())  # reorder columns so that subject and activity name appear first  
  
  cat("Data set with means and stds merged and prepared.\n")
  return(means_and_stds)
})(data_dir)


#File for objectives 1-4
write.csv(means_and_stds, "./means_and_stds.csv", row.names=FALSE)

#File for objective 5
summaries <- means_and_stds %>%
  group_by(subject_id, activity_name) %>%
  summarise_each(funs(mean))
#write.csv(summaries, "./summaries.csv", row.names=FALSE)
write.table(summaries, "./summaries.txt", row.names=FALSE)

