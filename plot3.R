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
##               Plot 3                            ##
#####################################################

setwd("C:/Users/owner/datasciencecoursera/EDA")

png(filename="plot3.png", 
     width=480, height=480,
     units="px", bg="transparent")

with(power2d, {
    plot(Sub_metering_1~Datetime, 
		type="l",
		xlab="",
         	ylab="Global Active Power (kilowatts)", )
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), 
		lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


