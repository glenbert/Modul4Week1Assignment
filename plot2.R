
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

png("plot2.png", width=480, height=480)

plot(pltdt$Global_active_power~pltdt$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()