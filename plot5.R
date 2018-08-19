#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis/pollution_data")

#reading National emissions data and source sode classification data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

# subsetting motor emissions data for Baltimore
  NEISCC <- merge(NEI, SCC, by="SCC")
  baltimore_motor_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]  

#aggregate the total coal combustion related emissions by year using the function sum
  balt_motor_emissions<-aggregate(Emissions~year,baltimore_motor_data, sum)

# make bar plot
  library(ggplot2)

  png('plot5.png')

  ggp <- ggplot(balt_motor_emissions,aes(factor(year),Emissions)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    labs(x="year", y="Total PM2.5 emissions (Tons)") + 
    labs(title="PM2.5 emissions due to motor vehicles in Baltimore ")
  
  print(ggp)
  
  dev.off()
  
  
