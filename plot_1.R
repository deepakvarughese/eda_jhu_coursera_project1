## EDA Project

## Plot1

## Dr Deepak Varughese
## 19.08.2023



## Loading Libraries =====
library(tidyverse)
library(rio)
library(here)
library(janitor)
library(lubridate)


## Importing data =====
data_raw <- import(here("exdata_data_household_power_consumption.zip"))

## Cleaning Data

data_clean <- data_raw %>% 
  clean_names() %>% 
  mutate(date = dmy(date)) %>% 
  filter(date == "2007-02-01" | date =="2007-02-02" ) %>% 
  mutate(global_active_power = as.numeric(global_active_power))
  
  
## Plots =================
plot_1 <- hist(data_clean$global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Exporting
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
