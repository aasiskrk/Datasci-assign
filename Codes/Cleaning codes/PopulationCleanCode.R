library(tidyverse)
library(dplyr)

population_data=read.csv("Obtained-data/Population2011_1656567141570.csv")
population_data

clean_pop= population_data %>% 
  na.omit() %>% 
  distinct()

#no na data or duplicate data found in this pop csv file

write_csv(clean_pop, "C:/Users/aasis/Desktop/DataScience-Assignment/Clean-data/Cleaned Population.csv")
