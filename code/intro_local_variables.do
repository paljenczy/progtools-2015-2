
* INTRODUCTION TO VARIABLES
*---------------------------
* Example do file for Programming Tools, CEU, Winter 2014

sysuse auto

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

