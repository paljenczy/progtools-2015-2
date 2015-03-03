* ILLUSTRATE FOREACH
*--------------------
* Example do file for Programming Tools, CEU, Winter 2015

sysuse auto, clear

* Use foreach with varlist
foreach var of varlist mpg headroom weight turn {
    regress price `var'
}


* Gen logarithms
local controls mpg headroom weight turn
foreach var of varlist `controls' {
    gen l`var' = log(`var')
}


* Foreach with graph export and estout
foreach var of varlist mpg - turn {
    scatter price `var'
    graph export ../results/scatter_price_`var'.png
    eststo: reg price `var', robust
}
esttab using ../results/regressions.rtf, se label
esttab, se label
/* esttab has lots of other commands (like how to report results on dummies,
    how many digits to report, etc.). It is worth to see the examples provided
    on http://repec.org/bocode/e/estout/esttab.html */
