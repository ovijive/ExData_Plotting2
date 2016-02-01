# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract Baltimore City (fips: 24510) emissions
?subset
baltEmi <- subset(NEI, fips==24510)

#total emissions in Baltimore City in 1999, 2002, 2005, 2008
totalEmi = aggregate(Emissions ~ year, data = baltEmi, sum)

# plot

png(filename = "plot2.png", width =480, height = 480, units = "px", bg = "white")
plot(totalEmi, type = "b", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
