library(dplyr)
library(downloader)

## 
## 
run_analysis <- function(options = "fromDeparsedData") {
    xtestdata <- NULL
    xtraindata <- NULL
    if(options == "fromScratch"){
        cat(format(Sys.time(), "%T"),
            "HAR data download started...\n")
        getHARData()  # gets the zipped data file, explodes it, and renames dir
        cat(format(Sys.time(), "%T"), "HAR data download complete...\n")
        createDeparsedXData()  # creates the output directory then
                               # constructs the xtestdf.R and xtraindf.R
                               # deparsed dataframes and store them there
        cat(format(Sys.time(), "%T"),
            "Deparsed HAR X data file creations complete...\n")
    } else if(options == "fromDeparsedData") {
        cat(format(Sys.time(), "%T"),
            "reading deparsed HAR dataframes started...\n")
        xtestdata <- readDeparsedXData(TRUE)
        xtraindata <- readDeparsedXData(FALSE)
        cat(format(Sys.time(), "%T"),
            "reading deparsed HAR dataframes complete...\n")
    } else {
        cat("Invalid option. Valid options are:\n")
        cat("fromScratch or fromDeparsedData\n")
        cat("See README.md for details.\n")
        cat("No computation done. Exiting.")
    }
    # combine the test and train dataframes, keep the combined and remove
    # what is not longer needed
    xdata <- bind_rows(xtestdata, xtraindata)
    rm(list = c("xtestdata", "xtraindata"))
    xdata <- removeNonMeanNonStdDev(xdata)  # step 2
    # append the subject and activity columns: steps 3 and 4
    xdata <- appendSubjectColumn(xdata)
    xdata <- relabelAndAppendActivites(xdata)
    
    write.table(xdata, file = paste0(outputDir, "./xTestAndTrain.txt"),
                row.names = FALSE)
}

## Downloads the Human Activity Recognition data, unzips it, renames the
## directory to 'data', and loads directory reference data to the workspace
getHARData <- function (datafile = "data.zip") {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download(fileUrl, destfile=paste0("./", datafile))
    unzip(datafile)
    #file.rename("UCI HAR Dataset", "data")
    #cat(format(Sys.time(), "%T"),
    #    "'UCI HAR Dataset' dir renamed to 'data'...\n")
    loadDirectoryStructure()
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
createDeparsedXData <- function() {
    dir.create(outputDir)
    xtestdata <- readXFromRawData(TRUE)
    cat(format(Sys.time(), "%T"),
               " Finished reading X_test.txt data file into data frame.\n")
    xtraindata <- readXFromRawData(FALSE)
    cat(format(Sys.time(), "%T"),
        " Finished reading X_test.txt data file into dataframe.\n")
    dput(xtestdata, file = paste0(outputDir, "/xtestdf.R"))
    cat(format(Sys.time(), "%T"),
        " Finished dput of xtestdf.R.\n")
    dput(xtraindata, file = paste0(outputDir, "/xtraindf.R"))
    cat(format(Sys.time(), "%T"),
        " Finished dput of xtestdf.R.\n")
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

removeNonMeanNonStdDev <- function(xdata) {
    # read in the features.txt which contains the columns variable names
    featuresPath <- paste0(dataDir, "/features.txt")
    originalColumnNames <- read.table(featuresPath, sep = " ",
                                      stringsAsFactors = FALSE)[[2]]
    # assign the original col names so we can see them things lining up
    
    
    meanIndices <- grep("mean\\(\\)", originalColumnNames)
    stdIndices <- grep("std\\(\\)", originalColumnNames)
    allIndices <- sort(c(meanIndices, stdIndices))
    #xDataRevised
    
    
    return(xDataRevised)
}

##
appendSubjectColumn <- function(xdata) {
    
    
    return(xdata)
}

## 
relabelAndAppendActivites <- function(xdata) {
    
    
    return(xdata)
}