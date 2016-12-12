Overview
Vehicle electrification in California presents an opportunity to address both greenhouse gas reduction from transportation sources (the largest emitter in the state), and operational challenges from increasing variable renewable energy generation in the electricity sector. In 2012, the CA governor issued an executive order setting a state target of 1.5 million zero-emission vehicles on the road by 2025, and ordering the state agencies and stakeholders to work together to integrate electric vehicle charging into the electric grid. In response to the governor’s target, and federal and state vehicle incentives, the sale of plug-in electric vehicles (PEVs) on the road has been increasing and a network of public chargers has been built across the state. However, there are still cost and charging infrastructure barriers that has prevented wider adoption of PEVs. 
My final project is an exploratory analysis of the charging patterns on these public chargers across California in order to investigate their utilization and potential supply/demand mismatch. The analysis can be used to make recommendations on siting future chargers and increased utilization of existing chargers. Using a data set of charging patterns, and the locations and other characteristics of charging stations, I have created a visualization with R and Matlab of the average hourly utilization at each station over a typical weekday and weekend. I have also merged in R the charging data with data on vehicle sales, environmental impacts, and demographic characteristics to illustrate trends in electric vehicle purchases and match purchase data with charger location data and utilization rate. Lastly, I used QGIS to overlay shapefiles of California’s highway system to assess the proximity of chargers to highways, and if proximity to a highway influences the average utilization of the chargers. 
Software dependencies:
1. R, version 3.3.1
2. Matlab, version 2015b
3. QGIS
Data
1. CA_per_cap_income.csv: Contains Census data on per capita income by county for California: http://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml
2. CA_pop_county: Contains Census data on population by county for California: http://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml
3. CalEnviroScreen_2.0_2014: Contains data from Office of Environmental Health Hazard Assessment (OEHHA), on behalf of the California Environmental Protection Agency (CalEPA) on pollution burden in the state by census track. Data dictionary and data available here: https://data.ca.gov/dataset/calenviroscreen-20
4. CaliforniaCounty.shp: Shapefile of California county boundaries.
5. tl_2013_06_prisecroads.shp: Shapefile of California highways, from CalTrans open data.
6. CVRPStats: Data on rebates for California alternative fuel vehicles since 2010, available here: https://cleanvehiclerebate.org/eng/rebate-statistics
7. Decisionfactors: Data on the decision factors incluencing purchases of electric vehicles, according to survey by the Center for Sustainable Energy, available here: https://energycenter.org/civicrm/event/info?reset=1&ccse-menu=cvrp&id=1645
8. Charging data and charging station data is a proprietary data set.

Code
1. Final Project (file 1): Collects data from census on demographics, Cal EPA on environmental impact, CVRP on vehicle sales, Center for Sustainable Energy on purchase decisions, and cleaned proprietary charging data (cleaning is done in a separate file, not included to protect data privacy). Merges the data, conducts descriptive analysis of the data, producing the visualizations and plots in the presentation. Outputs data tables to be read into Matlab for animation. 
2. Final Project- matlab (file 2): Loads data from file 1, maps charging utilization percents and compiles plots into a visualization .GIF file. 
3. Maps of overall utilization rate (file 3): Loads data from file 1, and shapefile of highways in CA, and creates 1 km buffer around highways. Plots charging stations within and outside buffer and the utilization rate on average at those locations.

Presentation
1. BEVs_income_traffic
2. Charging_usage_v_BEVs
3. Plugs per BEV
4. Total_BEVs_byCounty
5. TotalBEV_sales
6. Workplace_publiccharging

