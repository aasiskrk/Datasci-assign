library(tidyverse)
library(dplyr)


setwd("C:/Users/aasis/Desktop/DataScience-Assignment")
getwd()
#Set 220082_AyushShrestha as the workin directory for the entire code to run in a single go

library(tidyverse)
library(dplyr)
library(lubridate)


#-----------2019 Dataset Cleaning-----------#

#Cleaning data through the use of pipe operator
houseprices_2019 <-read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/housing-price/pp-2019.csv", col_names = FALSE) %>%  #Importing CSV into R
  setNames(c("Transaction unique identifier", "Price", "Date of Transfer", "Postcode", "Property Type", "Old/New", "Duration", "PAON", 
             "SAON", "Street", "Locality", "Town/City", "District", "County", "PPD Category type", "Record Status")) %>% #Changing Column name
  as_tibble() %>% #Converting into tibble
  na.omit() %>% #Removing rows with null value
  select(Price, `Date of Transfer`, Postcode, `Town/City`, District, County) %>% #selecting only columns that are required
  filter(County =="KENT" | County== "SURREY") %>% #Preserving rows with Kent and Surrey as county
  mutate(`Date of Transfer` = year(as.Date(`Date of Transfer`, format = "%y/%m/%d"))) %>%  #modifying the date of transfer column to only show year
  mutate(S_No = row_number()) %>% #Adding a new serial number column
  select(S_No, everything()) #moving the serial number column at first


#-----------2020 Dataset Cleaning-----------#

houseprices_2020 <-read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/housing-price/pp-2020.csv", col_names = FALSE) %>%  #Importing CSV into R
  setNames(c("Transaction unique identifier", "Price", "Date of Transfer", "Postcode", "Property Type", "Old/New", "Duration", "PAON", 
             "SAON", "Street", "Locality", "Town/City", "District", "County", "PPD Category type", "Record Status")) %>% #Changing Column name
  as_tibble() %>% #Converting into tibble
  na.omit() %>% #Removing rows with null value
  select(Price, `Date of Transfer`, Postcode, `Town/City`, District, County) %>% #selecting only columns that are required
  filter(County =="KENT" | County== "SURREY") %>% #Preserving rows with Kent and Surrey as county
  mutate(`Date of Transfer` = year(as.Date(`Date of Transfer`, format = "%y/%m/%d"))) %>%  #modifying the date of transfer column to only show year
  mutate(S_No = row_number()) %>% #Adding a new serial number column
  select(S_No, everything()) #moving the serial number column at first

#-----------2021 Dataset Cleaning-----------#

houseprices_2021 <-read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/housing-price/pp-2021.csv", col_names = FALSE) %>%  #Importing CSV into R
  setNames(c("Transaction unique identifier", "Price", "Date of Transfer", "Postcode", "Property Type", "Old/New", "Duration", "PAON", 
             "SAON", "Street", "Locality", "Town/City", "District", "County", "PPD Category type", "Record Status")) %>% #Changing Column name
  as_tibble() %>% #Converting into tibble
  na.omit() %>% #Removing rows with null value
  select(Price, `Date of Transfer`, Postcode, `Town/City`, District, County) %>% #selecting only columns that are required
  filter(County =="KENT" | County== "SURREY") %>% #Preserving rows with Kent and Surrey as county
  mutate(`Date of Transfer` = year(as.Date(`Date of Transfer`, format = "%y/%m/%d"))) %>%  #modifying the date of transfer column to only show year
  mutate(S_No = row_number()) %>% #Adding a new serial number column
  select(S_No, everything()) #moving the serial number column at first


#-----------2022 Dataset Cleaning-----------#

houseprices_2022 <-read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/housing-price/pp-2022.csv", col_names = FALSE) %>%  #Importing CSV into R
  setNames(c("Transaction unique identifier", "Price", "Date of Transfer", "Postcode", "Property Type", "Old/New", "Duration", "PAON", 
             "SAON", "Street", "Locality", "Town/City", "District", "County", "PPD Category type", "Record Status")) %>% #Changing Column name
  as_tibble() %>% #Converting into tibble
  na.omit() %>% #Removing rows with null value
  select(Price, `Date of Transfer`, Postcode, `Town/City`, District, County) %>% #selecting only columns that are required
  filter(County =="KENT" | County== "SURREY") %>% #Preserving rows with Kent and Surrey as county
  mutate(`Date of Transfer` = year(as.Date(`Date of Transfer`, format = "%y/%m/%d"))) %>%  #modifying the date of transfer column to only show year
  mutate(S_No = row_number()) %>% #Adding a new serial number column
  select(S_No, everything()) #moving the serial number column at first

#merging all the cleaned dataset into a single tibble

combined_houseprices<- bind_rows(houseprices_2019, houseprices_2020, houseprices_2021, houseprices_2022) %>% 
  mutate(`Short Postcode`= substr(Postcode, 1,5)) #adding another column to the combine dataset


#defining path to save the cleaned dataset
file_path <- "C:/Users/aasis/Desktop/DataScience-Assignment/Clean-data/Cleaned House Prices.csv"


#saving the cleaned dataset
write.csv(combined_houseprices,file_path, row.names = FALSE) 





