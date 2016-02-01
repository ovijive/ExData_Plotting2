# read RDS files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#Baltimore City (fips: 24510)
neiSub <- NEI[(NEI$fips=="24510"|NEI$fips == "06037") & NEI$type == "ON-ROAD",  ]

#Baltimore City emission
totalEmi <- aggregate(Emissions ~ year + fips, data = neiSub, sum)

totalEmi$fips[totalEmi$fips == "24510"] <- "Baltimore, MD"
totalEmi$fips[totalEmi$fips == "06037"] <- "Los Angeles, CA"

png(filename = "plot6.png", width = 800, height = 800)

g <- ggplot(data = totalEmi, aes(x = year, y = Emissions)) 
g <- g + facet_grid(. ~ fips) 
g <- g +  geom_bar(stat = "identity") +
  ggtitle("Total Particle Emission from motor sources\n in Baltimore and Los Angeles County\n from 1999 until 2008") +
  ylab("Total Particle Emissions") +
  xlab("Year") +
  theme(legend.position ="none")
  
print(g)
dev.off()


rm(list = ls())
