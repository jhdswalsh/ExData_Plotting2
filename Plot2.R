

rm(list = ls()) # Clear workspace

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data 
MD <- subset(NEI, fips == '24510')

png(filename = 'plot2.png', bg = "white", width = 480, height = 480)
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total emissions in Baltimore City, Maryland', xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in tons')), col = 1)
dev.off()

