

rm(list = ls()) # Clear workspace
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal-related SCC
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merge data 
merge <- merge(x = NEI, y = SCC.coal, by = 'SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

png(filename = 'plot4.png', width = 480, height = 480)
ggplot(data = merge.sum, aes(x = Year, y = Emissions / 1E6)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle(expression('Total Emissions of PM'[2.5])) + ylab(expression(paste('PM', ''[2.5], ' in Megatons'))) + geom_text(aes(label = round(Emissions / 1E6, digits = 2), size = 2, hjust = 0.0, vjust = 0.0)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'green', high = 'red') + geom_smooth(method = "lm", se = TRUE)
dev.off()
