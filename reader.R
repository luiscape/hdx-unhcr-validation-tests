## Comparing popstats with UNHCR's access database ##


# Loading data and dependencies. 
source('load_data.R')




# Transorming the country codes in uppercase
access.codes$Country.code <- toupper(access.codes$Country.code)

# Storing the csv.
StoreCsv()
