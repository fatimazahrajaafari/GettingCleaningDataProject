MyFct <- function(){
	
	#####Q1: Merging the training and the test sets to create one data set.
	if (!("MyData.zip" %in% list.files("C:/Users/FATIMA-ZAHRA/desktop/data")))
		{
		fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		download.file(fileUrl, destfile="./MyData.zip")
		unzip(zipfile="C:/Users/FATIMA-ZAHRA/desktop/data/MyData.zip", exdir="C:/Users/FATIMA-ZAHRA/desktop/data")
		}
	setwd("./UCI HAR Dataset/train")
	SubjectTrain <- read.table("subject_train.txt")
	XTrain <- read.table("X_train.txt")
	yTrain <- read.table("y_train.txt")
	TrainingSet <- cbind(XTrain, SubjectTrain, yTrain)
	setwd("C:/Users/FATIMA-ZAHRA/desktop/data/UCI HAR Dataset/test")
	SubjectTest <- read.table("subject_test.txt")
	XTest <- read.table("X_test.txt")
	yTest <- read.table("y_test.txt")
	TestSet <- cbind(XTest, SubjectTest, yTest)
	MyDataSet <- rbind(TrainingSet, TestSet)

	#####Q2: Extracting only the measurements on the mean and standard deviation for each measurement.
	setwd("C:/Users/FATIMA-ZAHRA/desktop/data/UCI HAR Dataset")
	features <- read.table("features.txt")
	colnames(MyDataSet) <- c(features$V2, "SubjectId", "ActivityLabels")
	#grep("-std\\()|-mean\\()", features$V2)
	#grep("-std\\()|-mean\\()", features$V2, value = TRUE)
	MeanStdDataSet <- MyDataSet[, grep("-std\\()|-mean\\()", features$V2)]
	MeanStdDS <- cbind(MeanStdDataSet, MyDataSet$SubjectId, MyDataSet$ActivityLabels)

	#####Q3: Using descriptive activity names to name the activities in the data set
	colnames(MeanStdDS) <- c(grep("-std\\()|-mean\\()", features$V2, value = TRUE), "SubjectId", "ActivityLabels")
	setwd("C:/Users/FATIMA-ZAHRA/desktop/data/UCI HAR Dataset")
	install.packages("dplyr")
	library(dplyr)
	ActLab <- read.table("activity_labels.txt")
	Labels <- rbind(yTrain, yTest)
	Labels$V1 <- as.numeric(Labels$V1)
	ActLab$V1 <- as.numeric(ActLab$V1)
	MergedDS <- inner_join(Labels, ActLab)
	FinalDS <- cbind(MeanStdDS, MergedDS$V2)
	colnames(FinalDS) <- c(grep("-std\\()|-mean\\()", features$V2, value = TRUE), "SubjectId", "ActivityLabels", "ActivityNames")
	colnames(ActLab) <- c("ActivityLabels", "ActivityNames")

	#####Q4: Appropriately labeling the data set with descriptive variable names.
	setwd("C:/Users/FATIMA-ZAHRA/desktop/data")
		MyCol <- gsub("^(t)", "Time", colnames(FinalDS))
		MyCol <- gsub("^(f)", "Frequency", MyCol)
		MyCol <- gsub("std", "StandardDeviation", MyCol)
		MyCol <- gsub("mean", "Mean", MyCol)
		MyCol <- gsub("Jerk", "JerkSignal", MyCol)
		MyCol <- gsub("Mag", "Magnitude", MyCol)
		MyCol <- gsub("Gyro", "Gyroscope", MyCol)
		MyCol <- gsub("Acc", "Accelerometer", MyCol)
		MyCol <- gsub("\\()|-", "", MyCol)
	colnames(FinalDS) <- MyCol
	
	#####Q5: From the data set in Q4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	DS <-  FinalDS[,1:68]
	Q5DataSet <- DS %>% group_by(ActivityLabels, SubjectId) %>% summarise_each(funs(mean))
	Q5DataSet <- merge(ActLab,Q5DataSet, by=1,all.x=TRUE) 
	write.table(Q5DataSet,"./TidyData.txt", row.names=FALSE,sep='\t')
}