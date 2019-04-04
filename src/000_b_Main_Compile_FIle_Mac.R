#This will be the main file for the project
#Ensure the wroking directory is set in the project
#Run this line for mac
#Set the working directory
setwd("~/Documents/R_Projects/TimeSeriesRealEstateProject")

#input packages needed to run script
source("src/00_Packages.R")

#input data, create dataframe
source("src/AveragePricesSADataFrame.R")

#Create time series data
source("src/AveragePricesSATimeSeries.R")

#Create and input plot work
source("src/TimeSeriesPlotsNoWork.R")

#Creating the Trend and Cycle components using the HP filter model and standard lambda
source("src/TrendAndCycleDecompData.R")

#Creating the Trend and Cycle components using the HP filter model and  lambda being for monthly (129600)
source("src/hpFiltermonthlyFrequencyDecomp.R")


#Plotting the Trend and Cycle components of each regions in the UK in two plots - 1 for the series,trend and one for the cycle 
source("src/CycleTrendPlot.R")



png(filename="/home/jon/Documents/R_Projects/TimeSeriesRealEstateProject/fig/LondonTSPlot.png")
AveragePriceSeasonallyAdjustedPlot = plot.ts(AveragePriceSeasonallyAdjustedTS, main = "Monthly Percentage Change London", ylab = "Monthly Percent Change", xlab = "Monthly Time")

#Basic Decompose for each city
# Cities: London
png(filename="/home/jon/Documents/R_Projects/TimeSeriesRealEstateProject/fig/LondonFlatPercentChangeComponentsPlot.png")
AveragePriceSeasonallyAdjustedTSComponents = decompose(AveragePriceSeasonallyAdjustedTS)
AveragePriceSeasonallyAdjustedTSComponents = plot(AveragePriceSeasonallyAdjustedTSComponents)
dev.off()


#STL Decomposition for each city
# Cities: London
png(filename = "/home/jon/Documents/R_Projects/TimeSeriesRealEstateProject/fig/LondonPercentChangeSTLDecompositionPlot.png")
AveragePriceSeasonallyAdjustedTSSTLDecomposition = (stl(AveragePriceSeasonallyAdjustedTSComponents, s.window = 7, t.window = 50, t.jump = 1))
AveragePriceSeasonallyAdjustedTSSTLDecompositionPlot = plot(AveragePriceSeasonallyAdjustedTSSTLDecomposition)
dev.off()


#Adding quarterly timeseries of the HPI since 1968.
#File conveted to zooreg object and will be used as a timeseries.
source("src/HPIQuarterlySeries.R")





