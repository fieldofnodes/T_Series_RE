#input packages needed to run script
source("src/00_Packages.R")

data <- read.csv(file = "data/Quarterly_London_1985_01_01-2019_02_01.csv", header = TRUE)
#data <- as.data.frame(data)
AllPropertyAverage <- data$Average_Price_All_Types 
AllPropertyAverage_TS <-ts(data = AllPropertyAverage, start = c(1996,1), frequency = 12)






# plot the data using ggplot2
ggplot(data=AllPropertyAverage_TS, aes()) +
  geom_point() +
  labs(title = "Precipitation - Boulder, Colorado")


p <- autoplot(AllPropertyAverage_TS)
str(p)
