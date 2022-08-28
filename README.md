### A Study on Temperature and Pressure Variation in Major Cities of India
Team 3: 20BDA11, 20BDA24, 20BDA30, 20BDA56 
India is known as the land of seasons. There exist five major seasons in India summer, monsoon, autumn, winter, and spring. Generally, ever changing Indian weather is driven by Asiatic Monsoon system and Himalayas and Thar desert play a vital role to influence it. In India you will experience a diversity of weather conditions ranging from tropical wet to tropical dry and subtropical humid to montane with a huge variation. 
In this study we are mainly concentrating on eight major cities of India and trying to find its changes in temperature with last five year of data. Linear regression is a method very well known for its forecasting future. Due to the drastic climatic variations studied over the earth and the changes of the sun we expect an increase of surface temperature on earth. 
The pressure is a parameter that usually change along with temperature so what is the correlation between these two parameters are more evident.  
ABOUT THE DATASETS
 
We are trying to find the temperature variation of major cities of India in the year 2015 to 2019. The parameters of our data are listed in table 1.
The data was extracted with the help of worldweatheronline.com API and the wwo_hist package. The datasets contain hourly weather data from 01-01-2009 to 01-01-2020. The data of each city is for more than 10 years. This data was used to visualize the change in data.
About worldweatheronline.com:
World Weather Online provides global weather forecast and weather content for websites, businesses, and the travel industry. They have a passion for the weather, climate and the environment and want to share what they love with as many people as they can in a practical way. 
They cover approximately 3 million cities/towns worldwide and their weather forecast is trusted and used by a wide variety of companies and organisations from SME's to large corporate clients.
They currently operate two high-tech weather data centres; one situated in Denmark and the other in Germany. They also have dedicated team members working in the UK, USA, and India to make sure that their information stays as current as possible and delivers the best possible service to all their users. 


## The dataset we have used had 23 parameters from which we had reuced to 16 parameters:

# The selected parameters are listed below:
sunHour	The available sun hours 
uvIndex	Intensity of uv radiation
Moon_illumination 	Intensity of moon light 
DewPoint	Dew Point is the temperature at which air is saturated with water and condensation begins. The higher the dew point rises, the greater the amount of moisture in the air. 
FeelsLikeC	feels like’ temperature considers wind speeds and humidity to assess how the human body feels temperature.
HeatIndex	The combination of air temperature and relative humidity 
WindChillC	The lowering factor of atmospheric temperature due to flow of wind
WindGustKmph	A wind gust generally last under 20 seconds. The longer that gust lasts, the longer it exerts force on an object, and the higher the potential to cause damage.
Cloud cover	The percentage of cloud covered in the sky, if cloud-cover = 0% implies zero visibility
humidity	The quality of water vapour in the atmosphere
precipMM	precipitation is any product of the condensation of atmospheric water vapor that falls under gravity from clouds
pressure	Mass of the air over the location of consideration
tempC	Temperature is a physical quantity that describes heat and cold and is proportional to the average kinetic energy of a mass. 
visibility	Meteorological visibility refers to transparency of air: in dark, meteorological visibility is still the same as in daylight for the same air.
WinddirDegree	 Wind direction is defined as the direction the wind is coming from.
windspeedKmph	A sustained wind is defined as the average wind speed over two minutes.

METHODS USED: 
LINEAR REGRESSION
 
Linear regression is frequently used in various types of predictive analysis. The overall idea of regression is to examine two things:
1. Does the set of predictor variable do a good job in predicting outcome variable? 
2. What are the variables that are significant predictors of the outcome variable, and how do they - indicated by the magnitude and sign of the beta estimates - impact the outcome variable? 
These regression estimates are used to explain the relationship between one dependent variable and one or more independent variable. The simplest form of the regression equation with one dependent and one independent variable is defined by formula:
y= c +b*x
where, y→estimated dependent variable score,
c→constant,
b→ regression coefficient and
x→score of the independent variable. (statistical solutions, 2013)

