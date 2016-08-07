

rm(list = ls()) # Clear workspace
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels = c('1999', '2002', '2005', '2008'))

png('plot3.png', width = 720, height = 480, units = 'px')
ggplot(data = MD, aes(x = year, y = log(Emissions))) + facet_grid(. ~ type) + guides(fill = FALSE) + geom_boxplot(aes(fill = type)) + stat_boxplot(geom = 'errorbar') + ylab(expression(paste('Log', ' of PM'[2.5], ' emissions'))) + xlab('Year') + ggtitle('Baltimore City, Maryland: Emissions types') + geom_jitter(alpha = 0.10)
dev.off()