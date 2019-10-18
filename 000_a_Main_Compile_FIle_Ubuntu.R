#This will be the main file for the project
#Ensure the wroking directory is set in the project
#Run this line for mac
#Run this line for ubuntu
#Set the working directory
setwd("~/Documents/R_Projects/TimeSeriesRealEstateProject")

#input packages needed to run script
source("src/00_Packages.R")

#kobe theme
source("src/01_Kobe_themes.R")

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


#This is the monthly frequency
#Plotting the Trend and Cycle components of each regions in the UK in two plots - 1 for the series,trend and one for the cycle 
source("src/CycleTrendPlotMonthlyFrequency.R")




