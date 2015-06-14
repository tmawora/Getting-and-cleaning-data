#################################################################################################
#####  Thomas Mawora
#####  Coursera
#####  Getting and cleaning data
#####  Project script
#################################################################################################


#################################################################################################
## First I shall set up the working directory in my computer
setwd("C:/Users/Mwakudisa/getting-and-cleaning-data")

## Then I shall download the file and save it in my working directory

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"datazet.zip")
unzip(zipfile="datazet.zip",list=TRUE)
