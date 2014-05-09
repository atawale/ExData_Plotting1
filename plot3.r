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

leg_colors <- c("black", "red", "blue")
leg_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")  

png(filename="plot3.png", width=480, height=480)
plot(recs$V1, recs$V7, type="l", xlab="", ylab="Energy Sub Metering",col=leg_colors[1] )
lines(recs$V1,recs$V8, type="l", col=leg_colors[2])
lines(recs$V1,recs$V9, type="l", col=leg_colors[3])
legend("topright",leg_names, cex=0.8, col=leg_colors, lwd=2);

dev.off()