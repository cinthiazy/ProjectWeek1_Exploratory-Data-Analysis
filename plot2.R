
#------------------------------------#
#-----Changing the Directory --------#
#------------------------------------#
rm(list=ls())
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");

#------------------------------------#
#-----------Uploading the data-------#
#------------------------------------#
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(datos)

#--------------------------------------------#
#-----  Changing the format - Date-----------#
#--------------------------------------------#
install.packages("lubridate")
library(lubridate)
install.packages("base")
library(base)
install.packages("chron")
library(chron)

datos$Date <- as.Date(x=datos$Date, format="%d/%m/%Y", tz="COT")
datos$Time<- chron(times=datos$Time)
datos$DateTime <-paste(datos$Date,datos$Time)
datos$DateTime <-as.POSIXct(datos$DateTime,format="%Y-%m-%d %H:%M:%S")

#-------------------------------------------------------------#
#----Filter the dates of 2007-02-01 and 2007-02-02 -----------#
#-------------------------------------------------------------#
# install.packages("dplyr")
library(dplyr)
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02")
head(datos)

#-------------------------------------------------#
#-------    Changing Language settings -----------#
#-------------------------------------------------#

#Extraer la configuración actual ##ORIGINAL: Spanish_Spain.1252
original_locale = Sys.getlocale(category = "LC_TIME")
#Cambiar a formato 'English'
Sys.setlocale(category = "LC_TIME", locale = "English")

#--------------------------------------------#
#-------Changing the format of Variables-----#
#--------------------------------------------#

datos$Global_active_power = as.numeric(as.character(datos$Global_active_power))

#--------------------------------------------#
#---------------Graphing  -------------------#
#--------------------------------------------#

png("plot2.png", width=480, height=480)
plot(x = datos$DateTime
     , y = datos$Global_active_power
     , type="l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)")
dev.off()

#Cambiar de vuelta a la configuración inicial
Sys.setlocale(category = "LC_TIME", locale = original_locale)

