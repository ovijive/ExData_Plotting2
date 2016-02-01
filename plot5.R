# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Baltimore City (fips: 24510)
baltEmiss = subset(NEI, fips==24510 & type =="ON-ROAD")

#Baltimore City emission
totalEmi = aggregate(Emissions ~ year, data = baltEmiss, sum)

#load ggplot2blibrary
library(ggplot2)

#plot
png(filename="plot5.png", width=800, height=800, units="px")

g <- ggplot(totalEmi, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  xlab("year") +
  ggtitle("Emission Trends in Baltimore City from 1999 to 2008")

print(g)


dev.off()