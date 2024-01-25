library(tidyverse)
library(dplyr)

setwd("C:/Users/aasis/Desktop/DataScience-Assignment")

getwd()

kent2021_22= read.csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/school-data/2021-2022 kent/886_ks4provisional.csv",fill = TRUE) %>% 
  mutate(Year = 2021) %>% 
  select(Year, PCODE, SCHNAME, ATT8SCR) %>% 
  distinct()
kent2022_23= read.csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/school-data/2022-2023 kent/886_ks4provisional.csv",fill=TRUE) %>% 
  mutate(Year = 2022) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>% 
  na.omit() %>% 
  distinct()
surrey2021_22= read.csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/school-data/2021-2022 surrey/936_ks4provisional.csv",fill=TRUE) %>% 
  mutate(Year = 2021) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>% 
  na.omit() %>% 
  distinct()
surrey2022_23= read.csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/school-data/2022-2023 surrey/936_ks4provisional.csv",fill=TRUE) %>% 
  mutate(Year = 2022) %>% 
  select( Year,PCODE,SCHNAME, ATT8SCR,) %>% 
  na.omit() %>% 
  distinct()

combine_data = rbind(kent2021_22,kent2022_23,surrey2021_22,surrey2022_23)

cleanSchooldata=combine_data %>%
  mutate_all(~ifelse(. == "", NA, .)) %>%  # Replace empty strings with NA
  filter_all(all_vars(!is.na(.))) %>%    # Remove rows with any NA values

# Remove rows where ATT8SCR contains "NE" or "SUPP"
filter(!grepl("NE|SUPP", ATT8SCR, ignore.case = TRUE)) %>%
# Convert ATT8SCR to numeric (assuming it's a numeric score column)
mutate(ATT8SCR = as.numeric(ATT8SCR)) %>%
filter(!is.na(ATT8SCR)) %>%
select(Year, PCODE, SCHNAME, ATT8SCR) %>%
distinct()


write.csv(cleanSchooldata,"Clean-data/Cleaned School Data.csv",row.names =FALSE)  
