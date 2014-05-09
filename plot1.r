##
## Copyright (c) 2014, Prakash Atawale.
##
## IMPORTANT: 
##   1. First, run the prep_data.r to create the data subset
##   2. Change the working directory to your correct directory
##

setwd("~/gitrepos/coursera/ExData_Plotting1")
recs <- read.table("data_subset.txt", 
                   sep=":", 
                   na.strings = "?", 
                   comment.char="",
                   colClasses=c(rep("character",2),rep("numeric",7))
                   )

##Convert date time, merge into one column
x <- paste(recs$V1, recs$V2)
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
recs$V1 <- y

lblGAP <- "Global Active Power"
png(filename="plot1.png", width=480, height=480)
hist(recs$V3, breaks=12, xlab=paste(lblGAP, "(killowatts)"), col=2, main=lblGAP)
dev.off()