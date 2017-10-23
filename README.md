# ProjectWeek1_Exploratory-Data-Analysis
In this repository show my project of Week1 of the Course Exploratory Data Analysis dictaded by Johns Hopkins University in Coursera.
This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:

**Dataset:** Electric power consumption <http://archive.ics.uci.edu/ml/index.php>

**Description:**  Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.


### ** PLOT N1**

```{r echo=TRUE}
setwd("E:/CURSOS/EspecializacionDataScience-JH/ExploratoryDataAnalysis-Coursera/Week1/Evaluacion");
datos<- read.table("household_power_consumption.txt", header = TRUE, sep = ";");
```

```{r eval=FALSE}
install.packages("base");
library(base);
install.packages("dplyr");
library(dplyr);
```

```{r echo=FALSE}
suppressWarnings(suppressMessages(library(base)))
suppressWarnings(suppressMessages(library(dplyr)))
```

```{r eval=FALSE}
png("plot1.png", width=480, height=480)
hist(x=datos$Global_active_power 
     ,col = "red"
     ,xlab ="Global Active Power(kilowatts)"
     ,ylab="Frequency"
     ,main = "Global Active Power")
dev.off()
```

```{r echo=FALSE}
datos$Date <- as.Date(x=datos$Date, format="%d/%m/%Y");
datos <- filter(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02");
datos$Global_active_power = as.numeric(as.character(datos$Global_active_power));
hist(x=datos$Global_active_power 
     ,col = "red"
     ,xlab ="Global Active Power(kilowatts)"
     ,ylab="Frequency"
     ,main = "Global Active Power");

```
