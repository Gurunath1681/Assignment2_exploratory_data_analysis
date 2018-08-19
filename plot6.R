#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis/pollution_data")

#reading National emissions data and source sode classification data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

# subsetting motor emissions data for Baltimore
  NEISCC <- merge(NEI, SCC, by="SCC")
  baltimore_motor_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]  
  LA_motor_data <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",] 

#aggregate the total coal combustion related emissions by year using the function sum
  balt_motor_emissions<-aggregate(Emissions~year,baltimore_motor_data, sum)
  balt_motor_emissions$city<-c("Baltimore city","Baltimore city","Baltimore city","Baltimore city")
  LA_motor_emissions<-aggregate(Emissions~year,LA_motor_data, sum)
  LA_motor_emissions$city<-c("Los Angeles","Los Angeles","Los Angeles","Los Angeles")
  motor_data <- rbind(balt_motor_emissions,LA_motor_emissions)
# make bar plot
  library(ggplot2)

  png('plot6.png')

  ggp <- ggplot(motor_data,aes(factor(year),Emissions,fill="city")) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~city) + 
    labs(x="year", y="Total PM2.5 emissions (Tons)") + 
    labs(title="PM2.5 motor vehicle emissions in Baltimore city and LA ")
  
  print(ggp)
  
  dev.off()
  
  
