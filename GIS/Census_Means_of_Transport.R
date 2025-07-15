# Justine Shakespeare
# July 3rd
# Attempts to use tidycensus to pull data from the table: B08528: Means of Transportation to Work by Class of Worker for Workplace Geography to incorporate this data in QGIS and map it

#install.packages("tidycensus")
library(tidycensus)
library(tidyverse)
library(sf)
library(ggplot2)

#census_api_key("376400d6d2e3212b4e723e93850395a6dc9d92f6", install = TRUE)


# Load B08528 data at the county level using ACS 5-year estimates
B08528 <- get_acs(
  geography = "state",
  table = "B08528",
  survey = "acs5",
  year = 2023,
  output = "wide",
  workplace_geography = TRUE
)

view(B08528)

head(B08528)

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 

# This is an interesting way to do it, but the geoid isn't the same as the one in the CSV downloaded from the website and so it wouldn't immediately join with the geography file we'd use to visualize it in QGIS. It looks like the geoid here is the last two digits of the geoid in the geography file, so I could just change it. But also the column names are a little hard to understand because they don't include notes on the significance of the codes. I will try the CSV file, which has the geoid that matches and notes on the metadata/code and also the actual dataset includes the full description of each column. 

### 2023 

# load the data from 2023
B08528_MeansofTransport_2023 <- read_csv("GIS/B08528_2018_2022/ACSDT1Y2023.B08528-Data.csv")

# turn it into a data frame
B08528_MeansofTransport_2023 <- as.data.frame(B08528_MeansofTransport_2023)

#remove the extraneous extra header row
B08528_MeansofTransport_2023 <- B08528_MeansofTransport_2023 %>% 
  slice(-1) %>% 
  mutate(Year_Date = "2023-01-01", Year = "2023")

dim(B08528_MeansofTransport_2023)
#View(B08528_MeansofTransport_2023)


### 2022

# load the data from 2022
B08528_MeansofTransport_2022 <- read_csv("GIS/B08528_2018_2022/ACSDT1Y2022.B08528-Data.csv")

# turn it into a data frame
B08528_MeansofTransport_2022 <- as.data.frame(B08528_MeansofTransport_2022)

#remove the extraneous extra header row
B08528_MeansofTransport_2022 <- B08528_MeansofTransport_2022 %>% 
  slice(-1) %>% 
  mutate(Year_Date = "2022-01-01", Year = "2022")

# Confirm that the column names in these two datasets are the same
identical(names(B08528_MeansofTransport_2023), names(B08528_MeansofTransport_2022))

### combine rows
MeansofTransport_Comb <- rbind(B08528_MeansofTransport_2023, B08528_MeansofTransport_2022)

dim(MeansofTransport_Comb)
#View(MeansofTransport_Comb)



### 2021

# load the data from 2021
B08528_MeansofTransport_2021 <- read_csv("GIS/B08528_2018_2022/ACSDT1Y2021.B08528-Data.csv")

# turn it into a data frame
B08528_MeansofTransport_2021 <- as.data.frame(B08528_MeansofTransport_2021)

#remove the extraneous extra header row
B08528_MeansofTransport_2021 <- B08528_MeansofTransport_2021 %>% 
  slice(-1) %>% 
  mutate(Year_Date = "2021-01-01", Year = "2021")

# Confirm that the column names in these two datasets are the same
identical(names(MeansofTransport_Comb), names(B08528_MeansofTransport_2021))

### combine rows
MeansofTransport_Comb <- rbind(MeansofTransport_Comb, B08528_MeansofTransport_2021)

dim(MeansofTransport_Comb)
head(MeansofTransport_Comb)
#View(MeansofTransport_Comb)



### 2019 (note there is not 2020 because of the pandemic)

# load the data from 2019
B08528_MeansofTransport_2019 <- read_csv("GIS/B08528_2018_2022/ACSDT1Y2019.B08528-Data.csv")

# turn it into a data frame
B08528_MeansofTransport_2019 <- as.data.frame(B08528_MeansofTransport_2019)

#remove the extraneous extra header row
B08528_MeansofTransport_2019 <- B08528_MeansofTransport_2019 %>% 
  slice(-1) %>% 
  mutate(Year_Date = "2019-01-01", Year = "2019")

# Confirm that the column names in these two datasets are the same
identical(names(MeansofTransport_Comb), names(B08528_MeansofTransport_2019))

### combine rows
MeansofTransport_Comb <- rbind(MeansofTransport_Comb, B08528_MeansofTransport_2019)

dim(MeansofTransport_Comb)
#View(MeansofTransport_Comb)



### 2018

# load the data from 2018
B08528_MeansofTransport_2018 <- read_csv("GIS/B08528_2018_2022/ACSDT1Y2018.B08528-Data.csv")

