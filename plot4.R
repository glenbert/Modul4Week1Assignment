
## Download the zip file and unzip
## Make sure to save the unzip file in your working directory
## Rename the txt file to data.txt

dt <- read.table('./data.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Reformat or conver the date

dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

## Select the data by using the subset function

pltdt <- subset(dt, Date >= "2007-02-01" & Date <= "2007-02-02")

## Convert the Global_active_power to numeric

pltdt$Global_active_power <- as.numeric(pltdt$Global_active_power)

dtime <- paste(as.Date(pltdt$Date), pltdt$Time)

pltdt$DateTime <- as.POSIXct(dtime)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(pltdt, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()