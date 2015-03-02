
* INTRODUCTION TO VARIABLES
*---------------------------
* Example do file for Programming Tools, CEU, Winter 2014

sysuse auto

* Check data variables
*----------------------
describe /* lists all variables along with their types */

sum price
replace price = . if price > 10000 /* understand how Stata stores missing values */
sum price
sum mpg if price > 10000 /* missing is handled as infinity - strange feature of Stata */

* Handle strings
browse make
gen shortmake = word(make, 1)

* Useful commands: egen, preserve/restore, collapse
egen avg_price_by_model = mean(price), by(shortmake)

preserve /* saves the current state of dataset so that you can restore later */
collapse price, by(shortmake)
browse /* notice how the dataset was aggregated */
restore

preserve
help collapse /* always look at help for exact syntax */
collapse (p50) price (sd) sd_price=price, by(shortmake)
restore

* Look at dates
insheet using ../data/visits.csv, clear /* use another dataset */

describe

* Format day as Stata-day
gen stata_day = date(day, "DMY")
format stata_day %td

* Format time as Stata-time (needs a day as well)
gen date_string = day + " " + time
gen double stata_time = clock(date_string, "DMYhm")
format stata_time %tc

* Plot
tsset stata_time /* set as time-series, similar to xtset for panel */
tsline visit, xlabel(, angle(45))


* Local variables
*-----------------
sysuse auto, clear

* You may assign a value
local x = 1
display 1
display `x'
display `x' + 1

* Or variable
local depvar price
regress `depvar' mpg

* Or anything else
local condition foreign == 1
regress price mpg if `condition'

* Example why locals are useful
regress price mpg headroom weight turn
regress price mpg headroom weight turn if foreign == 1
regress price mpg headroom weight turn if foreign == 0

/* Defining a local variable from controls makes it
 - easier to type
 - easier to change
 - less prone to errors (change in one regression but not in others)
 */
local controls mpg headroom weight turn
regress price `controls' if foreign == 1
regress price `controls' if foreign == 0
* You can use this principle for common conditions, graph options, etc.

* An undefined local variable is empty
disp `notdefined'
