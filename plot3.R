rm(list = ls())

#Load ggplot2
library(ggplot2)

# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#extract Baltimore City (fips: 24510) emissions
?subset
baltEmi <- subset(NEI, fips==24510)


png(filename="plot3.png", width=800, height=800, units="px")

#plot
g <- ggplot(baltEmi, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y="sum") + ylab(" Emission") + ggtitle("Emission by Type - Baltimore")

dev.off()
