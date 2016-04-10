

#Variables


# Data Set construction
All files appear to be space-delimited with no headers. Those arguments were necessary to read all files. 

## Combining the data ##

### Reading each feature set ###
The training and test data sets came from , _test/X_test.txt_ and _train/X_train.txt_ .

#### Labels ####
Labels for these data sets came from _'UCI_HAR_Dataset/features.txt'_ contains the 561 labels for each feature. It had 561 values, which is consistent with the number of variables (columns) in the training and test data sets.

#### Add subject ID ####
Each needed to include their respective subject ID data sets.  _test/subject_test.txt_ and _train/subject_train.txt_ . There were no row labels or other obvious join criteria. But, each had the same number of rows as their respective feature sets (2947 and 7352), which suggests that they were ordered the same way.

#### Activity ####
The README.md for the dataset called _test/subject_test.txt_ and _train/subject_train.txt_ the 'test labels'. The distinct values for these ranged from 1 to 5, which is consistent with the activity labels. These files became the 'activity' column in the feature data sets. Like the subject ID, these files had no row labels, but had the same number of observations (rows) as their respective data sets. So they are bound to the feature dataset in their original order from the file.

### Bringing them together ###
Label the origin of each feature set by adding 'train' and 'test' to a column called 'dataset'

## Selecting the desired variables ##
Keep only activity ID and those features with 'mean' and 'std' in the label.
Replace activity ID with human-readable activity labels


# Assumptions #
1. Y_test and Y_train files identified activities (assumed because the values were 1-6, and the README described that each record (directory) would have activity labels)
2. Activity and subject files for each data set had no row names, but had the same number of observations (rows) as the feature data sets (X_test, X_train). So I assumed they were meant to be in the same order.