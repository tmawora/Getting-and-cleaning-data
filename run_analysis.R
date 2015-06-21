#################################################################################################
#####  Thomas Mawora
#####  Coursera
#####  Getting and cleaning data 
#####  Project script submitted on 21/06/2015
#################################################################################################


#################################################################################################
## First I shall set up the working directory in my computer
## Then I shall download the file and save it in my working directory
## Save the list of files in the zip file in an object

setwd("C:/Users/Mwakudisa/getting-and-cleaning-data")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"datazet.zip")
zipfiles<-unzip(zipfile="datazet.zip",list=TRUE)

## zipfiles gives the "Name" and "Date" of the existing 32 files
## Training datasets have the extension "_train.txt" 
## Test datasets have the extension "_test.txt" 
#################################################################################################
## TAsk 1: Merge the training and the test sets to create one data set.
unzip(zipfile="datazet.zip",files = NULL)



#################################################################################################
##############   ORGANISING TEST DATA
## List of files with test data
## First get the unique IDs, they are in "subject_test.txt"
test.data.names<-grep("_test",zipfiles[,1],value=TRUE)
test_subjects<-read.table(test.data.names[10])
y_subjects<-read.table(test.data.names[12])

## The same flow of sequence of commands shall be applied to all files
## For this reason, several temporary files shall be used repeatedly.
## 1) First, the file shall be read
##      Many datasets have variables for the same individual read for multiple rows and columns
## 2) The test/train score variables shall be reshaped into a single column
## 3) The mean and standard deviation of the data shall be computed for the different participants
## 4) The two statistics shall be stored into two different variables and merged to the parent file.
## 

###########################################################################
##  02. body_acc_x_test (No. 1 in test.data.names)
participant.data<-read.table(test.data.names[1])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.acc.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.acc.body.test")
complete.data<-merge(meandata,sddata,all=T)

###########################################################################
## 03. body_acc_y_test.txt (No. 2 in test.data.names)
participant.data<-read.table(test.data.names[2])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.acc.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.acc.body.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  04. body_acc_z_test (No. 3 in test.data.names)
participant.data<-read.table(test.data.names[3])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.acc.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.acc.body.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  05. body_gyro_x_test (No. 4 in test.data.names)
participant.data<-read.table(test.data.names[4])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.gyr.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.gyr.body.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  06. body_gyro_y_test (No. 5 in test.data.names)
participant.data<-read.table(test.data.names[5])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.gyr.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.gyr.body.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  07. body_gyro_z_test (No. 6 in test.data.names)
participant.data<-read.table(test.data.names[6])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.gyr.body.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.gyr.body.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  08. total_acc_x_test (No. 7 in test.data.names)
participant.data<-read.table(test.data.names[7])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.acc.tot.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.acc.tot.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  09. total_acc_y_test (No. 8 in test.data.names)
participant.data<-read.table(test.data.names[8])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.acc.tot.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.acc.tot.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  10. total_acc_z_test (No. 9 in test.data.names)
participant.data<-read.table(test.data.names[9])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.acc.tot.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.acc.tot.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  01. x_test (No. 11 in test.data.names)
library(reshape2)
library(plyr)
participant.data<-read.table(test.data.names[11])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.test.test")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.test.test")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)


#################################################################################################
##############   ORGANISING AND MERGING TRAIN DATA
## List of files with test data
## First get the unique IDs, they are in "subject_test.txt"
train.data.names<-grep("_train",zipfiles[,1],value=TRUE)
test_subjects<-read.table(train.data.names[10])
y_subjects<-read.table(train.data.names[12])

###########################################################################
##  02. body_acc_x_train (No. 1 in train.data.names)
participant.data<-read.table(train.data.names[1])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.acc.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.acc.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
## 03. body_acc_y_train (No. 2 in train.data.names)
participant.data<-read.table(train.data.names[2])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.acc.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.acc.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  04. body_acc_z_train (No. 3 in train.data.names)
participant.data<-read.table(train.data.names[3])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.acc.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.acc.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  05. body_gyro_x_train (No. 4 in train.data.names)
participant.data<-read.table(train.data.names[4])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.gyr.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.gyr.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  06. body_gyro_y_train (No. 5 in train.data.names)
participant.data<-read.table(train.data.names[5])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.gyr.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.gyr.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  07. body_gyro_z_train (No. 6 in train.data.names)
participant.data<-read.table(train.data.names[6])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.gyr.body.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.gyr.body.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  08. total_acc_x_train (No. 7 in train.data.names)
participant.data<-read.table(train.data.names[7])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.acc.tot.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.acc.tot.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  09. total_acc_y_train (No. 8 in train.data.names)
participant.data<-read.table(train.data.names[8])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.y.acc.tot.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.y.acc.tot.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  10. total_acc_z_train (No. 9 in train.data.names)
participant.data<-read.table(train.data.names[9])
completedata<-cbind(y_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.z.acc.tot.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.z.acc.tot.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)

###########################################################################
##  01. x_train (No. 11 in train.data.names)
participant.data<-read.table(train.data.names[11])
completedata<-cbind(test_subjects,participant.data)
completedata_melt<-melt(completedata,id=names(completedata[1]),measure.vars=names(completedata[2:ncol(completedata)]))
completedata_melt<-completedata_melt[,-2]
meandata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="mean")
names(meandata)<-c("id","mean.x.train")
sddata<-aggregate(completedata_melt[,2], by=list(completedata_melt[,1]), FUN="sd")
names(sddata)<-c("id","sd.x.train")
complete.data<-merge(complete.data,meandata,all=T)
complete.data<-merge(complete.data,sddata,all=T)


#################################################################################################
## Delete unwanted files
remove(list=c("completedata","meandata","completedata_melt","participant.data",
              "sddata","test_subjects","y_subjects","zipfiles",
              "test.data.names","train.data.names"))

#################################################################################################
## write the file unwanted files
write.table(complete.data,file="complete_data_Mawora.txt",row.names = FALSE)

### The names of each variable has been explained in the code book.
names(complete.data)