Naming the variables. There are many names for a regression’s dependent variable. It may be called an outcome variable, criterion variable, endogenous variable or regrassand. The independent variable van be called exogeneous variables, predictor variables or regressors.
Three major use of regression analytics are:
	Determining strength pf predictors.
The regression would be used to identify the strength of the effect that the independent variable has on a dependent variable. (e.g. strength of the relationship between age and income.)
	Forecasting an effect.
It can be used to forecast the effects of impact of changes, i.e. the regression analysis helps us to understand how much the dependent variable changes with a change in one or more independent variables. (e.g. how much additional sales income do I get for each additional $1000 spent on marketing?)
	Trend forecasting.
Regression analysis predicts trends and future values. The regression analysis can be used to get point estimates. (e.g. what will be the price of gold in 6 months?)
 
MULTIPLELINEAR REGRESSION
 
Multiple linear regression attempts to model the relationship between two or more explanatory variables and a response variable by fitting a linear equation to observed data. Every value of the independent variable x is associated with a value of the dependent variable y. 
The population regression line for p explanatory variables x1, x2, ..., xp is defined to be: 

μ_y= β_0+β_1 x_1+β_2 x_2+...+β_p x_p  

This line describes how the mean response μ_y changes with the explanatory variables. The observed values for y vary about their means μ_y and are assumed to have the same standard deviation σ. The fitted values b0, b1, ..., bp estimate the parameters β_0,β_1+...+β_p of the population regression line.
Since the observed values for y vary about their means μ_y , the multiple regression model includes a term for this variation. 
In words, the model is expressed as DATA = FIT + RESIDUAL, 
where the "FIT" term represents the expression β_0+β_1 x_1+β_2 x_2+...+β_p x_p . 
The "RESIDUAL" term represents the deviations of the observed values y from their means μ_y, which are normally distributed with mean 0 and variance σ. The notation for the model deviations is ε.

Formally, the model for multiple linear regression, given n observations, is:

yi = β_0+β_1 x_i1+β_2 x_i2+...+β_p x_ip  + ε_i    for i = 1,2, ... n.

 
T TEST
 
T-test is a hypothesis-testing technique where you are testing the significance of two or more groups and determining the important differences between these groups. It is a variation of inferential statistics and is mainly used with datasets that have a normal distribution, but unidentified variances. In hypothesis testing, the t-value is a type of test statistic that is derived from your sample, allowing you to compare your sample with a null hypothesis, or a hypothesis where there’s no strong distinction between selected populations. There are different approaches to t-testing depending on what data is available and the kind of analysis needed, and there are specific data values required to accurately calculate a t-test.
A t-test can best be described as a mathematical method of establishing a problem statement by assuming that the null hypothesis is for two equal means based on samples taken from each of the two datasets. For example, if a sample of employees was taken from department A, and a sample of employees from department B, then the mean and standard deviation can be expected to be matching.
Based on the right statistical formula, specific values can be measured and compared to standard values, which lets the statistician or data scientist either accept or dismiss the assumed null hypothesis. Sometimes the test statistic is very extreme, which means that you can reject the null because your data simply is not compatible with your null hypothesis. In the instance where the null hypothesis is dismissed, this would indicate that the data outputs are not the result of chance. This type of statistical testing works well for smaller sets of variables and sample sizes, ideally between about 20 or 30, and would not be ideal for more robust sample sizes.
In a T-test, whole samples are distilled into a solitary value, called the t-value. Because t-values are unitless, they can be challenging to interpret without additional context. Therefore t-distributions are used; they provide an assumption that the null hypothesis is true for the sample population and provide a more expansive context so that the uniqueness of the t-value can be determined.
T-tests need three important data values: the standard deviation from each population group, the amount of data values from each group, and the mean difference between the values of the data sets.
Most t-tests follow a statistical formula of t = if the data is represented by Z and s.  This means that t can be determined based on s being the scaling parameter, but Z is usually of a bigger magnitude when an alternative hypothesis is correct. (research optimus, 2015)


 
CORRELATION
 
