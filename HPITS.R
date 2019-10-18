library(dplyr)
library(tidyverse)
library(rucm)
library(ggplot2)
library(zoo)
library(xts)
library(lubridate)

df <- read.csv(file = "data/ukhpi-property-type-hpi-london-from-1960-01-01-to-2019-04-01.csv", header = TRUE)

df1 <- df %>% mutate(Date = Period, Value = House.price.index.All.property.types)
df1 <- df1 %>% select(Date, Value)
df.new <- df1[seq(1, nrow(df1), 3), ]
df.TS <- ts(df.new$Value, frequency = 4, start = c(1968, 2)) # 2nd Quarter of 1959

modeldf <- ucm(formula = df.TS~0, data = df.TS, irregular = TRUE, irregular.var = 1, level = TRUE,
               level.var = 1, slope = TRUE, slope.var = 1, season = TRUE,
               season.length = 12, season.var = 1, cycle = TRUE, cycle.period = 96,
               cycle.var = 1)


summary(modeldf)

plot(df.TS, ylab = "HPI", main = "Decomposition of time series")
lines(modeldf$s.cycle , col = "blue")
lines(modeldf$s.level  , col = "red")
lines(modeldf$s.season  , col = "green")
lines(modeldf$s.slope  , col = "orange")
legend("topleft", legend = c("HPI","S_cycle","S_level","S_seson","S_slope"), col = c("black","blue","red","green","orange"), lty = 1)
