library(tidyverse)
library(dplyr)
library(lubridate)
library(ggplot2)

setwd("C:/Users/aasis/Desktop/DataScience-Assignment")


#importing the cleaned broadband speed
cleaned_broadband_speed= read_csv('Clean-data/Cleaned Broadband Speed Dataset.csv')

#----------- Broadband Speed Box plot-----------#

#creating box plot to visualize average download speed in Kent and Surrey
cleaned_broadband_speed %>% 
  group_by(County) %>% #grouping by county since we are comparing counties only
  ggplot(aes(x = County, y = `Average download speed (Mbit/s)`, fill=County)) + #setting x-axis and y-axis values
  scale_y_continuous(limits=c(0,40), breaks = seq(0,40,2))+ #setting limits and breaks
  geom_boxplot() + #specifying the type of plot we need
  labs(title="Average Download Speed By County Box Plot") #setting label for the chart  


#-----------------Avg download speed in kent---------------#
#creating bar chart to visualize average download speed in Kent
cleaned_broadband_speed %>% 
  filter(County== "KENT") %>% 
  group_by(`Town/City`) %>% #grouping by county since we are comparing counties only
  summarise(`County Average Download Speed`= mean(`Average download speed (Mbit/s)`)) %>% 
  ggplot(aes(x = `Town/City`, y = `County Average Download Speed`, fill=`Town/City`)) + #setting x-axis and y-axis values
  scale_y_continuous(limits=c(0,120), breaks = seq(0,120,5))+ #setting limits and breaks
  geom_bar(stat = "identity") + #specifying the type of plot we need 
  labs(title="Average Download Speed Within Kent Bar Chart") + #setting label for the chart  
  coord_flip()


#-----------------Avg download speed in surrey---------------#
#creating bar chart to visualize average download speed in Surrey
cleaned_broadband_speed %>% 
  filter(County== "SURREY") %>% 
  group_by(`Town/City`) %>% #grouping by county since we are comparing counties only
  summarise(`County Average Download Speed`= mean(`Average download speed (Mbit/s)`)) %>% 
  ggplot(aes(x = `Town/City`, y = `County Average Download Speed`, fill=`Town/City`)) + #setting x-axis and y-axis values
  scale_y_continuous(limits=c(0,90), breaks = seq(0,90,5))+ #setting limits and breaks
  geom_bar(stat = "identity") + #specifying the type of plot we need 
  labs(title="Average Download Speed Within Surrey Bar Chart") + #setting label for the chart  
  coord_flip()
