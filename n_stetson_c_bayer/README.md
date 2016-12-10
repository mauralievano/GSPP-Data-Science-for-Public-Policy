**Contributors:**

Nancy Stetson

Cassandra Bayer

**Overview:**

This is a final project for the UC Berkeley Fall 2016 classes Urban Infomatics and Data Science in Public Policy. For this project we explore the trade-offs between rents and commutes in the Bay Area of California. We use three main sources of data. The first is a dataset of craigslist postings collected by the [Urban Analytics Lab](http://ual.berkeley.edu/) in 2014 (primary contract: [Geoff Beoing](http://geoffboeing.com/)). We combined these listings with commute data, using a simulated dataset of commute destinations from the [Metropolitan Transportation Committee](http://mtc.ca.gov/). To find commute times, we made requests from the [Google Directions API](https://developers.google.com/maps/documentation/directions/).

The bulk of this project was organizing and aggregating the commute destinations into a meaningful dataset and applying those findings to the rent data. There were two resulting datasets: one which had observations of small geographic zones with average commutes and median rents, and another which had observations of rental listings that included the same information. The first we used to map the Bay Area to show which areas are more or less expensive to live when both rent and commutes are taken into account. The second dataset was used to regress commutes on rents to assess whether there is a cost of commuting that is revealed through the variation of rents in varying levels of accessibility to economic centers. 

We find that there are small pockets of low rent, low commute neighborhoods. We estimate a time cost of commuting of approximately $20 per additional one way minute per month. Using regression, the commute cost appears to be higher, around $40 per minute per month, however the results were not conclusive and unstable depending on covariates. 

**Software:**

Python, version 2.7, Anaconda distribution

Jupyter Notebooks, [Project Jupyter ](http://jupyter.org/)

R, version 3.3.1

Rstudio

[Carto.com](http://carto.com)

**Code:**

**(01)clean_rent_data.Rmd**

	Removes listings without latitude and longitude.

**(02) Zones_and_SuperDistricts.ipynb**

Spatially merges the zone and super district shapefiles with the rental data (*rents_indexed.csv*) to mark which rental listing is in which zone and super district (creates *rentals_with_tazIDs.csv*). Creates variables for the centroids of these shapes. Also creates a key to use later that shows which zone is in which district (*zone_district_key.csv*). 

**(03)weighted_centroids.rmd**

Short code to add find centroids of zones and districts weighted by the rental listings within them, in order to find relatively reasonable locations for commute destinations. 

**(04)zone_to_super.csv**

Rearranges the MTC *wsLocResults.csv* file to find the number of commuters from each zone to each super district. Creates dataset *zone_to_super.csv,* which has one line for each zone and a variable for each super district. Values represent the number of commuters taking that route. 

**(05)find_commute_times.rmd**

Sends requests to Google Directions API, using package *gmapsdistance*, and receives commute times between centroids of super districts and zones. Saves these times in* commute_times.csv*.

**(06)merge_commute_rent.rmd**

Uses *rentals_with_tazIDs.csv *and *commute_times.csv*. First loads in rentals and does some minor cleaning. Loads in commutes and creates an average driving time variable. Groups home zones together and takes a weighted mean of average commutes from those locations. Constructs the "cost of commuting’ variable with a [median earnings of an individual in the Bay Area.](https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_14_5YR_S2001&prodType=table) Weights transit and driving commutes by[ proportion in Bay](http://www.ppic.org/main/publication_show.asp?i=1204) which take these forms of transportation. Creates an index that combines commute costs and rent costs. Creates a dataset for illustration of method (*taz_to_super_illustration.csv). *Runs regressions.

**(07)Lines.ipynb**

Creates a geodatset (*geo_zone_lines.csv)* for Carto (slide 4 in presentation)*.*

**(08)Taz Merge.ipynb**

Creates a new shapefile (*MergedZoneShp*) that adds the new attributes (commute time, median rent, time cost of commuting, etc) to the original zone shapefile. Used in maps in slides 6, 8 and 9.

**(09)Histograms.ipynb**

	Creates histograms for slide 6 in presentation.

**(10)Presentation.Rmd**

	Presentation of results. 

**Data:**

Shapefiles

* **Original zone shapefile** (OriginalZoneShp folder)

    * Source: [MTC](http://opendata.mtc.ca.gov/datasets/73d290f78ae34aac9c1b4fa469330cf1_13)

    * Contains: Shapefile of 1454 Transportation Access Zones (zones)

* **Super District shapefile** (SuperShp folder)

    * Source: [NYU Spatial Data Repository](https://geo.nyu.edu/catalog/stanford-sn432sp4756)

    * Contains: Shapefile of 34 MTC Super Districts

* **Merged zone shapefile** (MergedZoneShp folder)

    * Contains: Original zone shapefile merged with commute and rent data

Datasets

* **sfbay.csv **

    * Original data from Urban Analytics Lab/Geoff Beoing

* **Rents_indexed.csv**

    * Cleaned data of rental listings from the bay

* **superD_Wcentroids.csv**

    * Weighted centroids of super districts

* **zone_Wcentroids.csv**

    * Weighted centroids of zones

* **zone_district_key.csv**

    * Two variable file with zone and district ids for identifying which zones are in which districts

* **rentals_with_tazIDs.csv**

    * Rental listings with MTC zones added

* **wsLocResults_3.csv**

    * Simulated commute data from MTC

    * 3 million lines of individual level data with home and commute destination zones

    * [Source](https://mtcdrive.app.box.com/v/2015-03-116)

* **zone_to_super.csv**

    * Commute counts aggregated to zone level

* **commute_times.csv**

    * Commute times by home zone and super district destination

* **rents_with_commutes.csv**

    * Rental listings merged with average commute times from zones

* **rents_and_commutes_by_taz.csv**

    * Zones with median rent and commute time, along with an index of both

* **taz_to_super_illustration.csv**

    * Dataset to create line shapefile for illustration of method

    * **geo_district_lines.csv** contains the same information but is read as a line shapefile

* **ZillowRentAffordability.csv**

    * Affordability of rent across the country

    * [Source](http://www.zillow.com/research/data/)

        * "Mortgage Affordability, Rental Affordability, Price-to-Income Ratio"

