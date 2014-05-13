## Subsetting the list for the focus countries. ## 
library(hdxdictionary)
source('reader.R')

colombia <- subset(access, access$Country.or.territory.of.origin == 'COL')
kenya <- subset(access, access$Country.or.territory.of.origin == 'KEN')
yemen <- subset(access, access$Country.or.territory.of.origin == 'YEM')

write.csv(colombia, "data/UNHCR-Refugee-Data_KEN.csv")
write.csv(colombia, "data/UNHCR-Refugee-Data_COL.csv")
write.csv(colombia, "data/UNHCR-Refugee-Data_YEM.csv")


## Plotting ##