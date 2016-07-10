setwd("C:/Users/owner/Documents/Data Science/EDA")

power <- read.table("household_power_consumption.txt",
                 header=TRUE,
		     stringsAsFactors=F,
                 sep=";",
                 na="?")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

head(power)
dim(power)##2075259 9

## Subsetting the data for only two days
power2d <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
str(power2d)
head(power2d)
dim(power2d)

## Converting dates
datetime <- paste(as.Date(power2d$Date), power2d$Time)
power2d$Datetime <- as.POSIXct(datetime)
str(power2d)
tail(power2d)

#####################################################
##               Plot 1                            ##
#####################################################
setwd("C:/Users/owner/datasciencecoursera/EDA")

png(filename="plot1.png", width=480, 
   height=480, units="px", bg ="transparent")

hist(power2d$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

