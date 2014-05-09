## Validation tests for UNHCR data. ##



source('clean_data.R')

# Checking if the numbers are consistent between the access database and
# the popstats database.
nrow(popstats.long)  # 82355
nrow(access.recent)  # 14827

# plotting
p1 <- ggplot(popstats.long) + theme_bw() + 
    geom_bar(aes(variable, value), stat = 'identity')

p2 <- ggplot(access.recent) + theme_bw() +
    geom_bar(data = access.recent, aes(Year, Refugees), stat = 'identity')

ggsave(file = 'graphics/Popstats_Site.png', plot = p1)
ggsave(file = 'graphics/Access_database.png', plot = p2)


## The following test is incomplete. The idea is to compare the refugee numbers
## from the 
# CheckConsistency <- function() { 
#     for (i in 1:nrow(access)) { 
#         if (as.numeric(access[i, 4]) == as.numeric(access[i, 5])) { 
#             access$is_equal_refugee <<- TRUE 
#         } else access$is_equal_refugee <<- FALSE
#         access$is_equal_total <<- if (as.numeric(access[i, 6]) == as.numeric(access[i, 7])) { 
#             access$is_equal_total <<- TRUE 
#         } else access$is_equal_total <<- FALSE 
#     }
# }
