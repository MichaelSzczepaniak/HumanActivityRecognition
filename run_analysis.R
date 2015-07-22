library(dplyr)
library(downloader)

## 
## 
run_analysis <- function(options = "fromScratch") {
    xtestdata <- NULL
    xtraindata <- NULL
    if(options == "fromScratch"){
        getHARData()  # gets the zipped data file, explodes it, and renames dir
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
    transformsDir <<- paste0(dataDir, "/transforms")
}