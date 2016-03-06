#############################################
#  read in necessary libraries, read the separate files
#  into separate data frames
#############################################
library(plyr)
library(dplyr)
library(data.table)

features<-read.table("features.txt")
xtest<-read.table("test/X_test.txt")
xtrain<-read.table("train/X_train.txt")
ytest<-read.table("test/y_test.txt")
ytrain<-read.table("train/y_train.txt")
activity_labels<- read.table("activity_labels.txt")
stest<-read.table("test/subject_test.txt")
strain<-read.table("train/subject_train.txt")

#############################################
#  tack the activity and subject columns onto the right
#  side of the big 561 column test and train frames
#  and replace the generic header with the contents
#  of features.txt plus "activity" and "subject"
#  the frame data_question1 is the answer to question1
#############################################
datax<-bind_cols(xtest,ytest,stest)
datay<-bind_cols(xtrain,ytrain,strain)
#data<-bind_rows(list(datax,datay))
temp<-list(datax,datay)
data_question1<-(rbindlist(temp))

f<-as.character(features[,2])
names<-c(f,"activity","subject")
names(data_question1)<-names

#############################################
#  grep out the column numbers where the column
#  name contains ("Mean" or "mean") or "std", then 
#  concatenate and sort these two vectors; then 
#  select only these columns from the big frame from 
#  question1" to make the answer to question2
#############################################
mean<-grep("[M|m]ean",names)
std<-grep("std",names)
mean_std<-sort(c(mean,std))
data_question2<-select(data_question1,mean_std)

#############################################
#   cut the subject and activity columns off the end  
#   of the frame from question1; join this two column
#   frame with activity_labels; cut out the activity 
#   column from the joined frame to leave a two col 
#   frame with subjects and activity labels; tack this
#   onto the right side of the frame from question2
#############################################
subject_activity<-select(data_question1,-(1:561))
names(activity_labels)<-c("activity","activity_label")
join_data<-join(subject_activity,activity_labels,type="inner")
join_data_trim<-select(join_data, -1)
data_question3<-bind_cols(data_question2,join_data_trim)

#############################################
#   the variable names are almost fine as they are; they 
#   are sufficiently descriptive now, and replacing capital
#   letters, underscores, etc as advocated in the lecture  
#   is silly; the whole point of capitalizing the first letter
#   of each word in a variable name or using underscores
#   between words is to make it easier  to see where 
#   each word begins; eliminating them makes it HARDER 
#   to read; I only replaced existing hypens  and commas, 
#   which might  interfere with parsing, with underscores
#############################################
data_question4<-data_question3
new_names<-gsub("-|,","_",names(data_question3))
names(data_question4)<-new_names

#############################################
#  now average the entries in the mean and sd columns 
#  for each unique subject/activity_label pair 
#############################################
#data_question5<-arrange(data_question4,activity_label,subject)
data_question5<- data_question4  %>% group_by(subject,activity_label) %>% summarize_each(funs(mean))
write.table(data_question5, file = "tidy_data.csv", sep = ",")