If the change in one variable appears to be accompanied by a change in the other variable, the two variables are said to be correlated and this inter¬dependence is called correlation or covariation.
In short, the tendency of simultaneous variation between two variables is called correlation or covariation. For example, there may exist a relationship between heights and weights of a group of students, the scores of students in two different subjects are expected to have an interdependence or relationship between them.
In statistics, correlation is a method of determining the correspondence or proportionality between two series of measures (or scores). To put it simply, correlation indicates the relationship of one variable with the other. (m, 2001) 
R AND SHINY
R
R is an open-source programming language that is widely used as a statistical software and data analysis tool. R generally comes with the Command-line interface. R is available across widely used platforms like Windows, Linux, and macOS. Also, the R programming language is the latest cutting-edge tool. 
It was designed by Ross Ihaka and Robert Gentleman at the University of Auckland, New Zealand, and is currently developed by the R Development Core Team. R programming language is an implementation of the S programming language. It also combines with lexical scoping semantics inspired by Scheme. Moreover, the project conceives in 1992, with an initial version released in 1995 and a stable beta version in 2000.
The package is an appropriate way to organize the work and share it with others. Packages in the r language are collection of r functions, compiled code, and sample data. They are stored under a directory called “library” in the er environment. By default, R installs a set of packages during installation.
SHINY AND LIBRARIES
Packages are collections of R functions, data, and compiled code in a well-defined format, created to add specific functionality. There are 10,000+ user contributed packages and growing.
There are a set of standards (or base) packages which are considered part of the R source code and automatically available as part of your R installation. Base packages contain the basic functions that allow R to work and enable standard statistical and graphical functions on datasets; for example, all of the functions that we have been using so far in our examples.
The directories in R where the packages are stored are called the libraries.
Library(shiny): One of the most important packages in r is the r shiny package. Shiny is an r package that makes it easy to build interactive e web apps straight from r. it helps to host standalone apps on a webpage or embed them in r markdown documents or build dashboard. One can also extend shiny apps with CSS themes, HTML widgets and JavaScript’s actions.
Library(ggplot2): ggplot2 is an R package used for statistical computing and data representation using data visualization. It follows underlying graphics called Grammar of Graphics which includes certain rules and independent components which can be used to represent data in various formats. 
Library(plotly): Plotly is a technical computing company headquartered in Montreal, Quebec, that develops online data analytics and visualization tools. Plotly provides online graphing, analytics, and statistics tools for individuals and collaboration, as well as scientific graphing libraries for  R,
Library(plyr): Plyr is a simple, lightweight, accessible and customizable HTML5.
Fresh, bs4Dash, readr,and reshape2 are the other major libraries used for this work. 
SCREEN-SHOTS:
	MainPage:
 
	Homepage:
 

 













	Data Table Page:
 

	Analysis Page:

 

	Info Page:
	 





MUMBAI

