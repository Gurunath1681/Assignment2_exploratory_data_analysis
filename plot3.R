#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis/pollution_data")

#reading National emissions data and source sode classification data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

# subsetting emissions data for Baltimore
  baltimore_data <- NEI[NEI$fips == "24510",]

#aggregate the total emissions by year using the function sum
  sum_emissions<-aggregate(Emissions~year,baltimore_data, sum)

# make bar plot
  library(ggplot2)

  png('plot3.png')

  ggp <- ggplot(baltimore_data,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type) + 
    labs(x="year", y="Total PM2.5 emissions (Tons)") + 
    labs(title="PM2.5 emissions for Baltimore ")
  
  print(ggp)
  
  dev.off()
  
  
