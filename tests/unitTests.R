## Simple test of group_by
##
testSimple <- function() {
    simple <- read.csv("./tests/simpleSummaryTestData.csv")
    simpleGrouped <- group_by(simple, activity, subject)
    summarizedSimple <- simpleGrouped %>%
        summarize(mean1=mean(var1), mean2=mean(var2),mean3=mean(var3)) %>%
        arrange(activity)
    summarizedSimple <- summarizedSimple[,c("subject", "activity",
                                            "mean1", "mean2", "mean3")]
    # test sit values
    testActivityRows("sit", 4)
    # test stand values
    testActivityRows("stand", 23)
    # test walk values
    testActivityRows("walk", 43)
}

testActivityRows <- function(activityValue, startExpected) {
    activityRows <- filter(summarizedSimple, activity == activityValue)
    expectedValue <- startExpected
    for(i in 1:3) {
        activityRow <- activityRows[i, c(3:5)]
        for(j in 1:3) {
            actualValue <- activityRow[[j]]
            isPass <- (actualValue == expectedValue)
            testOutput <- paste0("actual value = ", actualValue,
                                 ", expected value = ", expectedValue,
                                 " : test passed: ", isPass)
            cat(testOutput, "\n")
            expectedValue <- expectedValue + 1
        }
        expectedValue <- expectedValue - 2
    }
}
