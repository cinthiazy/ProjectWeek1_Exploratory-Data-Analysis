# ProjectWeek1_Exploratory-Data-Analysis
In this repository show my project of Week1 of the Course Exploratory Data Analysis dictaded by Johns Hopkins University in Coursera.
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" .

**Dataset:** Electric power consumption <http://archive.ics.uci.edu/ml/index.php>

**Description:**  Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


## Plot 1

```R
#-----------Uploading the data-------#
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");
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

```
![](https://github.com/cinthiazy/ProjectWeek1_Exploratory-Data-Analysis/blob/master/plot1.png)

## Plot 2

```R
#-----------Uploading the data-------#
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#-----  Changing the format - Date-----------#
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

#----Filter the dates of 2007-02-01 and 2007-02-02 -----------#
# install.packages("dplyr")
library(dplyr)
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02")

#-------    Changing Language settings -----------#
#Extraer la configuración actual ##ORIGINAL: Spanish_Spain.1252
original_locale = Sys.getlocale(category = "LC_TIME")
#Cambiar a formato 'English'
Sys.setlocale(category = "LC_TIME", locale = "English")

#-------Changing the format of Variables-----#
datos$Global_active_power = as.numeric(as.character(datos$Global_active_power))

#---------------Graphing  -------------------#
png("plot2.png", width=480, height=480)
plot(x = datos$DateTime
     , y = datos$Global_active_power
     , type="l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)")
dev.off()

#Cambiar de vuelta a la configuración inicial
Sys.setlocale(category = "LC_TIME", locale = original_locale)
```
![](https://github.com/cinthiazy/ProjectWeek1_Exploratory-Data-Analysis/blob/master/plot2.png)
