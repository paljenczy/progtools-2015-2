* PRACTICE EXAMPLES AFTER SESSION 1
*-----------------------------------
* Programming Tools, CEU, Winter 2015


* TASK 1: Calculate age from birthdays
*--------------------------------------
/* Use birthdays.dta which has three variables: year, month, day
   defining the birthdays of different persons. Calculate their ages in two
   ways: (1) from the year variable alone, (2) defining a day-level date,
   calculate the days each person lived, and divide by 365 to get their age.
   Compare the distribution of the two age variables to see the difference
   (use histograms, possibly overlaid to each other). */


* TASK 2: Analyze auto-prices
*-----------------------------
/* Plot a scatter of number-of-cars-by-maker versus
   deviation-from-maker-specific-mean. Label the points with the maker.
   (Hint: First you need to generate number of cars and average price by the
   generated maker variable using the egen command. Then you should
   calculate the deviation of price from its make-specific-average which was
   previously generated. Look at the help of scatter how to use marker labels.
   Check whether your graph is OK - e.g. you should not see any price deviation
   for makers with only one model; for makers with two models the deviation from
   the mean should be symmetric.) */