# turn it into a data frame
B08528_MeansofTransport_2018 <- as.data.frame(B08528_MeansofTransport_2018)

#remove the extraneous extra header row
B08528_MeansofTransport_2018 <- B08528_MeansofTransport_2018 %>% 
  slice(-1) %>% 
  mutate(Year_Date = "2018-01-01", Year = "2018")

# Confirm that the column names in these two datasets are the same
identical(names(MeansofTransport_Comb), names(B08528_MeansofTransport_2018))

### combine rows
MeansofTransport_Comb <- rbind(MeansofTransport_Comb, B08528_MeansofTransport_2018)

dim(MeansofTransport_Comb)
#View(MeansofTransport_Comb)





### On to cleaning up the data and preparing it for QGIS...


# rename fields
MeansofTransport_Comb <- MeansofTransport_Comb %>%
  rename(
    Total = B08528_001E,
    Total_forprofit = B08528_002E,
    Total_nonprofit = B08528_005E,
    Total_localGov = B08528_006E,
    Total_stateGov = B08528_007E,
    Total_fedGov = B08528_008E,
    Total_selfEmpNotincorp = B08528_009E,
    Total_UnpaidFamily = B08528_010E,
    Total_DroveAlone = B08528_011E,
    Total_Carpooled = B08528_021E,
    Total_PublicTransport = B08528_031E,
    Total_Walked = B08528_041E,
    Total_CabBikeOther = B08528_051E,
    Total_WorkFromHome = B08528_061E,
    ForProfit_WFH = B08528_062E, 
    NonProfit_WFH = B08528_065E, 
    LocalGov_WFH = B08528_066E,
    StateGov_WFH = B08528_067E,
    FedGov_WFH = B08528_068E,
    SelfEmpNotInc_WFH = B08528_069E,
    UnpaidFamily_WFH = B08528_070E,
    State = NAME
  )



# select only the fields we want to include in the map
MeansofTransport_Comb <- MeansofTransport_Comb %>% select("GEO_ID", "State", "Year_Date", "Year", "Total", "Total_forprofit", "Total_nonprofit", "Total_localGov", "Total_stateGov", "Total_fedGov", "Total_selfEmpNotincorp", "Total_UnpaidFamily", "Total_DroveAlone", "Total_Carpooled", "Total_PublicTransport", "Total_Walked", "Total_CabBikeOther", "Total_WorkFromHome", "ForProfit_WFH", "NonProfit_WFH", "LocalGov_WFH", "StateGov_WFH", "FedGov_WFH", "SelfEmpNotInc_WFH", "UnpaidFamily_WFH")

## Remove states and territories outside of the contiguous US:

MeansofTransport_Comb <- MeansofTransport_Comb[MeansofTransport_Comb$State != "Alaska", ]
MeansofTransport_Comb <- MeansofTransport_Comb[MeansofTransport_Comb$State != "Puerto Rico", ]
MeansofTransport_Comb <- MeansofTransport_Comb[MeansofTransport_Comb$State != "Hawaii", ]


# Check our work
head(MeansofTransport_Comb)
View(MeansofTransport_Comb)


# make all numeric fields numeric (note that you will still have to double check this when importing to QGIS using Layer > Data Source Manager)
MeansofTransport_Comb <- MeansofTransport_Comb %>%
  mutate(
    Year_Date = as.Date(Year_Date), 
    Total = as.numeric(Total),
    Total_forprofit = as.numeric(Total_forprofit),
    Total_nonprofit = as.numeric(Total_nonprofit),
    Total_localGov = as.numeric(Total_localGov),
    Total_stateGov = as.numeric(Total_stateGov),
    Total_fedGov = as.numeric(Total_fedGov),
    Total_selfEmpNotincorp = as.numeric(Total_selfEmpNotincorp),
    Total_UnpaidFamily = as.numeric(Total_UnpaidFamily),
    Total_DroveAlone = as.numeric(Total_DroveAlone),
    Total_Carpooled = as.numeric(Total_Carpooled),
    Total_PublicTransport = as.numeric(Total_PublicTransport),
    Total_Walked = as.numeric(Total_Walked),
    Total_CabBikeOther = as.numeric(Total_CabBikeOther),
    Total_WorkFromHome = as.numeric(Total_WorkFromHome), 
    ForProfit_WFH = as.numeric(ForProfit_WFH), 
    NonProfit_WFH = as.numeric(NonProfit_WFH), 
    LocalGov_WFH = as.numeric(LocalGov_WFH),
    StateGov_WFH = as.numeric(StateGov_WFH),
    FedGov_WFH = as.numeric(FedGov_WFH),
    SelfEmpNotInc_WFH = as.numeric(SelfEmpNotInc_WFH),
    UnpaidFamily_WFH = as.numeric(UnpaidFamily_WFH)
  )

