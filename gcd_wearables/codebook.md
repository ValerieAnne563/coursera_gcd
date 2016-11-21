#About the data

run_analysis.R summarizes raw data for the UCI Wearables Dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And it produces a file called _summaries.txt_
Bring it into R with `read.table("summaries.txt", row.name=FALSE)`

## Variables  
### subject_id
The first variable indicates the id of the subject

### activity_name 
The second variable indicates the activity being measured, one of six

 WALKING  
 WALKING_UPSTAIRS  
 WALKING_DOWNSTAIRS  
 SITTING  
 STANDING  
 LAYING  

### Summary data (79 variables)
The original experiment captured multiple observations while a given subject performed an activity.   
This dataset describes the mean and std deviation of each of those measurements.
Where more than one observation exists for a given subject at that activity, the dataset provides an average of them.

A detailed explanation of the data and the measurements are available in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# Data Set construction

## Combining the data ##
All files appear to be space-delimited with no headers. Those arguments were necessary to read all files. 

### Reading each feature data set ###
The training and test data sets came from , _test/X_test.txt_ and _train/X_train.txt_ .  
Also called the "measurement data sets"

#### Labels ####
Variable labels come from _'UCI_HAR_Dataset/features.txt'_ contains the 561 labels for each feature.  
It had 561 values, which is consistent with the number of variables (columns) in the training and test data sets.  
In the final data set, the labels have been updated to remove parentheses characters, and replace dashes with underscores.

#### Add subject ID ####
Each measurement data set needed to include their respective subject ID data sets.  _test/subject_test.txt_ and _train/subject_train.txt_ .
There was no apparent data relationship between the measurement data sets and the subject files, other than they had the same number of observations. So, result assumes that entries in the subject files map to the measurements 1:1, and are in the same order.

#### Activity ####
The README.md for the dataset called _test/subject_test.txt_ and _train/subject_train.txt_ the 'test labels'.  
The second columns of these files became the 'activity_name' column in the feature data sets. 
Like the subject ID, they are bound to the feature dataset in their original order from the file.

### Bringing them together ###
During an intermediate step, the script labels the origin of each feature set by adding 'train' and 'test' to a column called 'dataset'  
This column is not present in the final data set.

## Selecting the desired variables ##
Keep only the measurements with '-mean' and '-std' in the label.