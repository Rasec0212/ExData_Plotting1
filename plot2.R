Dataset <- read.csv("./ElPowCon/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
Dataset$Date <- as.Date(Dataset$Date, format = "%d/%m/%Y")

##Subsetting the dataset
data <- subset(Dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Dataset)

##Converting dates
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)

#Constructing plot 1
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Saving it in png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()