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
png(filename="plot2.png", width=480, height=480)
plot(recs$V1, recs$V3, type="l", xlab="", ylab=paste(lblGAP, "(killowatts)"))
dev.off()