
* CREATE EXPORT-IMPORT PANEL FROM DIFFERENT YEARS
*-------------------------------------------------
* Example do file for Programming Tools, CEU, Winter 2015

* Load first year data from textfile and save as Stata data file
insheet using ../data/trade/2003.csv
save ../data/trade_all_years.dta, replace

* Loop: read in data from textfile, append to the existing common file and replace
forvalues year = 2004/2013 {
    insheet using ../data/trade/`year'.csv, clear
    append using ../data/trade_all_years.dta
    save ../data/trade_all_years.dta, replace
}

