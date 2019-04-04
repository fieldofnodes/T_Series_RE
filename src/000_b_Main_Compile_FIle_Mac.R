#input packages needed to run script
source("src/00_Packages.R")

data <- read.csv(file = "data/Quarterly_London_1985_01_01-2019_02_01.csv", header = TRUE)
data <- as.data.frame(data)
data_TS <- ts(data)
names(data)
attach(data_TS)



ucm(formula, data, irregular = TRUE, irregular.var = NA, level = TRUE,
    level.var = NA, slope = FALSE, slope.var = NA, season = FALSE,
    season.length = NA, season.var = NA, cycle = FALSE, cycle.period = NA,
    cycle.var = NA)

modelHPI <- ucm(HPI_All_Types~0, data = data_TS, slope = TRUE)
plot(data_TS[,6] , ylab = "HPI")
lines(modelHPI$s.level, col = "blue")
legend("topright", legend = c("Observed flow","S_level"), col = c("black","blue"), lty = 1)
