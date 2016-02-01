#Read files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggEmi <- aggregate(Emissions ~ year,NEI, sum)

#Help on the plot function
?"plot"

png(filename="plot1.png", width=480, height=480, units="px", bg = "white")
plot(aggEmi$year, aggEmi$Emissions, type="b", main="Total Emissions in the USA", xlab="Year", ylab="Total Emissions")
dev.off()