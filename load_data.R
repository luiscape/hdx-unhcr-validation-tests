## Load data and dependencies. ##

# loading dependencies
library(hdxdictionary)
library(ggplot2)
library(reshape2)
library(lubridate)

# loading data
access <- read.csv('data/unhcr-refugee-data.csv', colClasses = "character")
popstats <- read.csv('data/unhcr-popstats.csv', skip = 4)

access.codes <- read.csv('data/unhcr-refugee-countries.csv')

# For storing the resulting CSV.
StoreCsv <- function() { 
    write.csv(access, 'data/unhcr-refugee-data.csv', row.names = F)
    write.csv(access.codes, 'data/unhcr-refugee-countries.csv', row.names = F)
}