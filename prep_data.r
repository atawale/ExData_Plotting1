##
## Copyright (c) 2014, Prakash Atawale.
##
## IMPORTANT: 
##   1. Download and unzip the data file
##   2. Change the working directory to your correct directory
##

setwd("~/gitrepos/coursera/ExData_Plotting1")
recs <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   skip=1, 
                   na.strings = "?", 
                   comment.char="",
                   colClasses=c("character","character",rep("numeric",7))
)

##Subset the data
rec1 <- recs[ which( recs[1]=='1/2/2007' | recs[1]=='2/2/2007' ),]
write.table(rec1, "data_subset.txt", sep=":", na="?", row.names=FALSE, col.names=FALSE)