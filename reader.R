## Comparing popstats with UNHCR's access database ##


# Loading data and dependencies. 
source('load_data.R')

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



# Transorming the country codes in uppercase
access.codes$Country.code <- toupper(access.codes$Country.code)

# Storing the csv.
StoreCsv()
