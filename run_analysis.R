library(dplyr)
library(downloader)

## Michael Szczepaniak - July 2015
##
## This function takes four parameters:
##
## options - This tells the function how to obtain the data for the analysis.
##           The three allowed values are: "fromLocalZip", "fromScratch" or
##           "fromDeparsed".  These options can be described as follows:
##
##           "fromLocalZip" (default) - This directs the function to look for a
##                                      zip data file specified by the zipFile
##                                      parameter in the same directory from  
##                                      which this script is being run.
##           "fromDeparsed" - This directs the function to look for two deparsed
##                            dataframe object files that were constructed from
##                            the x_test.txt and x_train.txt files.  To run this
##                            option successfully, the function must be run
##                            using either the "fromLocalZip" or "fromScratch"
##                            options at least once before in order for the
##                            deparsed object files to be built.
##            "fromScratch" - This directs the function to download the zip
##                            file from the internet before proceeding with the
##                            analysis.  This option took just under 9 minutes
##                            on my i7 laptop with 16Gb of RAM, but should be
##                            used if the two other options fail to work.
##  zipFile - This is the name of the zip file of the dataset used for the 
##            analysis. Default value: "UCI HAR Dataset.zip"
##  zipDir - This is the directory which the script expects the raw data from
##           the exploded zip to reside. Default value is 'UCI HAR Dataset'
##  zipUrl - This is the url used to download the zip file for the dataset when
##           options = "fromScratch".  The default value is:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Here is a description of the exection steps taken by the function:
##
## 1) If option = "fromScratch", the HAR zip file is downloaded using the
##    default value for zipUrl as described above.
##    If options = "fromLocalZip" (default) or "fromDeparsed", skip to step 2)
## 2) If options = "fromLocalZip" (default), the file specified by zipFile is
##    read from the directory which this script is being run from, and the zip
##    file is exploded into a directory names "UCI HAR Dataset". An error will
##    result if the zip file could not be found or if the zip file explosion
##    creates a directory named something other than "UCI HAR Dataset".
## 3) The test and train feature data is then read into 2 data frames (dfs).
## 4) The test and train dfs are deparsed and written to the files:
##    UCI HAR Dataset/outputs/xtestdf.R and UCI HAR Dataset/outputs/xtraindf.R
##    respectively.  NOTE: This was done so that successive runs using:
##    options = "fromDeparsed" could bypass steps 1) through 3) to speed
##    successive executions.
## 5) The deparsed dfs created in step 3) are read into two dfs in memory:
## 6) The xtestdata and xtraindata dfs are combined into a single dataframe
##    called xdata.  This completed step 1. of the analysis as described in the
##    README.md file.
## 7) The feature.txt file is read and the feature names were set as the
##    column names for xdata.
## 8) The xdata df was subsetted to include only features that had "mean()" or
##    "std()" in their column names.  This completed step 2. of the analysis as
##    described in the README.md file.
## 9) The activities files (y_test.txt and y_train.txt) were read, a vector was
##    was built with the values from these files, the values in the vector were
##    replaced by the names of the activities defines in the
##    activities_labels.txt file, and then the updated vector was column bound
##    to the xdata df.  This completed step 3. of the analysis as described in
##    the README.md file.
##10) The column names of the features were revised to be more readable and
##    descriptive.  This completed step 4. of the analysis as described in the
##    README.md file.
##11) The xdata resulting from 10) was grouped by activity and subject and
##    summarized by applying the mean to each group of variable.
##12) The summarize table from 11) was then written a file called:
##    HARByActivityAndSubject.txt  using the command:
##
##    write.table(summarizedByActivityAndSubject,
##                file = "./output/HARByActivityAndSubject.txt"),
##                row.names = FALSE)
##
## If options is set to "fromDeparsed", this function needs to have been
## executed at least one time prior using options = "fromScratch" in order to
## build the deparsed xtestdf.R and xtraindf.R object files which the function
## reads in as described in step 4)
## 
run_analysis <- function(options = "fromLocalZip",
                         zipFile = "UCI HAR Dataset.zip",
                         zipDir = "UCI HAR Dataset",
                         zipUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") {
    xtestdata <- NULL
    xtraindata <- NULL
    loadDirectoryStructure(zipDir)
    if(options == "fromScratch"){
        cat(format(Sys.time(), "%T"), "HAR data download started...\n")
        getHARData(zipFile, zipUrl)
        cat(format(Sys.time(), "%T"), "HAR data download complete...\n")
        unzip(zipFile)
        createRawDeparsedXData()  # creates the output directory then
        # constructs the xtestdf.R and xtraindf.R
        # deparsed dataframes and store them there
        cat(format(Sys.time(), "%T"),
            "Deparsed HAR X data file creations complete. Start reading...\n")
    } else if(options == "fromLocalZip") {
        unzip(zipFile)
        createRawDeparsedXData()  # creates the output directory then
        # constructs the xtestdf.R and xtraindf.R
        # deparsed dataframes and store them there
        cat(format(Sys.time(), "%T"),
            "Deparsed HAR X data file creations complete. Start reading...\n")
    } else if(options == "fromDeparsed") {
        cat(format(Sys.time(), "%T"),
            "reading deparsed HAR dataframes started...\n")
    } else {
        cat("Invalid option. Valid options are:\n")
        cat("fromScratch or fromDeparsed\n")
        cat("See README.md for details.\n")
        cat("No computation done. Exiting.")
    }
    # get the x data from the deparsed objects
    xtestdata <- readDeparsedXData(TRUE)
    xtraindata <- readDeparsedXData(FALSE)
    cat(format(Sys.time(), "%T"),
        "reading deparsed HAR dataframes complete...\n")
    
    # combine the test and train dataframes, keep the combined and remove
    # what is not longer needed
    xdata <- bind_rows(xtestdata, xtraindata)  # step 1.
    write.table(xdata, file = paste0(outputDir, "./step1.txt"),
                row.names = FALSE)
    rm(list = c("xtestdata", "xtraindata"))
    xdata <- addOriginalFeaturesAsHeaders(xdata)
    cat(format(Sys.time(), "%T"), "addOriginalFeaturesAsHeaders completed.\n")
    xdata <- removeNonMeanNonStdDev(xdata)  # step 2.
    write.table(xdata, file = paste0(outputDir, "./step2.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Removal of unneeded columns: step 2. complete.\n")
    # make activities vector and bind it to xdata: step 3
    activities <- makeDescriptiveActivities()
    xdata <- bind_cols(activities["activity"], xdata)
    write.table(xdata, file = paste0(outputDir, "./step3.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Append descriptive activities: step 3. complete.\n")
    # make variables names more descriptive: step 4
    revisedNames <- makeDescriptiveColumnNames(xdata)
    names(xdata) <- revisedNames
    # append the subject column
    xdata <- appendSubjectColumn(xdata)
    write.table(xdata, file = paste0(outputDir, "./step4.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Append subject and make descriptive col names: step 4. complete.\n")
    # summarize x data by activity and subject then write table: step 5
    xByActivityAndSubject <- group_by(xdata, activity, subject)
    summarizedByActivityAndSubject <- summarise_each(xByActivityAndSubject,
                                                     funs(mean))
    revisedSummaryHeaders <-
        getRevisedSummaryHeaders(summarizedByActivityAndSubject)
    
    names(summarizedByActivityAndSubject) <- revisedSummaryHeaders
    
    write.table(summarizedByActivityAndSubject,
                file = paste0(outputDir, "./HARByActivityAndSubject.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Summarize variable by subject & activity: step 5. complete.\n")
}

## Downloads the Human Activity Recognition data and unzips it
getHARData <- function (zipFile, zipUrl) {
    download(zipUrl, destfile=paste0("./", zipFile))
    # The next line creates concurrency issues
    #file.rename("UCI HAR Dataset", "data")
    #cat(format(Sys.time(), "%T"),
    #    "'UCI HAR Dataset' dir renamed to 'data'...\n")
    #file.remove(datafile)
}

## Simply loads some variables that define the directory structure of the
## dataset into the workspace so that it can be retrieved later by other
## operations.
loadDirectoryStructure <- function(zipDir) {
    dataDir <<-  paste0("./", zipDir)
    testDir <<- paste0(dataDir, "/test")
    trainDir <<- paste0(dataDir, "/train")
    outputDir <<- paste0(dataDir, "/output")
}

## Reads the raw HAR data files into dataframes and then deparses them into
## the following locations: ../data/output/xtestdf.R and
##                          ../data/output/xtraindf.R
## These objects are created to speed future reconstruction of these dataframes.
createRawDeparsedXData <- function() {
    if(!file.exists(outputDir)) {dir.create(outputDir)}
    cat(format(Sys.time(), "%T"),
        " Start reading X_test.txt data file into dataframe.\n")
    xtestdata <- readXFromRawData(TRUE)
    cat(format(Sys.time(), "%T"),
        " Finished reading X_test.txt data file into dataframe.\n")
    cat(format(Sys.time(), "%T"),
        " Start reading X_train.txt data file into dataframe.\n")
    xtraindata <- readXFromRawData(FALSE)
    cat(format(Sys.time(), "%T"),
        " Finished reading X_train.txt data file into dataframe.\n",
        "         Start dput of test data...\n")
    dput(xtestdata, file = paste0(outputDir, "/xtestdf.R"))
    cat(format(Sys.time(), "%T"),
        " Finished dput of xtestdf.R. Start dput of train data.\n")
    dput(xtraindata, file = paste0(outputDir, "/xtraindf.R"))
    cat(format(Sys.time(), "%T"),
        " Finished dput of xtraindf.R.\n")
}

## Reads the data from a raw HAR data file and returns a dataframe.
## testData - TRUE if file to be read is the X_test.txt file
##            FALSE if the file to be read is the X_train.txt file
readXFromRawData <- function(testData) {
    rawDataFilePath <- NULL
    if(testData) {
        rawDataFilePath <- paste0(testDir, "/X_test.txt")
    }
    else {
        rawDataFilePath <- paste0(trainDir, "/X_train.txt")
    }
    # X_train.txt and X_test.txt files are both fixed width and have
    # 561 factors (variables). Each value is 15 characters seperated by
    # a space.
    xdata <- read.fwf(file = rawDataFilePath, rep(c(-1, 15), 561))
    
    return(xdata)
}

## Reads the data from a deparsed HAR dataframe and returns the reconstructed
## dataframe.  These files are created from createDeparsedXData function:
##     xtestdf.R (created from X_test.txt) and
##     xtraindf.R (crreated from X_train.txt)
## Note: This function is much faster than readXFromRawData which reads the
##       raw HAR data file.
## testData - TRUE if file to be read is the xtestdf.R file
##            FALSE if the file to be read is the xtraindf.R file
readDeparsedXData <- function(testData) {
    xdata <- NULL
    if(testData) {
        xdata <- dget(paste0(outputDir, "/xtestdf.R"))
    } else {
        xdata <- dget(paste0(outputDir, "/xtraindf.R"))
    }
    
    return(xdata)
}

## Reads the features.txt file and adds these feature names as the headers
## (column names) for the columns in the data frame
addOriginalFeaturesAsHeaders <- function(xdata) {
    # read in the features.txt which contains the columns variable names
    featuresPath <- paste0(dataDir, "/features.txt")
    # make original names vector available in workspace so that functions 
    # removeNonMeanNonStdDev and makeDescriptiveColumnNames can use it
    originalColumnNames <<- read.table(featuresPath, sep = " ",
                                       stringsAsFactors = FALSE)[[2]]
    names(xdata) <- originalColumnNames
    
    return(xdata)
}

## Subsets out only columns that have "mean()" or "std()" in their column name
## and returns the trimmed down data frame
removeNonMeanNonStdDev <- function(xdata) {
    meanIndices <- grep("mean\\(\\)", originalColumnNames)
    stdIndices <- grep("std\\(\\)", originalColumnNames)
    indicesOfInterest <- sort(c(meanIndices, stdIndices))
    xdata <- xdata[,indicesOfInterest]
    
    return(xdata)
}

## Reads a test or train activities file, creates a vector with the same number
## of records, fills that vector with the descriptive name of the activity, and
## returns the vector created.
##
## testData - TRUE if activity file to be read is the y_test.txt file
##            FALSE if activitye file to be read is the y_train.txt file
makeDescriptiveActivities <- function() {
    # combine the test and train activites: test on top
    testActivities <- read.table(paste0(testDir, "/y_test.txt"))
    trainActivities <- read.table(paste0(trainDir, "/y_train.txt"))
    activities <- bind_rows(testActivities, trainActivities)
    # add names to the combined df
    activities <- mutate(activities, activity = "")
    names(activities) <- c("code", "activity")
    # create a df for the activity labels and add column labels
    actLabels <- read.table(paste0(dataDir, "/activity_labels.txt"),
                            sep = " ", stringsAsFactors = FALSE)
    names(actLabels) <- c("code", "activity")
    # populate the activity descriptions
    for(i in seq_along(activities$code)) {
        code <- activities$code[i]
        activities$activity[i] <- actLabels[code, "activity"]
    }
    
    return(activities)
}

## Makes the column names more explicit and/or more readable. Replaces leading
## 't', and 'f' characters by 'time' and 'frequency' respectively. Replaces
## '-mean()-' and '-mean()' by 'Mean', and '-std()-' and '-std()' by 
## 'StdDeviation', replaces "Acc" with "Acceleration", replaces "Gyro" with
## "Gyroscope", and replaces "Mag" with "Magnitude"
makeDescriptiveColumnNames <- function(xdata) {
    originalColumnNames <- names(xdata)
    revisedNames <- gsub("tBody", "timeBody", originalColumnNames)
    revisedNames <- gsub("fBody", "frequencyBody", revisedNames)
    revisedNames <- gsub("tGravity", "timeGravity", revisedNames)
    revisedNames <- gsub("-mean\\(\\)-", "Mean", revisedNames)
    revisedNames <- gsub("-mean\\(\\)", "Mean", revisedNames)
    revisedNames <- gsub("-std\\(\\)-", "StandardDeviation", revisedNames)
    revisedNames <- gsub("-std\\(\\)", "StandardDeviation", revisedNames)
    revisedNames <- gsub("Acc", "Acceleration", revisedNames)
    revisedNames <- gsub("Gyro", "Gyroscope", revisedNames)
    revisedNames <- gsub("Mag", "Magnitude", revisedNames)
    
    return(revisedNames)
}

## Returns vector of column names where 'MeanOf' is prepended to the
## measurement variables
getRevisedSummaryHeaders <- function(xdata) {
    originalColumnNames <- names(xdata)
    revisedNames <- gsub("timeBody", "MeanOfTimeBody", originalColumnNames)
    revisedNames <- gsub("frequencyBody", "MeanOfFrequencyBody", revisedNames)
    revisedNames <- gsub("timeGravity", "MeanOfTimeGravity", revisedNames)
    
    return(revisedNames)
}

## Combine the test and train subject vectors: test on top, train on bottom
## and returns xdata with the appended subject column
appendSubjectColumn <- function(xdata) {
    testSubjects <- read.table(paste0(testDir, "/subject_test.txt"))
    trainSubjects <- read.table(paste0(trainDir, "/subject_train.txt"))
    subjects <- bind_rows(testSubjects, trainSubjects)
    names(subjects) <- c("subject")
    xdata <- bind_cols(subjects[1], xdata)
    
    return(xdata)
}
