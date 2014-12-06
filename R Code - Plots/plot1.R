## ========== DOWNLOADING AND UNZIPPING DATA ========== ##
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")


Sys.setlocale("LC_TIME", "English") ## changing time locale (windows) to present ab. of days in English if you need

dane <- unzip("data.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
mr <- difftime("2007-02-03 00:00", "2007-01-31 23:59", units="mins")
sk <- difftime("2007-01-31 23:59", "2006-12-16 17:22", units="mins")

names <- as.matrix(read.table(dane, sep = ";", skip = 0, nrows = 1))
set <- read.table(
  dane
  ,sep = ";"
  ,skip = sk
  ,nrows = mr
  ,col.names = names
  ,colClasses = c("factor", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)

rm(names)
rm(sk)
rm(mr)
rm(dane)

set$Date <- as.Date(set$Date, '%d/%m/%Y')
days <- unique(weekdays(set$Date, TRUE))


# ========== CREATING AND SAVING PLOT ==========
png(file = "plot1.png", width = 480, height = 480, units = "px")
  par(mar = c(4, 4, 4, 4))
  hist(
      set$Global_active_power
      ,main = "Global Active Power"
      ,xlab = "Global Active Power (kilowatts)"
      ,ylab = "Frequency"
      ,col = "red"
      )
dev.off()


