## TL, DR ##
run run_analysis.R, and it will produce  
1. stds_and_means.csv  
This is the dataset for Objectives 1-4. See "Result Files" for a detailed description of its contents.

## Scripts ##

1. run_analysis.R   
This is the primary script, which generates the tidy data sets.

## Side Effects ##
run_analysis.R generates several files.  
If sourced, it does not change the working directory.

### Result Files ###

1. produces stds_and_means.csv  

This is a comma-separated file including 88 variable names and 10299 results
- The feature_labels have been reformatted to replace dashes with underscores, and remove parens
- First variable is the subject_id
- Second variable is the activity_name
- Remaining 86 variables are the means and averages for all measurements [every feature originally labeled -mean() or -std()]


### Original data ###
run_analysis.R will check to see if there is a file called "feature.txt" in the current working directory.  
If it does not find one, it will download and unzip all the original data in to a directory called "UCI_HAR Dataset"