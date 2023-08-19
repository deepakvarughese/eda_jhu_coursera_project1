## EDA Project

## Plot3

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
  mutate(global_active_power = as.numeric(global_active_power)) %>% 
  mutate(date_time = paste(date , time)) %>% 
  mutate(date_time = as.POSIXct(date_time))


## Plots =================

plot_3 <- with(data_clean, {
  plot(sub_metering_1~date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(sub_metering_2~date_time,col='Red')
  lines(sub_metering_3~date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##############################################################################
# STEP 5 - Saving to file
##############################################################################	 

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## Exporting
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