The original dataset contained around 26 parameters. Here, in this project we wish to study and analyse the variation of temperature with respect to each of the parameters present in our dataset. Simple Linear Regression had been applied to our data considering tempC as the dependent variable. The Adjusted R-Squared value is significantly less for the Simple Linear Regression Model which suggests that the model does not have a good fit. Therefore, Multiple Linear Regression has been applied and the Adjusted R-Squared Value is 0.8932 which suggests a good fit. The Relative Standard Error is 0.03430593 which states that it is accurate enough. It has been observed that p-value of the regression model is 0.2*10-16, which states it contains highly significant predictors at 5% level of significance. 
 Based on the t-statistics (at 5 % level of significance) and corrplot, the parameters that have been selected for studying and understanding the variation are listed as follows:
	maxTempC- (correlation value: 0.5880154) refers to the maximum temperature recorded. Measured in Degree Celsius.
	minTempC- (correlation value: 0.51059462) refers to the minimum temperature recorded. Measured in Degree Celsius.
	FeelsLikeC- (correlation value:0.94213123) The "feels like" temperature is a measurement of how hot or cold it really feels like outside. The “Feels Like” temperature relies on environmental data including the ambient air temperature, relative humidity, and wind speed to determine how weather conditions feel to bare skin. It is measured in degrees Celsius.
	SunHour- (correlation value:0.23621959) refers to the solar insolation which a particular location would receive if the sun were shining at its maximum value for a certain number of hours. Though the correlation value is less, this parameter has been considered because Mumbai has a tropical climate.
	uvIndex.1-( correlation value:0.77908562) The UV Index represents the amount of skin-damaging UV radiation reaching the earth's surface at any instant of time. The basic UV Index forecast is given for solar noon — the sun's highest point in the sky and the time of the highest fluctuation in UV radiation (under clear sky conditions).
	windDirDegree-( correlation value: 0.48977288) Refers to the direction of the approaching south-west monsoon winds which is the primary cause of rainfall in Mumbai city.  Though the correlation value is less, this parameter has been considered because Mumbai lies on the windward side of the western Ghats. The wind direction degree helps to understand the impact and hence the total amount of precipitation experienced.
	Humidity- (correlation value: -0.25691379) refers to the amount of moisture present in the air. We have expressed humidity in terms of %. Though the correlation value is less, this parameter has been considered because Mumbai has a coastal location. Therefore, the level of humidity is an important factor to understand the variation in temperature.
	HeatIndexC- (correlation value: 0.93937543) The heat index, also known as the apparent temperature, is what the temperature feels like to the human body when relative humidity is combined with the air temperature. It is measured in degrees Celsius.
	WindChillC- (correlation value:0.90480811) A wind chill factor is a measure of the cooling effect of the wind on the temperature of the air.
The coefficient of the above significant predictor variables has been obtained to understand the effect on tempC for per unit change of these parameters. The coefficients of the selected parameters have been listed in a tabular format:

Sr. No	Parameter 	Co-efficient 
1.	maxtempC	0.0406528645
2.	mintempC	0.2862896583
3.	FeelsLikeC	0.6282222378
4.	humidity	 -0.0441454478
5.	uvIndex.1	0.1951959568
6.	HeatIndexC	-0.6724502969
7.	sunHour	0.1555361737
8.	WinddirDegree	0.0016865462
9.	WindChillC	 0.5725203215
 
Therefore, the regression equation can be framed as:
tempC = 9.26 + 0.0407*maxtempC + 0.286*mintempC + 0.629*FeelsLikeC - 0.044*humidity +  0.195*uvIndex.1 - 0.672*HeatIndexC +   0.1555*sunHour  + 0.00168*winddirDegree + 0.57*WindChillC 
We can say that if the maxtempC increases by one degree, the tempC increases by 0.0407 Degrees considering that remaining all the other independent variables are kept constant.
“+” Indicates an increase and “-” Indicates a decrease. 


YEARLY ANALYSIS OF THE PARAMETERS: (using BoxPlot)
	TempC
For all the years 2015-20, the distribution is right-skewed which means the variation is more in the upper 50% of the data as (Q3 - Q2)>(Q2-Q1). Since the temperature has been recorded on an hourly basis for our dataset. Therefore, for a given day if the mean tempC recorded is above the median value, there is more variation in the hourly recorded temperature for that day. The boxplots for the years 2015,2016 and 2017 are significantly thick compared to the others which states enough variation is present and the prediction might not be very accurate. The year 2020 shows the presence of outliers as well. Note: Year 2020 has observation till the month of Jan.
	Humidity: 
For the year 2015, 2017 and 2018 it is left-skewed which means more variation has been observed in the lower 50% of the observation. The years 2016, 2019 and 2020 are right-skewed. As the boxplot for the year 2018 is considerably thin, it states that the variation is less, and it is more consistent compared to the remaining years. Note: Year 2020 has observations only from the month of January.
	 MaxtempC:

