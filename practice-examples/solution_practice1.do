* SOLUTION FOR PRACTICE EXAMPLES 1
*----------------------------------
* Programming Tools, CEU, Winter 2015

* TASK 1: Calculate ages from birthdays
*---------------------------------------
use ../data/birthdays, clear
/* you may use the command use13 in Stata12 to open Stata13 dta file */

gen age_year = 2015 - year
gen birthday = mdy(month, day, year)
gen age = (date("11/01/2015", "DMY") - birthday) / 365

* Compare the two
/* Note the handling of options: fcolor and lcolor are options for the second
   histogram (help hist and searching for barlook options reveals how you can
   control the bars), whereas legend option refers to the whole graph object,
   which is the twoway (help twoway to see the syntax for these types of graphs)
   */
twoway (hist age_year) (hist age, fcolor(none) lcolor(maroon)), ///
    legend(order(1 "Age in years" 2 "Age in days"))


* TASK 2: Analyse autos
*-----------------------
sysuse auto, clear

gen shortmake = word(make, 1)
egen num_cars = count(price), by(shortmake)
egen avg_price = mean(price), by(shortmake)
gen dev_price = price - avg_price

scatter dev_price num_cars, mlabel(shortmake)

