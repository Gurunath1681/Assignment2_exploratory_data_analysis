#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis/pollution_data")

#reading National emissions data and source sode classification data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting emissions data for Baltimore
baltimore_data <- NEI[NEI$fips == "24510",]

#aggregate the total emissions by year using the function sum
sum_emissions<-aggregate(Emissions~year,baltimore_data, sum)

# make bar plot
  png('plot2.png')
  barplot(height=(sum_emissions$Emissions)/10^3, names.arg=sum_emissions$year, xlab="year", ylab="Total PM2.5 emissions (Kilo tons)",main="Total year-wise PM2.5 emissions for Baltimore (Kilo tons)")
  dev.off()
