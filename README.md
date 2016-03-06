####Readme file to accompany the Coursera/JHU Getting and Cleaning Data class, Week 4 Assignment


#####Todd Taylor
#####2/29/16


There is only one script for this assignment, run_analysis.R. It must sit in the directory UCI HAR Dataset
(see https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
with the files activity_labels.txt and features.txt in the same directory; subject_test.txt,  X_test.txt, and
y_test.txt in the subdirectory test below it; subject_train.txt, X_train.txt, and y_train.txt in the subdirectory
train below it.

To run simply open R and type source("run_analysis.R"). Note that the R packages plyr, dplyr, and 
data.table must be installed in order to run the script. It writes only one file called tidy_data.csv. 
But intermediate results that answer the assignment questions can be viewed while in R in the data 
frames named: data_question1, data_question2, ..., data_question5.





