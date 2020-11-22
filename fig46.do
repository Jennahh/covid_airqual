**Estimating the causal effect of COVID-19 Lockdowns on Changes in Air Quality**


**Figures 4-6 File for Final Paper 14.33 Fall 2020
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


*Loading lockdown and emissions csv file*
import delimited "lockdowns_deathcount.csv"

*Figure 4 (edit the graphs manually to include axis labels and titles)

line ita_death_week kor_death_week irn_death_week jpn_death_week usa_death_week day


*Figure 5 (edit the graphs manually to include axis labels and titles)

line gbr_death_week rus_death_week fra_death_week ind_death_week per_death_week day


*Figure 6 (edit the graphs manually to include axis labels and titles)

line esp_death_week deu_death_week mex_death_week swe_death_week chn_death_week day