No variation has been observed in the maximum temperature that has been recorded over the last four years from 2015-2019.  All the maximum temperatures recorded on an hourly basis for the years are approximately equal to the median value. The year 2020 shows a left-skewed boxplot which means more variation in the lower quartiles has been observed. Note: Year 2020 has observations only from the month of January.
4. MintempC
No variation has been observed in the minimum temperature that has been recorded over the last four years from 2015-2019. All the minimum temperatures recorded on an hourly basis for the years are approximately equal to the median value. The year 2020 shows an uniformly skewed boxplot. Note: Year 2020 has observations only from the month of January

5. FeelsLikeC
We can clearly say that the median FeelsLikeC is varying considerably over the years. All the years except 2015 and 2019 have a right skewed boxplot which means variation is more in the upper 50%  of the observations. The years 2015 and 2019 have a uniformly skewed boxplot.The year 2018 has a very thin boxplot which states the variation is less and it is consistent as opposed to the year 2016 where the variation will be much higher since the boxplot is thicker. Year 2020 shows presence of outliers. Note: Year 2020 has observations only from the month of January.

6. sunHour
The sunHour recorded over the last four years (2015-2020) shows no significant variation. All the observations recorded are approximately equal to the median value. The year 2020 has a left-skewed boxplot which means more variation in the lower 50% of the observation. It also contains an unusually higher number of outliers. Note: Year 2020 has observations only from the month of January.
7. uvIndex.1

All the boxplots are highly left-skewed which means significant variation in the lower 50% of the observation.  The boxplots are highly thick which suggests a high range, enough variation and lack of consistency. The median value of all the years also varies . Note: Year 2020 has observations only from the month of January.
8.  HeatIndexC
The years 2015, 2016, 2017, 2018 and 2020 show a right-skewed box plot suggesting variation is high in the upper 50% of the observation. The boxplot for the year 2019 is uniformly skewed. The boxplot of the year 2020 contains outliers. Boxplot for the year 2015 is comparatively thinner which suggests a low range and better consistency (i.e. less of variation). Note: Year 2020 has observations only from the month of January.
9. winddirDegree
The year 2015, 2018 and 2020 are left-skewed and the years 2016, 2017 and 2019 are right skewed. All the boxplots suggest that over the five years the range of the wind direction(in degrees) is considerably high suggesting lack of consistency and presence of high amount of variation. Note: Year 2020 has observations only from the month of January.
10. WindChillC
The boxplot for the years 2015, 2016, 2017, 2018 and 2019 are right-skewed. The boxplot of the year 2020 though uniformly skewed contains outliers. The boxplot for the 2018 is very thin which suggests less variation and more consistency compared to the other plots. Note: Year 2020 has observations only from the month of January.



RESULTS:
 
	2015
	 Mean maxtempC: 28 ℃
	Mean mintempC: 20 ℃
	Mean sunHour: 11 Hours
	Mean uvIndex.1: 6
	Mean FeelsLikeC: 25.04 ℃
	Mean Humidity: 61.42 %
	Mean HeatIndexC: 26
	Mean winddirDegree: 209.3 °
	Mean WindChillC : 24.62°
2.  2016
	 Mean maxtempC: 32 ℃
	Mean mintempC: 23 ℃
	Mean sunHour: 11 Hours
	Mean uvIndex.1: 4.50
	Mean FeelsLikeC: 32.12℃
	Mean Humidity: 44.12  %
	Mean HeatIndexC: 32.12
	Mean winddirDegree: 163.1°
	Mean WindChillC : 30.83°
 
 
3.  2017
	 Mean maxtempC: 30 ℃
	Mean mintempC: 22 ℃
	Mean sunHour: 11 Hours
	Mean uvIndex.1:4.167
	Mean FeelsLikeC: 31.67℃
	Mean Humidity: 51.92  %
	Mean HeatIndexC:31.67
	Mean winddirDegree: 135.21°
	Mean WindChillC : 29.96°
