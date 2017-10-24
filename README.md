# ProjectWeek1_Exploratory-Data-Analysis
In this repository show my project of Week1 of the Course Exploratory Data Analysis dictaded by Johns Hopkins University in Coursera.
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" .

**Dataset:** Electric power consumption <http://archive.ics.uci.edu/ml/index.php>

**Description:**  Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


```R
#------------------------------------#
#-----------Uploading the data-------#
#------------------------------------#
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(datos)

#--------------------------------------------#
#-----  Changing the format - Date-----------#
#--------------------------------------------#

install.packages("base")
library(base)

datos$Date <- as.Date(x=datos$Date, format="%d/%m/%Y")
str(datos$Date)

#-------------------------------------------------------------#
#----Filter the dates of 2007-02-01 and 2007-02-02 -----------#
#-------------------------------------------------------------#
install.packages("dplyr")
library(dplyr)
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02")

#--------------------------------------------#
#-------Changing the format of Variables-----#
#--------------------------------------------#
datos$Global_active_power = as.numeric(as.character(datos$Global_active_power))

#--------------------------------------------#
#---------------Graphing  -------------------#
#--------------------------------------------#

png("plot1.png", width=480, height=480)
hist(x=datos$Global_active_power 
     ,col = "red"
     ,xlab ="Global Active Power(kilowatts)"
     ,ylab="Frequency"
     ,main = "Global Active Power")
dev.off()

```
![](https://github.com/cinthiazy/ProjectWeek1_Exploratory-Data-Analysis/blob/master/plot1.png)
