library(tidyverse)
library(dplyr)

#load the datasets
kentcrimedata = read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/police-data/2023-04/2023-04-kent-street.csv")
surreycrimedata = read_csv("C:/Users/aasis/Desktop/DataScience-Assignment/Obtained-data/police-data/2023-04/2023-04-surrey-street.csv")

#Merge the data
merged_data = rbind(kentcrimedata,surreycrimedata)
merged_data

#Slicing the values in the columns LSOA and Falls 
merged_data$`LSOA name` = substr(merged_data$`LSOA name`,1,nchar(merged_data$`LSOA name`)-5)
merged_data$`Falls within`= substr(merged_data$`Falls within`,1,nchar(merged_data$`Falls within`)-nchar("Police "))

#Deleting all Null Column
merged_data$Context = NULL

merged_data
write_csv(merged_data, "C:/Users/aasis/Desktop/DataScience-Assignment/Clean-data/Cleaned Crime Data.csv")


