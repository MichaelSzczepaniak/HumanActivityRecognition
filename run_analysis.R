library(dplyr)
library(downloader)

## 
## 
run_analysis <- function(options = "fromScratch") {
    xtestdata <- NULL
    xtraindata <- NULL
    if(options == "fromScratch"){
        getHARData()  # gets the zipped data file, explodes it, and renames dir
        cat(format(Sys.time(), "%T"), "HAR data download complete...\n")
        createDeparsedXData()  # creates the output directory then
                               # constructs the xtestdf.R and xtraindf.R
                               # deparsed dataframes and store them there
        cat(format(Sys.time(), "%T"),
            "Deparsed HAR X data file creations complete...\n")
    } else if(options == "fromDeparsedData") {
        
    } else {
        cat("Invalid option. Valid options are:\n")
        cat("fromScratch or fromDeparsedData\n")
        cat("See README.md for details.\n")
        cat("No computation done. Exiting.")
    }
}

## Downloads the Human Activity Recognition data, unzips it, renames the
## directory to 'data', and loads directory reference data to the workspace
getHARData <- function (datafile = "data.zip") {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download(fileUrl, destfile=paste0("./", datafile))
    unzip(datafile)
    file.rename("UCI HAR Dataset", "data")
    file.remove(datafile)
    loadDirectoryStructure()
}

## Simply loads some variables that define the directory structure of the
## dataset into the workspace so that it can be retrieved later by other
## operations.
loadDirectoryStructure <- function() {
    dataDir <<-  "./data"
    testDir <<- paste0(dataDir, "/test")
    trainDir <<- paste0(dataDir, "/train")
    outputDir <<- paste0(dataDir, "/output")
}

##
##
createDeparsedXData <- function() {
    dir.create("./data/output")
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

## Reads the data from a raw HAR data file into a dataframe.
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