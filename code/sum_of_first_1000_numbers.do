* SUM OF FIRST 1000 NUMBERS
*---------------------------
* Example do file for Programming Tools, CEU, Winter 2015

foreach i of numlist 1/1000 {
    local sum = `sum' + `i'
}

display `sum'


