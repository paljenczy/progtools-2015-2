* PRACTICE EXAMPLES AFTER SESSION 2
*-----------------------------------
* Programming Tools, CEU, Winter 2015

set more off

* TASK 1: sum of first 1000 even numbers
*--------------------------------------
* Write a for loop which counts the sum of the first 1000 even numbers.
foreach i of numlist 0(2)1000 {
    local sum2 = `sum2' + `i'
}

display `sum2'

* TASK 2: Analysis of the aggregated panel data
*-----------------------------------------------
/* Let us begin with the aggregated trade data (which consists of all years
   from 2003 to 2013) set as panel. Create a new variable which shows how many
   observations do you have for each country (hint: use egen with count method).
   Keep only those countries which have exports and (general) imports data for
   each year, that is balance your panel. Run a regression of the differences in
   log of exports on the differences in log of imports (create the
   log-differences by using foreach and time series operator. Run the same
   regression only for years between 2008-2012 (that for log changes between
   2008-09, 2009-10, 2010-11, 2011-12. Return the results in a nicely formatted
   table. */

use ../data/trade_all_years.dta

* Clean data types
* (exports and imports are stored as strings whereas they should be numbers)
local variable_list exports - consumptionimports
foreach var of varlist `variable_list' {
    destring `var', force replace
}

* Structure as panel
encode countryname, gen(country) /* string variable not allowed for xtset */
* You may check how encode works
tabulate country /* you are going to see the labels, ie. the names of the countries */
tabulate country, nolabel /* option nolabel reveals that the values of the variable are numbers */
xtset country year

* Describe pattern
xtdescribe

* Number of observations within country
foreach var of varlist `variable_list' {
    egen nobs_`var' = count(`var'), by(country)
}

* Balance the panel
foreach var of varlist exports generalimports {
   drop if nobs_`var' < 11
   gen l_`var' = log(`var')
   gen dl_`var' = D.l_`var'
}

eststo: reg dl_exports dl_generalimports
eststo: reg dl_exports dl_generalimports if year > 2008 & year < 2013
esttab, se label
