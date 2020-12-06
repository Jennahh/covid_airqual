**Estimating the causal effect of COVID-19 Lockdowns on Changes in Air Quality**


**Figures 1 File for Final Paper 14.33 Fall 2020
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

*Figure 1a (edit the graphs manually to include axis labels and titles)

line ita_lckdwn kor_lckdwn irn_lckdwn jpn_lckdwn usa_lckdwn day


*Figure 1b (edit the graphs manually to include axis labels and titles)

line gbr_lckdwn rus_lckdwn fra_lckdwn ind_lckdwn per_lckdwn day


*Figure 1c (edit the graphs manually to include axis labels and titles)

line esp_lckdwn deu_lckdwn mex_lckdwn swe_lckdwn chn_lckdwn day



