# Author : Dirk Bruyland
#
# R script for project assignment Course Get and Clean data
# This R-script tidies up the data files which are located
# in a /data folder located in the folder where the R-script is run.  
#
#
# 1   Merges the training and the test sets to create one data set.
# 2   Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3   Uses descriptive activity names to name the activities in the data set
# 4   Appropriately labels the data set with descriptive variable names. 
#
#  5  From the data set in step 4, creates a second, 
#  independent tidy data set with the average of each variable for each activity and each subject.
#
#
#
#
library(dplyr)

# check if rawdata present if not load it from original source
if(!file.exists("./data")){
dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileUrl,destfile="./data/rawdata.zip")
}

#
# read in the datafiles
#
X_test<-read.csv("./data/UCI HAR Dataset/test/X_test.txt",header=FALSE,stringsAsFactor=FALSE,sep="")
y_test<-read.csv("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE,stringsAsFactors=FALSE,sep="")
s_test<-read.csv("./data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)

X_train<-read.csv("./data/UCI HAR Dataset/train/X_train.txt",header=FALSE,stringsAsFactor=FALSE,sep="")
y_train<-read.csv("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE,stringsAsFactors=FALSE,sep="")
s_train<-read.csv("./data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)

RAH<-read.csv("run_analysisH.csv",header=FALSE,stringsAsFactor=FALSE)

#
# merge test and train sets
#
X_train<-cbind(X_train,s_train,y_train)
X_test<-cbind(X_test,s_test,y_test)
X_tot<-rbind(X_test,X_train)
#
# names and labelling of measurements
# add 2 rows to the helper data structure RAH for subject and training
# RAH is the helper data structure and is a data frame with 3 columsn and 563 rows
# column 2 of RAH are all the names used  for column names
# column 3 of RAH decides whether a feature/name is going to be used(1) or not(0)
# only 86 features are selected(=1) and the subject and training are selected for total=88 
#
RAH<-rbind(RAH,c(562,"subject",1),c(563,"training",1))
names_tot<-RAH[,2]
names(X_tot)<-names_tot
#
#subset/extract measurements with mean and std
#colsel_tot is a logical vecor made from column 3 of RAH
#
colsel_tot<-RAH[,3]==1
X_sel<-X_tot[,colsel_tot]
#
# save the 88 relevant names (all 86 selected std/mean feature names plus "subject" and "training")
#
savednames<-names(X_sel)
#
# split X_sel according to 2 factors = training/activity and subject/individual
# we will have a list XL  of 180 elements one element for 30 subjects/individuals doing 6 activities/trainings
# each element of this list XL is a dataframe with n observations of 88 variables/features
#
XL<-split(X_sel,list(X_sel$subject,X_sel$training),drop=TRUE)
#
# take the column means of each element=dataframe of XL
# XLL is a list of 180 vectors. each element of this list XLL is a numeric vector with 88 "means" which are the columnmeans
#
XLL<-lapply(XL,function(x) colMeans(x))
#
# reformat the resulting list XLL
# All the column means are shifted in one vector V of length=88*180
# XLL[[i]] is one such vector with 88 means.
#
V<-numeric()
for (i in seq_along(XLL)) {V<-c(V,XLL[[i]])}
#
#Put the tidied up data in a matrix Vm
#Vm has 180 rows and 88 columns and is a numeric matrix
#
#give the matrix Vm, the tidy data, and the appropriate column names.
#
Vm<-matrix(V,ncol=88,byrow=TRUE)
colnames(Vm)<-savednames
#
# make data frame, and name and factor the activities
#
Vm<-data.frame(Vm)
colnames(Vm)<-savednames

Vm[,88]<-factor(Vm[,88],labels=c("WALKING","WALKINGUPSTAIRS","WALKINGDOWNSTAIRS","SITTING","STANDING","LAYING"))
#
# write the tidy data in file tidy.txt
#
write.table(Vm,file="tidy.txt",row.names=FALSE)