4.  2018
	 Mean maxtempC: 28 ℃
	Mean mintempC: 22 ℃
	Mean sunHour: 11 Hours
	Mean uvIndex.1: 4.125
	Mean FeelsLikeC: 29.17℃
	Mean Humidity: 52.75 %
	Mean HeatIndexC: 29.17
	Mean winddirDegree: 220.1°
	Mean WindChillC : 27.92°
 

 
5.   2019
	 Mean maxtempC: 32 ℃
	Mean mintempC: 24 ℃
	Mean sunHour: 11 Hours
	Mean uvIndex.1: 4.375
	Mean FeelsLikeC: 28.17℃
	Mean Humidity: 40 %
	Mean HeatIndexC: 28.17
	Mean winddirDegree: 148.0°
	Mean WindChillC : 27.46 °
6.  2020
	 Mean maxtempC: 30.76 ℃
	Mean mintempC: 24.93 ℃
	Mean sunHour: 10.76 Hours
	Mean uvIndex.1: 4.29
	Mean FeelsLikeC: 32.83℃
	Mean Humidity: 66.75 %
	Mean HeatIndexC: 32.89
	Mean winddirDegree: 213.3°
	Mean WindChillC : 29.1°
 

 











PUNE

AVERAGE WEATHER IN PUNE INDIA:

The purposes of this report, the geographical coordinates of Pune are 18.520 deg latitude, 73.855 deg longitude, and 554 m elevation.
In Pune, the wet season is oppressive, windy, and overcast; the dry season is mostly clear; and it is hot year-round. Over the course of the year, the temperature typically varies from 9°C to 36°C.
Pune experiences three seasons: summer, monsoon, and winter. Typical summer months are from mid-March to mid-June. The warmest month in Pune is May. The city often has heavy dusty winds in May, with humidity remaining high. Even during the hottest months, the nights are usually cool due to Pune's high altitude 560 m.
The monsoon lasts from June to October, with moderate rainfall and temperatures ranging from 22 to 28 °C. Most of the 722 mm (28.43 in) of annual rainfall in the city falls between June and September, and July is the wettest month of the year.
For most of December and January the daytime temperature hovers around 26 °C while night temperatures are around below 9 °C. 
Based on the fact of the greatest number of rainless days and with perceived temperatures between 24°C and 35°C, the best time of year to visit Pune for hot-weather activities is from early March to mid-May.
Correlation between the parameters and TempC:
Correlation is a standardized covariance measure that will tell you both the strength and direction of the relationship between two different variables (i.e. as one variable increases in value, does the other variable also increase? as one variable increases in value, does the other variable decrease?) Correlation coefficients can only take on values between -1 and +1. The correlation function should be calculating the correlation of each attribute against every other attribute in your dataset; if you have k numeric attributes in your dataset, then you will have a correlation matrix returned with shape kxk showing the correlation coefficients for each possible pair of attributes. 
Initially, P-value test was considered to identify the significant parameters. But due to the large sample size of the data, 






The function corrplot(), in the package of the same name, creates a graphical display of a correlation matrix, highlighting the most correlated variables in a data table. In this plot, correlation coefficients are colored according to the value. Correlation matrix can be also reordered according to the degree of association between variables.

From the correlation matrix applied to the given data set. We find that with that the most significant parameters are the FeelsLikeC, HeatIndexC and WindChillC. All of which have a very strong positive relationship with tempC.
	FeelsLikeC: It is the temperature considering wind speeds and humidity to assess how the human body feels temperature. Correlation value: 0.98973017
	HeatIndexC: It is the temperature that is felt by the human body when relative humidity is combined with the air temperature. Correlation value: 0.98576327
	WindChillC: It is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Correlation value: 0.97453891
	UVIndexMax and UVIndexMin: It is the intensity of UV radiation. 
Correlation values: 0.89966364 and 0.85727290, respectively.
	SunHour: The available sun hours. Correlation values: 0.77508902
	Humidity: Here the relative humidity is expressed as a percent. Pune experiences extreme seasonal variation in the perceived humidity. Correlation value: -0.58304699
	WinddirDegree: Wind direction is defined as the direction the wind is coming from. 
