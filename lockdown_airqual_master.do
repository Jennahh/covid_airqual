**Estimating the causal effect of COVID-19 Lockdowns on Changes in Air Quality**


**Master Code File for Final Paper 14.33 Fall 2020
**Code written by Jennah Haque, jhaque@Mit.edu


**************************
** Setting up your dofile
**************************

clear all
set more off

// Change this to your path
cd "/Users/jennahhaque/Desktop/senior year/14.33/datasets for 14.33 final paper"



******************************
** PM2.5 Code (includes regression table)
******************************


do pm25.do


******************************
** PM10 Code (includes regression table)
******************************

do pm10.do



******************************
** SO2 Code (includes regression table)
******************************


do so2.do


******************************
** O3 Code (includes regression tables and event study figures)
******************************

do o3.do

******************************
** Figures 1 (Lockdown Severity)
******************************

do fig1.do

******************************
** Figures 6 (Death Count)
******************************

do fig4.do




	
	
	
	 

	



