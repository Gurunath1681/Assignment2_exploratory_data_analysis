#setwd("C:/Users/212396399/Desktop/R_practice/Exploratory_data_analysis/pollution_data")

#reading National emissions data and source sode classification data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")

# subsetting emissions data for coal combustion related emissions
  NEISCC <- merge(NEI, SCC, by="SCC")
  coal_comb <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE) 
  coal_comb_emissions <- NEISCC[coal_comb, ]

#aggregate the total coal combustion related emissions by year using the function sum
  coalcomb_emissions<-aggregate(Emissions~year,coal_comb_emissions, sum)

# make bar plot
  library(ggplot2)

  png('plot4.png')

  ggp <- ggplot(coalcomb_emissions/10^3,aes(factor(year),Emissions)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    labs(x="year", y="Total PM2.5 emissions (Kilo Tons)") + 
    labs(title="PM2.5 emissions due to coal combustion ")
  
  print(ggp)
  
  dev.off()
  
  