Correlation value: 0.40505048 Though the correlation value is low, the direction and speed of wind and contribute towards the monsoons in Pune. 

An Overall yearly analysis
Temperature:
 
Year 2015:
The highest maximum temperature at monthly average was in May at 37.2℃, while the lowest minimum temperature at monthly average was in January 15℃. But the Feels like temperature was almost consistent throughout the year at around 26.5°C. 
Year 2016:
The highest maximum temperature at monthly average was in April at 38℃, while the lowest minimum temperature at a monthly average was in January 15℃. But the Feels like temperature was the highest at around 31°C during the month of May. 
Year 2017:
The highest maximum temperature at monthly average was in April at 38℃, while the lowest minimum temperature at a monthly average was in January 14.6℃. But the Feels like temperature was the highest at around 31.3°C during the month of May

Year 2018:
The highest maximum temperature at monthly average was in May at 37℃, while the lowest minimum temperature at a monthly average was in December 16.7℃. But the Feels like temperature was the highest at around 31.9°C during the month of May. 
Year 2019:
The highest maximum temperature at monthly average was in April at 38.8℃, while the lowest minimum temperature at a monthly average was in December 19.2℃. But the Feels like temperature was the highest at around 32.7°C during the month of May. 

Sun Hour:
 

Year 2015:
The most amount of sun light was during the month of May, with a monthly average of 12.5 hours. The UV index was of maximum value during the summer months of April-May. 
Year 2016:
The most amount of sun light was during the month of May, with a monthly average of 12.2 hours. The UV index was of maximum value during the summer months of April-May. 
Year 2017:
The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of May-June. 
Year 2018:
The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of March-May. 
Year 2019:
The most amount of sun light was during the month of May, with a monthly average of 12.4 hours. The UV index was of maximum value during the summer months of March-May. 
Rainfall:

 

Year 2015:
The rainfall was the highest during the month of June with the average of 0.182mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 81.8%, the average dew point was a highest during the months of June to September at 20.5°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010mb. 
Year 2016:
The rainfall was the highest during the month of July with the average of 0.172mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 87.4%, the average dew point was the highest during the months of June to September at 20.8°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010.3mb. 
Year 2017:
The rainfall was the highest during the month of June with the average of 0.201mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 87.4%, the average dew point was the highest during the months of June to September at 20.7°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010.1mb.
Year 2018:
The rainfall was the highest during the month of June with the average of 0.215mm, the relative humidity was the highest during the months of July and August at a combined monthly average of 83.7%, the average dew point was the highest during the months of June to September at 20.3°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1010mb. 
Year 2019:
The rainfall was the highest during the month of October with the average of 0.69mm, the relative humidity was the highest during the months of July-October at a combined monthly average of 83%, the average dew point was the highest during the months of June to October at 20.8°C, all of which are consistent with the  monsoon months. The pressure was consistent throughout the year at around 1009.8mb.

WindChillC
 
Year 2015:
The wind speed was the highest during the month of July with the monthly average of 17.3 Kmph.
Year 2016:
The wind speed was the highest during the month of July with the monthly average of 14 Kmph.
Year 2017:
The wind speed was the highest during the month of July with the monthly average of 17.9 Kmph.
Year 2018:
The wind speed was the highest during the month of July with the monthly average of 20.7 Kmph.
Year 2019:
The wind speed was the highest during the month of August with the monthly average of 18.6 Kmph.
 






JAIPUR
Jaipur is the capital and largest city of Rajasthan, India. It has a monsoon influenced hot semi-arid climate with long extremely hot summers and short, mild warm winters. It is in the east border of Thar Desert which is the only desert of India. In western direction it shares a common international boundary of mesmerizing and mysterious desert with Pakistan. Jaipur is situated at an altitude of 431 meters (1417 feet) above the sea level and it is enclosed by Aravalli hills on form three sides. 
While comparing the Jaipur tempC with other parameters we have found that wind gust and visibility does not affect the change of temperature over 10 year. But maxtempC, mintempC, uvindex, feelslikeC, heatindexC and windchillC are highly positively correlated whereas pressure and humidity are negatively correlated. After 5 year of time period, the temperature of the Jaipur city has a increase in its value.