# Create new fields that calculate percentage of workers that work in gov, for profit, or non-profit, or are unpaid family, etc.
MeansofTransport_Comb <- MeansofTransport_Comb %>%
  mutate(
    Total_AllGov = (Total_localGov + Total_stateGov + Total_fedGov),
    perc_AllGov = round((Total_AllGov / Total)*100, 2),
    perc_UnpaidFAm = round((Total_UnpaidFamily / Total)*100, 2),
    perc_ForProfit = round((Total_forprofit / Total)*100, 2),
    perc_NonProfit = round((Total_nonprofit / Total)*100, 2),
    perc_WFH = round((Total_WorkFromHome / Total)*100, 2),  
    perc_Walk = round((Total_Walked / Total)*100, 2),
    perc_PubTrans = round((Total_PublicTransport / Total)*100, 2),
    perc_DroveAlone = round((Total_DroveAlone / Total)*100, 2),
    perc_Carpool = round((Total_Carpooled / Total)*100, 2),
    perc_WFH_AllGov = round(((LocalGov_WFH + StateGov_WFH + FedGov_WFH)/Total_AllGov)*100, 2),
    perc_WFH_ForProfit = round((ForProfit_WFH/Total_forprofit)*100, 2),
    perc_WFH_NonProfit = round((NonProfit_WFH/Total_nonprofit)*100, 2),
    perc_WFH_SelfEmpNotInc = round((SelfEmpNotInc_WFH/Total_selfEmpNotincorp)*100, 2),
    perc_WFH_UnpaidFamily = round((UnpaidFamily_WFH/Total_UnpaidFamily)*100, 2)
    )

# View(MeansofTransport_Comb)
range(MeansofTransport_Comb$perc_WFH)    

# write the file to CSV - only necessary if youo join to shapefile within QGIS
write_csv(MeansofTransport_Comb, "GIS/MeansofTransport_Comb.csv")


# ++++++++++++++++++++++++++

### JOINING SHAPE FILE TO CSV:::::::

# ++++++++++++++++++++++++++


# read in the shape file
geometry_US <- st_read("GIS/cb_2023_us_state_5m/cb_2023_us_state_5m.shp")

geometry_US <- geometry_US[geometry_US$NAME != "Alaska", ]
geometry_US <- geometry_US[geometry_US$NAME != "American Samoa", ]
geometry_US <- geometry_US[geometry_US$NAME != "Hawaii", ]
geometry_US <- geometry_US[geometry_US$NAME != "Guam", ]
geometry_US <- geometry_US[geometry_US$NAME != "United States Virgin Islands", ]
geometry_US <- geometry_US[geometry_US$NAME != "Puerto Rico", ]
geometry_US <- geometry_US[geometry_US$NAME != "Commonwealth of the Northern Mariana Islands", ]

View(geometry_US)

# Make key that we'll join on thee same name and character
geometry_US <- geometry_US %>% mutate(GEOIDFQ = as.character(GEOIDFQ))
MeansofTransport_Comb <- MeansofTransport_Comb %>% mutate(GEOIDFQ = as.character(GEO_ID))

# Join CSV to shapefile on GEOIDFQ
# This duplicates geometry for each year in csv_data
JOIN_MoT_GeoUSstate <- MeansofTransport_Comb %>%
  left_join(geometry_US, by = "GEOIDFQ") %>%
  st_as_sf()  # Convert back to sf object



# Check result
print(JOIN_MoT_GeoUSstate)
View(JOIN_MoT_GeoUSstate)

# export joined data for QGIS
st_write(JOIN_MoT_GeoUSstate, "GIS/JOIN_MoT_GeoUSstate.gpkg", delete_layer = TRUE)


# Shorter version for QGIS2WEB in July 2025 focusing on just WFH:
JOIN_MoT_GeoUSstate_WFH <- JOIN_MoT_GeoUSstate %>% select("State", "Year_Date", "Year", "Total", "perc_WFH")

# export WFH shorter joined data for QGIS
st_write(JOIN_MoT_GeoUSstate_WFH, "GIS/JOIN_MoT_GeoUSstate_WFH.gpkg", delete_layer = TRUE)


## Look to see what type of job is most likely to work from home.
#ggplot()

View(MeansofTransport_Comb)


ggplot(MeansofTransport_Comb, aes(x = State, y = perc_WFH)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Year) +
  labs(title = "Percentage Working Remotely: 2018-2023",
       x = "State", y = "Percentage") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.70, size = 5))


subset(MeansofTransport_Comb, Year == 2021 & perc_WFH > 20)$State


MeansofTransport_Comb %>%
  filter(Year == 2021, perc_WFH > 20) %>%
  pull(State)

14/50
.25*50
