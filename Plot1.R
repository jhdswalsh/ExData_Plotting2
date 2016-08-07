

rm(list = ls()) # Clear workspace

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1E6, 2)

# create and plot file
png(filename = "plot1.png", bg = "white", width = 480, height = 480)
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression(paste('Total emissions of PM'[2.5], ' in the United States')), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Megatons')), col = 1)
lines(x=x,y=y,col="blue") 
dev.off()