Correlation of tempC and other parameters:
Simple Linear Regression had been applied to our data considering tempC as the dependent variable. The Adjusted R-Squared value is significantly less for the Simple Linear Regression Model which suggests that the model does not have a good fit. Therefore, Multiple Linear Regression has been applied and the Adjusted R-Squared Value is 0.9885 which suggests a good fit. The Relative Standard Error is 0.01091 which states that it is accurate enough. It has been observed that p-value of the regression model is 0.2*10-16, which states it contains highly significant predictors at 5% level of significance. 
 Based on the t-statistics (at 5 % level of significance) and correlation plot, the parameters that have been selected for studying and understanding the variation are listed as follows:

windchilC: It is the temperature that the environment feels like due to wind speed. The greater the wind speed, the colder the environment feels. Correlation value:0.879
sunHour: the time in which solar radiation available. Correlation values:0.9231
uvindex: the factor describing the intensity of uv radiation. Correlation value:0.874
humidity: the amount of water content in the atmosphere. Correlation value is -0.571


  
2015:
In the year 2015 the maximum temperature recorded in the month of May 42.89-degree Celsius and the minimum reported in the month of January 21.32 degree Celsius. even though it reported a temp of 42degree Celsius the feel like temperature was in the entire year was 28 degree Celsius. Throughout the year pressure showed a constant value of 1010. The rainfall was highest during the month of July 220.8mm.
2016:
The highest temperature reported in the month of May 43 degree Celsius and min temperature reports in the month of January which was 18 degree Celsius. The average moon illumination was much lower than all other years but the value of uv index has got a increase by 0.1. in the year 2016 the average feel like temperature was reported as29.8-degree Celsius. The clod cover in the sky reduced and also the humidity reduced. Which in turn result in the increase of the temperature value.
2017:
The maximum of the year 2017 reported in the month of may and august which was greater than 40 degree Celsius. The minimum temperature reported in the month of December which was 20 degree Celsius. The average cloud cover shows a significant reduction and the humidity also reduces, which increase the temperature on the earth surface. The highest rainfall reported in the month of august which was 268mm. but the pressure was remain a constant 1009 throughout the year. 
2018:
The average maximum temperature has a drop when compared with the other maximum temperature. The minimum temperature obtained in the month of January and maximum temperature reported on may. The uv index values increased and the visibility factor is reducing by a .002 value. The most of the rain reported in the month of august 280.4mm. humidity value also increased during the year of 2018. The pressure was a constant 1010.
2019:
The highest maximum temperature at monthly average was in august at 42 degree Celsius, while the lowest minimum temperature at a monthly average was in December 14 degree Celsius. But the Feels like temperature was the highest at around 32 during the month of May. The rainfall was the highest during the month of June with the average of 215mm.

Form the above observations we can conclude that most of days in Jaipur is sunny and only the month of July and august show a little bit variation. The maximum temperature experienced by Jaipur in the month of May and June greater than 40 degree Celsius whereas January and December have a temperature less than 15 degree Celsius. During the month of September precipitation is taking a value greater than 100mm even though most of the days in a year are dry. The wind has the highest speed during the month of June greater than 28km/h. the monsoon creates a steady strong wind from the December to April and calm wind from June to October.
 
CONCLUSION:
Analysing all the above cities together we are reaching to a conclusion that the temperature during the past five years neither increased or reduced. Instead over time we observed that the temperature was fluctuating but the value of uv index was showing a significant increase in the value.
Using Shiny we have made a dashboard where a user can see and compare for themselves the way the different parameters change, not only with respect to temperature alone but with other parameters if so needed. In this analysis Shiny was a great tool for generating graphs, it aided in the analysis of the data and the final output of the generated graphs reduced the effort of coding and allowed us to spend a significant amount time to study its observation.
