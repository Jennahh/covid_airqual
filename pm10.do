**Estimating the causal effect of COVID-19 Lockdowns on Changes in Air Quality**


**PM210 Code File for Final Paper 14.33 Fall 2020
**Code written by Jennah Haque, jhaque@Mit.edu



******************************
** Useful packages to install
******************************
ssc install unique
ssc install fre
ssc install binscatter
ssc install estout, replace
ssc install eventdd, replace
ssc install matsort
**************************
** Setting up your dofile
**************************

clear all
set more off

// Change this to your path
cd "/Users/jennahhaque/Desktop/senior year/14.33/datasets for 14.33 final paper"


**********************
** Loading your data
**********************


*Loading lockdown and airqual csv file*
import delimited "lockdown_3_pm10.csv"



// saving dta file
save "lockdown_3_pm10.dta", replace


**********************
** Analyzing the data
**********************	
	
	 **generate country fixed effects**
	 tabulate country, generate(country_)
	 
	 
	 ***fixed effects for days since lockdown**
	 tabulate day_since_lckdwn, generate (day_since_lckdwn_)
	 
	 **time fixed effects
	 generate chng_pm = pm10_20-pm10_19
	 
	 
	**EQN 1: Basic regression, no controls, cluster standard errors at the country level**
	reg chng_pm day_since_lckdwn_*, cluster(country)
	
	**EQN 2: Basic regression, country fixed effects, time fixed effects, cluster standard errors at the country level**
	reg chng_pm day_since_lckdwn_* country_*, cluster(country)
	estimates store m1, title(Basic Regression)
	
	
	**EQN 3: Full regression. Country fixed effects, time fixed effects, controls for average death**
	
	reg chng_pm country_* avg_death_day pm10_19 day_since_lckdwn_*, cluster(country)
	estimates store m2, title(Regression with Time Fixed Effects)
	
	
	**EQN 4: PLACEBO REGRESSION. See what would happen if the lockdown happened in 2019.
	**Country fixed effects, time fixed effects, controls for average death**
	
	generate chng_pm_placebo = pm10_19-pm10_18
	
	reg chng_pm_placebo day_since_lckdwn_* country_* avg_death_day pm10_18, cluster(country)
	estimates store m3, title(Placebo Regresison)
	
**panel event figure**
	eventdd chng_pm pm10_19 avg_death_day country_*, timevar(day_since_lckdwn) ci(rcap) cluster(country) accum lags(20) leads(60) graph_op(title("Change in PM10, pre/post COVID-19 Lockdown") ytitle("Change in PM10: 2019-2020")) r
	
	**panel event PLACEBO figure**
	eventdd chng_pm_placebo pm10_18 avg_death_day country_*, timevar(day_since_lckdwn) ci(rcap) cluster(country) accum lags(20) leads(60) graph_op(title("Change in PM10, Placebo Lockdown") ytitle("Change in PM10: 2018-2019")) r
	
	
	
	
	**EQN 5: see how results differ without the US with aggregating 
	
	keep in 1/5124
	
	**full regression
	reg chng_pm country_* avg_death_day pm10_19 day_since_lckdwn_*, cluster(country)
	estimates store m4, title(Regression with Time FE, no USA)
	
	**placebo regression**
	reg chng_pm_placebo day_since_lckdwn_* country_* avg_death_day pm10_18, cluster(country)
	estimates store m5, title(Placebo Regression, no USA)
	
	
	
**********************
**Outputting the data
**********************		
	
	
	**This will make Table 3**
	
	esttab m2 m3 using "table3.tex", keep (country_* avg_death_day pm10_19 day_since_lckdwn_93 day_since_lckdwn_94 day_since_lckdwn_95 day_since_lckdwn_96) cells(b(star fmt (3)) se(par fmt(2))) stats(N r2, labels("N" "R-squared") fmt(0 2)) starlevels( * 0.10 ** 0.05 *** 0.010) replace

	
	
