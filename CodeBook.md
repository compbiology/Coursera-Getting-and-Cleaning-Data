####Codebook file to accompany the Coursera/JHU Getting and Cleaning Data class, Week 4 Assignment


#####Todd Taylor
#####2/29/16


This file describes changes and merges made to the data files:

* features.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* activity_labels.txt
* subject_test.txt
* subject_train.txt


taken from a dataset of smartphone accelerometer derived data intended to characterize the physical
activity of the phone users.  Briefly, this original dataset contained ~10000 observations from 30 people,
where each person performed six physical activities. Each observation had 561 measurements associated
with it. The dataset is spread out among the 8 files listed above, which can be obtained at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

There were several steps involved in creating a tidy data set for the Getting and Cleaning Data week 4 
class assignment.

* started up R
* read in necessary R libraries, read the separate files above into separate data frames
* the activity and subject columns were tacked onto the right side of the big 561 column test and train frames
* the generic header was replaced with the contents of features.txt plus "activity" and "subject"
* the resulting frame answers question1
* grepped out the column numbers where the column name contains ("Mean" or "mean") or "std" 
* concatenated and sorted these two vectors from grep 
* selected  only these columns from the big frame from question1" to answer question2
* cut the subject and activity columns off the end  of the frame from question1
* joined this two column frame with activity_labels
* cut out the activity column from the joined frame to leave a two col frame with subjects and activity labels
* tacked this onto the right side of the frame from question2 to answer question3
* replaced existing hypens  and commas with underscores using gsub to answer question4.
* sorted  the frame from question4  first by activity_label and then by subject using arrange to get the tidy set.



