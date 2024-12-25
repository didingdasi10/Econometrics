// Stata lab 6
// Wednesday 2-Oct-2024

set more off
bcuse wage2
br

// Cross-tabulating a discrete and continuous variable

tab black, sum(educ) //summarizing education (continuous) with black (dummy variable)

tab black educ //gives an output as limited values 
tab black wage //gives error of too many values as wage is continuous

tab black, sum(wage) 

xtile wageq = wage, nq(5)
//quantiles made after rearranging in ascending order and quartiles have specific %

tab wageq

tab black wageq //the wage distribution in terms of race(black 1 or 0)

tab black wageq, col // gives the percentages as well

reg wage i.black // i makes the explnatory variable as binary in 0 and 1

// the B1 is -254.8062 so the average difference in the wage of black and white is B1
// The B0 is 990.6479 so the average wage if black=0 (means white in simple terms)

gen white = 0
replace white = 1 if black == 0

regress wage i.black i.white // i.white omitted as both are giving same information
