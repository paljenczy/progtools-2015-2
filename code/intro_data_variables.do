
* INTRODUCTION TO VARIABLES
*---------------------------
* Example do file for Programming Tools, CEU, Winter 2014

sysuse auto

* Check data variables
*----------------------
describe /* lists all variables along with their types and other characteristics */

* Numeric variables
sum price
gen price_sqrt = sqrt(price)
replace price = . if price > 10000 /* understand how Stata stores missing values */
sum price
sum mpg if price > 10000 /* missing is handled as infinity - strange feature of Stata */

* String variables
list make in 1/10
browse make
sum make
gen make_sqrt = sqrt(price)
gen maker = word(make, 1)

* Useful command: egen
egen avg_price_by_model = mean(price), by(shortmake)

* Useful command on the dataset
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
