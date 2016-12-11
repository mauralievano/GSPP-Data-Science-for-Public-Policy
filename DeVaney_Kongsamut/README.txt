OVERVIEW

This project uses 2014 data from the Oakland Police Department (OPD) to identify the link between citizen calls for service and police responses.
Analyses were performed in RStudio (R v3.3.1)

For police responses that resulted in an encounter with a citizen and a subsequent search:
	What factors can we use to predict the discovery of firearms?
	What factors can we use to predict the discovery of narcotics?

To answer these questions, we implement the models below for predicting the dependent binary variable of finding firearms (and repeated for narcotics):
	Simple linear regression
	Logistic regression
	LASSO (L1 regularization)
	Ridge (L2 regularization)
	Random Forests

Summary and key results 
The cross-validated prediction models did not perform well on being able to predict the results of a search.
Potential weaknesses in the data, including relatively small numbers of found firearms and found narcotics in the 2014 data, may have reduced the power of our analyses.
These analyses provide a framework for future evaluation of this research question with higher quality data. 


DATA

We merged the below datasets obtained from the City of Oakland's OpenData Portal.
The data share an identifier for Computer-Aided Dispatch (CAD) numbers, and were merged as such.

1. Dispatches_2014.csv - This file contains CAD data for 2014.
	(found here: https://data.oaklandnet.com/Public-Services/PRR-10437/pzvh-xrum/data under the original name: PRR #10437)
	
2. Encounters_Jan_2014_To_May_2015.csv - This file contains police encounters with civilians from January 2014 to May 2015.
	(found here: https://data.oaklandnet.com/Public-Services/Jan-2014-To-May-2015/k7tz-66t7/data under the original name: Jan 2014 To May 2015)
	Note: We subset the data for 2014 only in order to match it to the CAD data	


CODE and PRESENTATION:
(Single file)
 
ioSlides Presentation Final.Rmd
	Read in, merge, and clean OPD dispatch and response data
	Subset data to searches, and separate subsets for finding firearms and for finding narcotics
	Prediction models for finding firearms: linear, logistic, Ridge, LASSO, random forest
	Prediction models for finding narcotics: linear, logistic, Ridge, LASSO, random forest
	Create summary charts
	ioSlides presentation code incorporates results from code above
