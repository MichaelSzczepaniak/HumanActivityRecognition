library(dplyr)
library(downloader)

## 
## 
run_analysis <- function(options = "fromDeparsedData") {
    xtestdata <- NULL
    xtraindata <- NULL
    loadDirectoryStructure()
    if(options == "fromScratch"){
        cat(format(Sys.time(), "%T"),
            "HAR data download started...\n")
        getHARData()  # gets the zipped data file, explodes it, and renames dir
        cat(format(Sys.time(), "%T"), "HAR data download complete...\n")
        createRawDeparsedXData()  # creates the output directory then
        # constructs the xtestdf.R and xtraindf.R
        # deparsed dataframes and store them there
        cat(format(Sys.time(), "%T"),
            "Deparsed HAR X data file creations complete. Start reading...\n")
    } else if(options == "fromDeparsedData") {
        readingDeparsedDataMessage()
    } else {
        cat("Invalid option. Valid options are:\n")
        cat("fromScratch or fromDeparsedData\n")
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
    # make activites vector and bind it to xdata: step 3
    activities <- makeDescriptiveActivities()
    xdata <- bind_cols(activities["activity"], xdata)
    write.table(xdata, file = paste0(outputDir, "./step3.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Append descriptive activites: step 3. complete.\n")
    # make variables names more descriptive: step 4
    xdata <- makeDescriptiveColumnNames(xdata)
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
    write.table(summarizedByActivityAndSubject,
                file = paste0(outputDir, "./HARByActivityAndSubject.txt"),
                row.names = FALSE)
    cat(format(Sys.time(), "%T"),
        "Summarize variable by subject & activity: step 5. complete.\n")
    
    return(summarizedByActivityAndSubject)
}

readingDeparsedDataMessage <- function(){
    cat(format(Sys.time(), "%T"),
        "reading deparsed HAR dataframes started...\n")
}

## Downloads the Human Activity Recognition data, unzips it, renames the
## directory to 'data', and loads directory reference data to the workspace
getHARData <- function (datafile = "data.zip") {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download(fileUrl, destfile=paste0("./", datafile))
    unzip(datafile)
    # The next line creates concurrency issues
    #file.rename("UCI HAR Dataset", "data")
    #cat(format(Sys.time(), "%T"),
    #    "'UCI HAR Dataset' dir renamed to 'data'...\n")
    file.remove(datafile)
}

## Simply loads some variables that define the directory structure of the
## dataset into the workspace so that it can be retrieved later by other
## operations.
loadDirectoryStructure <- function() {
    dataDir <<-  "./UCI HAR Dataset"
    testDir <<- paste0(dataDir, "/test")
    trainDir <<- paste0(dataDir, "/train")
    outputDir <<- paste0(dataDir, "/output")
}

## Reads the raw HAR data files into dataframes and then deparses them into
## the following locations: ../data/output/xtestdf.R and
##                          ../data/output/xtraindf.R
## These objects are created to speed future reconstruction of these dataframes.
createRawDeparsedXData <- function() {
    dir.create(outputDir)
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

makeDescriptiveColumnNames <- function(xdata) {
    originalColumnNames <- names(xdata)
    revisedNames <- gsub("tBody", "timeBody", originalColumnNames)
    revisedNames <- gsub("fBody", "frequencyBody", revisedNames)
    revisedNames <- gsub("tGravity", "timeGravity", revisedNames)
    revisedNames <- gsub("-mean\\(\\)-", "Mean", revisedNames)
    revisedNames <- gsub("-mean\\(\\)", "Mean", revisedNames)
    revisedNames <- gsub("-std\\(\\)-", "StdDeviation", revisedNames)
    revisedNames <- gsub("-std\\(\\)", "StdDeviation", revisedNames)
    names(xdata) <- revisedNames
    
    return(xdata)
}

##
appendSubjectColumn <- function(xdata) {
    # combine the test and train subjects: test on top
    testSubjects <- read.table(paste0(testDir, "/subject_test.txt"))
    trainSubjects <- read.table(paste0(trainDir, "/subject_train.txt"))
    subjects <- bind_rows(testSubjects, trainSubjects)
    names(subjects) <- c("subject")
    xdata <- bind_cols(subjects[1], xdata)
    
    return(xdata)
}
