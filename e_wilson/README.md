Overview

   This repo contains code and data to analyze relative importance of predictors of mortgage success in random forests applied at the census tract level. The aim is to understand which variables best predict the probability that an individual will move to a given area of a given metropolitan zone. This script analyzes data from the San Francisco Bay Area, for random forests that are restricted to race-neutral data and for random forests that are allowed to use race as a predictor.
   
   The R Notebook, hmda_model.Rmd, cleans the data to a practicable set of variables and census tracts, and then uses a set of functions generalized at the census tract level to: 1) remove or impute missing data for each census tract; 2) estimate a random forest for each census tract; and 3) return a vector of the five most important variables in the random forest, in terms of average decrease in residual mean squared error. Finally, the script creates visualizations of the frequency with which each predictor appears in the top five acrosss all census tracts.

Dependencies

   This script requires:
   
   - RStudio v. 1.0.44 (for R Notebook support)
   
   - R v. 3.3.1 ("Bug in Your Hair")
   
   - The following packages: tidyverse (v. 1.0.0) and randomForest (v. 4.6-12)

Data

   The data files used in this project include the following:
   
   - bay_hmda_lar_all_12_15.csv: a comma separated values file containing all of the records from the Home Mortgage Disclosure Act Loan Application Register (HMDA LAR) from 2012 to 2015, filtered for purchase loans with applicable lien status and for records within the nine counties in the San Francisco Bay area. Available at http://www.consumerfinance.gov/data-research/hmda/explore. NOTE: GITHUB DOES NOT ALLOW ME TO UPLOAD MY EXACT FILE, AS IT IS TOO LARGE. However, the CFPB's HMDA portal allows you to replicate the exact filters for any dataset pull and share them. If you go to this URL, you can download my exact data file: http://www.consumerfinance.gov/data-research/hmda/explore#!/as_of_year=2015,2014,2013,2012&state_code-1=6&county_code-1=001,013,041,055,075,081,085,095,097&owner_occupancy=1&loan_purpose=1&lien_status=1,2,3&section=filters
   
   - state_ct_fips.csv: a comma separated values file containing the relationships between the various census tracts and their county fips codes (used in the script to distinguish between seemingly duplicated census tract numbers). Available at www.schooldata.com/pdfs/US_FIPS_Codes.xls (link will automatically download an XLS file.)
   
Results

   The following files depict results from the analysis.
   
   - bay1215rn.png: a PNG file of the variable importance frequency plot for the race-neutral random forests
   
   - bay1215rinc.png: a PNG file of the variable importance frequency plot for the random forests that were allowed to use race
   
Additional Information and Warnings

This script should apply the appropriate filters to any flat HMDA LAR file from 2012 to 2015. Before 2012, HMDA used definitions of census tracts from the 2000 census. This script does not relate those census tracts to the 2010 census tracts they now fall under. As a result, the user should take caution when applying this script to anything before 2012. Users may also find it expedient to apply the filters on the HMDA website to narrow down the size of the dataset before loading it into R.

Also, this script takes approximately 30 minutes to run on an initial dataset of approximately 400,000 entries. Timing will vary depending on the amount of missing data to impute, the extent to which raw entries get filtered out in the cleaning process, and user specifications of parameters.
   
   
