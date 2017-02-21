############################################
#    Query GoogleTrends from R
#
############################################

# Installing depending packages
requiredPackages <- c("stringi","colorspace","Rcpp","mime","curl","stringr",
                      "RCurl","openssl","R6","stringr","RColorBrewer","xml2",
                      "dichromat", "munsell", "labeling","assertthat",
                      "xml2","httr","selectr","magrittr","jsonlite", 
                      "gtable","plyr","reshape2","scales","tibble", 
                      "lazyeval","rvest","googleVis","zoo","ggplot2")




install.packages (requiredPackages)
#********************** Install from R
# install.packages("gtrendsR")
#
#********************** Install from github
#if (!require("devtools")) install.packages("devtools")
devtools::install_github("PMassicotte/gtrendsR")
# devtools::install_github("dvanclev/GTrendsR")
# https://github.com/PMassicotte/gtrendsR

# Load library
library(xml2)
library(gtrendsR)

# Create a connection using your Google Account details
user <- "<Google account email>"
psw  <- "<Google account password>"
gConnect <- gconnect(user, psw)


# use the connection to get Google trends data
data <- gtrends(gConnect, "Macron")

#Explore the data
head(data$searches[[1]])
data$rising
plot(data$trend$Macron, type="l")


## plot via googeVis to browser
## highlighting regions (probably countries) and cities
plot(res, type = "region")
plot(res, type = "cities")
