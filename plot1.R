#-----Changing the Directory --------#
rm(list=ls())
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");

#-----------Uploading the data-------#
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(datos)

#-----  Changing the format - Date-----------#
install.packages("base")
library(base)

datos$Date <- as.Date(x=datos$Date, format="%d/%m/%Y")
str(datos$Date)

#----Filter the dates of 2007-02-01 and 2007-02-02 -----------#
install.packages("dplyr")
library(dplyr)
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02")

#-------Changing the format of Variables-----#
datos$Global_active_power = as.numeric(as.character(datos$Global_active_power))

#---------------Graphing  -------------------#
png("plot1.png", width=480, height=480)
hist(x=datos$Global_active_power 
     ,col = "red"
     ,xlab ="Global Active Power(kilowatts)"
     ,ylab="Frequency"
     ,main = "Global Active Power")
dev.off()
