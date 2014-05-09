### Cleaning Data ###
# The popstants database has more than onle 'refugees'. That is 
# why we have to subset here. 

CleanData <- function() {
    popstats <- subset(popstats, popstats$Population.type == 'Refugees')
    access.recent <- access[access$Year >= 2000, ]
    
    # Adding ISO3 Codes. 
    popstats$Country...territory.of.residence.iso3 <- 
        hdxdictionary(popstats$Country...territory.of.residence, 'country.name', 'iso2c')
    popstats$Country...territory.of.residence.iso3 <- 
        hdxdictionary(popstats$Country...territory.of.residence.iso3, 'iso2c', 'iso3c')
    
    popstats$Origin...Returned.from.iso3 <- 
        hdxdictionary(popstats$Origin...Returned.from, 'country.name', 'iso2c')
    popstats$Origin...Returned.from.iso3 <- 
        hdxdictionary(popstats$Origin...Returned.from.iso3, 'iso2c', 'iso3c')
    
    
    # from wide to long 
    popstats.long <- melt(popstats, id.vars = c("Origin...Returned.from.iso3", "Country...territory.of.residence.iso3","Origin...Returned.from", "Population.type", "Country...territory.of.residence"))
    
    # cleaning the X 
    popstats.long$variable <- gsub("X","",popstats.long$variable)
    
    
    # Cleaning data #
    # Deleting the comma.
    access$Refugees <- as.numeric(gsub(",","",access$Refugees))
    access$Refugees.assisted.by.UNHCR <- as.numeric(gsub(",","",access$Refugees.assisted.by.UNHCR))
    access$Total.refugees.and.people.in.refugee.like.situations <- 
        as.numeric(gsub(",","",access$Total.refugees.and.people.in.refugee.like.situations))
    access$Total.refugees.and.people.in.refugee.like.situations <- 
        as.numeric(gsub(",","",access$Total.refugees.and.people.in.refugee.like.situations))
    
    
    # Transforming the characters in numbers. 
    access$Refugees <- as.numeric(access$Refugees)
    access$Refugees.assisted.by.UNHCR <- as.numeric(access$Refugees.assisted.by.UNHCR)
    access$Total.refugees.and.people.in.refugee.like.situations <- 
        as.numeric(access$Total.refugees.and.people.in.refugee.like.situations)
    access$Total.refugees.and.people.in.refugee.like.situations.assisted.by.UNHCR <- 
        as.numeric(access$Total.refugees.and.people.in.refugee.like.situations.assisted.by.UNHCR)
} 