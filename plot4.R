#-----Changing the Directory --------#
rm(list=ls())
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");

#------------Subiendo la datos-------#
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(datos)

#-----------Uploading the data-------#
install.packages("lubridate")
install.packages("base")
install.packages("chron")

library(lubridate)
library(base)
library(chron)

datos$Date <- as.Date(x=datos$Date, format="%d/%m/%Y", tz="COT")
datos$Time<- chron(times=datos$Time)
datos$DateTime <-paste(datos$Date,datos$Time)
datos$DateTime <-as.POSIXct(datos$DateTime,format="%Y-%m-%d %H:%M:%S")

#----Filter the dates of 2007-02-01 and 2007-02-02 -----------#
install.packages("dplyr")
library(dplyr)
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02")

#-------Changing the format of Variables-----#
datos$Global_active_power = as.numeric(as.character(datos$Global_active_power))
datos$Global_reactive_power = as.numeric(as.character(datos$Global_reactive_power))
datos$Voltage = as.numeric(as.character(datos$Voltage))
datos$Sub_metering_1 = as.numeric(as.character(datos$Sub_metering_1))
datos$Sub_metering_2 = as.numeric(as.character(datos$Sub_metering_2))

#-------    Changing Language settings -----------#
#Extraer la configuración actual ##ORIGINAL: Spanish_Spain.1252
original_locale = Sys.getlocale(category = "LC_TIME")
#Cambiar a formato 'English'
Sys.setlocale(category = "LC_TIME", locale = "English")

#---------------Graphing  -------------------#
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Grafico1
plot(x = datos$DateTime
     , y = datos$Global_active_power
     , type="l"
     , xlab=""
     , ylab="Global Active Power"
     , ylim = c(0,6))
# Grafico2
plot(x = datos$DateTime
     , y = datos$Voltage
     , type="l"
     , xlab="DateTime"
     , ylab="Voltage")
# Grafico3
plot(x=datos$DateTime
     , y=datos$Sub_metering_1
     , type="l"
     , xlab=""
     , ylab="Energy sub metering"
     , ylim = c(0,38)
     ,col="black")
lines(x=datos$DateTime, datos$Sub_metering_2,col="red")
lines(x=datos$DateTime, datos$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
# Grafico4
plot(x = datos$DateTime
     , y = datos$Global_reactive_power
     , type="l"
     , xlab="DateTime"
     , ylab="Global_reactive_power")

dev.off()

#Cambiar de vuelta a la configuración inicial
Sys.setlocale(category = "LC_TIME", locale = original_locale)
