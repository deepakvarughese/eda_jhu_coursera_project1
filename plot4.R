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

plot_4 <- par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_clean, {
  plot(global_active_power~date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(voltage~date_time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(sub_metering_1~date_time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(sub_metering_2~date_time,col='Red')
  lines(sub_metering_3~date_time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(global_reactive_power~date_time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


## Exporting
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
