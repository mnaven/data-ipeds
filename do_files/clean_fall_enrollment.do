version 14.1
cap log close
clear all
set more off
set graphics off
set scheme s1color

if c(machine_type)=="Macintosh (Intel 64-bit)" & c(username)=="Naven" {
	global ipeds /Users/Naven/Google Drive/data/ipeds
}
if c(hostname)=="sapper" {
	global ipeds /home/users/navenm.AD3/research/data/ipeds
}
cd $ipeds

log using log_files/fall_enrollment/clean_fall_enrollment.log, replace
timer on 1

local bases "tot res"
local weights "ef_\`base' prop_\`base'_state_enrollment"
local races "min maj white black hisp asian indian"


use "$ipeds/clean_data/fall_enrollment.dta", clear

* Fall enrollment counts
**** White
gen ef_white_men = efrace11 if year>=1980 & year<=2007
replace ef_white_men = dvefwhm if year>=2008 & year<=2009
replace ef_white_men = efwhitm if year>=2010
label var ef_white_men "White Men Fall Enrollment"
gen ef_white_wom = efrace12 if year>=1980 & year<=2007
replace ef_white_wom = dvefwhw if year>=2008 & year<=2009
replace ef_white_wom = efwhitw if year>=2010
label var ef_white_wom "White Women Fall Enrollment"
gen ef_white_tot = efrace22 if year>=1980 & year<=2007
replace ef_white_tot = dvefwht if year>=2008 & year<=2009
replace ef_white_tot = efwhitt if year>=2010
*egen ef_white_tot = rowtotal(ef_white_men ef_white_wom), missing
label var ef_white_tot "White Total Fall Enrollment"
gen ef_white_sum = ef_white_men + ef_white_wom
drop if ef_white_tot!=ef_white_sum & !mi(ef_white_tot, ef_white_sum)
replace ef_white_tot = ef_white_sum if mi(ef_white_tot) & !mi(ef_white_sum)
drop ef_white_sum

**** Black
gen ef_black_men = efrace03 if year>=1980 & year<=2007
replace ef_black_men = dvefbkm if year>=2008 & year<=2009
replace ef_black_men = efbkaam if year>=2010
label var ef_black_men "Black Men Fall Enrollment"
gen ef_black_wom = efrace04 if year>=1980 & year<=2007
replace ef_black_wom = dvefbkw if year>=2008 & year<=2009
replace ef_black_wom = efbkaaw if year>=2010
label var ef_black_wom "Black Women Fall Enrollment"
gen ef_black_tot = efrace18 if year>=1980 & year<=2007
replace ef_black_tot = dvefbkt if year>=2008 & year<=2009
replace ef_black_tot = efbkaat if year>=2010
*egen ef_black_tot = rowtotal(ef_black_men ef_black_wom), missing
label var ef_black_tot "Black Total Fall Enrollment"
gen ef_black_sum = ef_black_men + ef_black_wom
drop if ef_black_tot!=ef_black_sum & !mi(ef_black_tot, ef_black_sum)
replace ef_black_tot = ef_black_sum if mi(ef_black_tot) & !mi(ef_black_sum)
drop ef_black_sum

**** Hispanic
gen ef_hisp_men = efrace09 if year>=1980 & year<=2007
replace ef_hisp_men = dvefhsm if year>=2008 & year<=2009
replace ef_hisp_men = efhispm if year>=2010
label var ef_hisp_men "Hispanic Men Fall Enrollment"
gen ef_hisp_wom = efrace10 if year>=1980 & year<=2007
replace ef_hisp_wom = dvefhsw if year>=2008 & year<=2009
replace ef_hisp_wom = efhispw if year>=2010
label var ef_hisp_wom "Hispanic Women Fall Enrollment"
gen ef_hisp_tot = efrace21 if year>=1980 & year<=2007
replace ef_hisp_tot = dvefhst if year>=2008 & year<=2009
replace ef_hisp_tot = efhispt if year>=2010
*egen ef_hisp_tot = rowtotal(ef_hisp_men ef_hisp_wom), missing
label var ef_hisp_tot "Hispanic Total Fall Enrollment"
gen ef_hisp_sum = ef_hisp_men + ef_hisp_wom
drop if ef_hisp_tot!=ef_hisp_sum & !mi(ef_hisp_tot, ef_hisp_sum)
replace ef_hisp_tot = ef_hisp_sum if mi(ef_hisp_tot) & !mi(ef_hisp_sum)
drop ef_hisp_sum

**** Asian
gen ef_asian_men = efrace07 if year>=1980 & year<=2007
replace ef_asian_men = dvefapm if year>=2008 & year<=2009
replace ef_asian_men = efasiam if year>=2010
label var ef_asian_men "Asian Men Fall Enrollment"
gen ef_asian_wom = efrace08 if year>=1980 & year<=2007
replace ef_asian_wom = dvefapw if year>=2008 & year<=2009
replace ef_asian_wom = efasiaw if year>=2010
label var ef_asian_wom "Asian Women Fall Enrollment"
gen ef_asian_tot = efrace20 if year>=1980 & year<=2007
replace ef_asian_tot = dvefapt if year>=2008 & year<=2009
replace ef_asian_tot = efasiat if year>=2010
*egen ef_asian_tot = rowtotal(ef_asian_men ef_asian_wom), missing
label var ef_asian_tot "Asian Total Fall Enrollment"
gen ef_asian_sum = ef_asian_men + ef_asian_wom
drop if ef_asian_tot!=ef_asian_sum & !mi(ef_asian_tot, ef_asian_sum)
replace ef_asian_tot = ef_asian_sum if mi(ef_asian_tot) & !mi(ef_asian_sum)
drop ef_asian_sum

**** Native American
gen ef_indian_men = efrace05 if year>=1980 & year<=2007
replace ef_indian_men = dvefaim if year>=2008 & year<=2009
replace ef_indian_men = efaianm if year>=2010
label var ef_indian_men "Native American Men Fall Enrollment"
gen ef_indian_wom = efrace06 if year>=1980 & year<=2007
replace ef_indian_wom = dvefaiw if year>=2008 & year<=2009
replace ef_indian_wom = efaianw if year>=2010
label var ef_indian_wom "Native American Women Fall Enrollment"
gen ef_indian_tot = efrace19 if year>=1980 & year<=2007
replace ef_indian_tot = dvefait if year>=2008 & year<=2009
replace ef_indian_tot = efaiant if year>=2010
*egen ef_indian_tot = rowtotal(ef_indian_men ef_indian_wom), missing
label var ef_indian_tot "Native American Total Fall Enrollment"
gen ef_indian_sum = ef_indian_men + ef_indian_wom
drop if ef_indian_tot!=ef_indian_sum & !mi(ef_indian_tot, ef_indian_sum)
replace ef_indian_tot = ef_indian_sum if mi(ef_indian_tot) & !mi(ef_indian_sum)
drop ef_indian_sum

**** Native Hawaiian or Other Pacific Islander
gen ef_hawaiian_men = efnhpim if year>=1980
label var ef_hawaiian_men "Native Hawaiian Men Fall Encollment"
gen ef_hawaiian_wom = efnhpiw if year>=1980
label var ef_hawaiian_wom "Native Hawaiian Women Fall Encollment"
gen ef_hawaiian_tot = efnhpit if year>=1980
*egen ef_hawaiian_tot = rowtotal(ef_hawaiian_men ef_hawaiian_wom), missing
label var ef_hawaiian_tot "Native Hawaiian Total Fall Encollment"
gen ef_hawaiian_sum = ef_hawaiian_men + ef_hawaiian_wom
drop if ef_hawaiian_tot!=ef_hawaiian_sum & !mi(ef_hawaiian_tot, ef_hawaiian_sum)
replace ef_hawaiian_tot = ef_hawaiian_sum if mi(ef_hawaiian_tot) & !mi(ef_hawaiian_sum)
drop ef_hawaiian_sum

**** Two or More Races
gen ef_biracial_men = ef2morm if year>=1980
label var ef_biracial_men "2 or More Races Men Fall Enrollment"
gen ef_biracial_wom = ef2morw if year>=1980
label var ef_biracial_wom "2 or More Races Women Fall Enrollment"
gen ef_biracial_tot = ef2mort if year>=1980
*egen ef_biracial_tot = rowtotal(ef_biracial_men ef_biracial_wom), missing
label var ef_biracial_tot "2 or More Races Total Fall Enrollment"
gen ef_biracial_sum = ef_biracial_men + ef_biracial_wom
drop if ef_biracial_tot!=ef_biracial_sum & !mi(ef_biracial_tot, ef_biracial_sum)
replace ef_biracial_tot = ef_biracial_sum if mi(ef_biracial_tot) & !mi(ef_biracial_sum)
drop ef_biracial_sum

**** Nonresident Alien
gen ef_alien_men = efrace01 if year>=1980 & year<=2007
replace ef_alien_men = efnralm if year>=2008
label var ef_alien_men "Nonresident Alien Men Fall Enrollment"
gen ef_alien_wom = efrace02 if year>=1980 & year<=2007
replace ef_alien_wom = efnralw if year>=2008
label var ef_alien_wom "Nonresident Alien Women Fall Enrollment"
gen ef_alien_tot = efrace17 if year>=1980 & year<=2007
replace ef_alien_tot = efnralt if year>=2008
*egen ef_alien_tot = rowtotal(ef_alien_men ef_alien_wom), missing
label var ef_alien_tot "Nonresident Alien Total Fall Enrollment"
gen ef_alien_sum = ef_alien_men + ef_alien_wom
drop if ef_alien_tot!=ef_alien_sum & !mi(ef_alien_tot, ef_alien_sum)
replace ef_alien_tot = ef_alien_sum if mi(ef_alien_tot) & !mi(ef_alien_sum)
drop ef_alien_sum

**** Unknown
gen ef_unknown_men = efrace13 if year>=1980 & year<=2007
replace ef_unknown_men = efunknm if year>=2008
label var ef_unknown_men "Unknown Race Men Fall Enrollment"
gen ef_unknown_wom = efrace14 if year>=1980 & year<=2007
replace ef_unknown_wom = efunknw if year>=2008
label var ef_unknown_wom "Unknown Race Women Fall Enrollment"
gen ef_unknown_tot = efrace23 if year>=1980 & year<=2007
replace ef_unknown_tot = efunknt if year>=2008
*egen ef_unknown_tot = rowtotal(ef_unknown_men ef_unknown_wom), missing
label var ef_unknown_tot "Unknown Race Total Fall Enrollment"
gen ef_unknown_sum = ef_unknown_men + ef_unknown_wom
drop if ef_unknown_tot!=ef_unknown_sum & !mi(ef_unknown_tot, ef_unknown_sum)
replace ef_unknown_tot = ef_unknown_sum if mi(ef_unknown_tot) & !mi(ef_unknown_sum)
drop ef_unknown_sum

**** Include Hawaiians with Asians
egen temp_ef_asian_men = rowtotal(ef_asian_men ef_hawaiian_men), missing
drop ef_asian_men
rename temp_ef_asian_men ef_asian_men
egen temp_ef_asian_wom = rowtotal(ef_asian_wom ef_hawaiian_wom), missing
drop ef_asian_wom
rename temp_ef_asian_wom ef_asian_wom
egen temp_ef_asian_tot = rowtotal(ef_asian_tot ef_hawaiian_tot), missing
drop ef_asian_tot
rename temp_ef_asian_tot ef_asian_tot

**** Minority
egen ef_min_men = rowtotal(ef_black_men ef_hisp_men ef_indian_men ///
	ef_biracial_men), missing
label var ef_min_men "Minority Men Fall Enrollment"
egen ef_min_wom = rowtotal(ef_black_wom ef_hisp_wom ef_indian_wom ///
	ef_biracial_wom), missing
label var ef_min_wom "Minority Women Fall Enrollment"
*egen ef_min_tot = rowtotal(ef_min_men ef_min_wom), missing
gen ef_min_tot = ef_min_men + ef_min_wom
label var ef_min_tot "Minority Total Fall Enrollment"

*** Majority
egen ef_maj_men = rowtotal(ef_white_men ef_asian_men), missing
label var ef_maj_men "Majority Men Fall Enrollment"
egen ef_maj_wom = rowtotal(ef_white_wom ef_asian_wom), missing
label var ef_maj_wom "Majority Women Fall Enrollment"
*egen ef_maj_tot = rowtotal(ef_maj_men ef_maj_wom), missing
gen ef_maj_tot = ef_maj_men + ef_maj_wom
label var ef_maj_tot "Majority Total Fall Enrollment"

**** Resident
egen ef_res_men = rowtotal(ef_white_men ef_black_men ef_hisp_men ///
	ef_asian_men ef_indian_men ef_biracial_men), missing
label var ef_res_men "Resident Men Fall Enrollment"
egen ef_res_wom = rowtotal(ef_white_wom ef_black_wom ef_hisp_wom ///
	ef_asian_wom ef_indian_wom ef_biracial_wom), missing
label var ef_res_wom "Resident Women Fall Enrollment"
*egen ef_res = rowtotal(ef_res_men ef_res_wom), missing
gen ef_res = ef_res_men + ef_res_wom
label var ef_res "Resident Total Fall Enrollment"

**** Total
/*gen ef_tot_men = efrace15 if year>=1980 & year<=2007
replace ef_tot_men = eftotlm if year>=2008*/
egen ef_tot_men = rowtotal(ef_white_men ef_black_men ef_hisp_men ///
	ef_asian_men ef_indian_men ef_biracial_men ef_alien_men), missing
label var ef_tot_men "Total Men Fall Enrollment"
/*gen ef_tot_wom = efrace16 if year>=1980 & year<=2007
replace ef_tot_wom = eftotlw if year>=2008*/
egen ef_tot_wom = rowtotal(ef_white_wom ef_black_wom ef_hisp_wom ///
	ef_asian_wom ef_indian_wom ef_biracial_wom ef_alien_wom), missing
label var ef_tot_wom "Total Women Fall Enrollment"
/*gen ef_tot = efrace24 if year>=1980 & year<=2007
replace ef_tot = eftotlt if year>=2008*/
*egen ef_tot = rowtotal(ef_tot_men ef_tot_wom), missing
gen ef_tot = ef_tot_men + ef_tot_wom
label var ef_tot "Total Fall Enrollment"


* Drop unneeded enrollment variables
drop efrace* dvef* efwhitm efbkaam efhispm efasiam efaianm efnhpim ef2morm ///
	efnralm efunknm eftotlm efwhitw efbkaaw efhispw efasiaw efaianw efnhpiw ///
	ef2morw efnralw efunknw eftotlw efwhitt efbkaat efhispt efasiat efaiant ///
	efnhpit ef2mort efnralt efunknt eftotlt


* Fall Enrollment Proportions
foreach base in `bases' {
	if "`base'"=="res" {
		local cap_base "Resident"
	}
	if "`base'"=="tot" {
		local cap_base "Total"
	}

	foreach race in `races' {
		if "`race'"=="hisp" {
			local cap_race "Hispanic"
		}
		else if "`race'"=="indian" {
			local cap_race "Native American"
		}
		else if "`race'"=="min" {
			local cap_race "Minority"
		}
		else if "`race'"=="maj" {
			local cap_race "Majority"
		}
		else {
			local cap_race = upper(substr("`race'", 1, 1)) + substr("`race'", 2, .)
		}

		display "`cap_race' `cap_base'"

		gen ef_`race'_men_prop_`base' = ef_`race'_men / ef_`base'_men
		label var ef_`race'_men_prop_`base' "`cap_race' Men Proportion of `cap_base' Enrollment"
		gen ef_`race'_wom_prop_`base' = ef_`race'_wom/ef_`base'_wom
		label var ef_`race'_wom_prop_`base' "`cap_race' Women Proportion of `cap_base' Enrollment"
		gen ef_`race'_prop_`base' = ef_`race'_tot / ef_`base'
		label var ef_`race'_prop_`base' "`cap_race' Proportion of `cap_base' Enrollment"
	}
}

sum

sort unitid year line
compress
save clean_data/fall_enrollment/fall_enrollment_clean.dta, replace


**** Undergraduates
use clean_data/fall_enrollment/fall_enrollment_clean.dta, clear

drop if year>=1980 & year<=1985 & line!=1 & line!=15
drop if year>=1986 & year<=1998 & line!=8 & line!=22
drop if year==1999 & line!=8 & line!=22
drop if year>=2000 & year<=2001 & line!=8 & line!=22
drop if year>=2002 & year<=2008 & line!=8 & line!=22
drop if year>=2009 & year<=2014 & line!=8 & line!=22

sum

foreach var of varlist ef_* {
	di "`var'"
	bysort unitid year: egen N`var' = count(`var')
	gen X`var' = (N`var'==0)
}

collapse (rawsum) ef_white_men ef_white_wom ef_white_tot ef_black_men ///
	ef_black_wom ef_black_tot ef_hisp_men ef_hisp_wom ///
	ef_hisp_tot ef_asian_men ef_asian_wom ef_asian_tot ef_indian_men ///
	ef_indian_wom ef_indian_tot ef_alien_men ef_alien_wom ef_alien_tot ///
	ef_tot_men ef_tot_wom ef_tot ef_min_men ef_min_wom ///
	ef_min_tot ef_maj_men ef_maj_wom ef_maj_tot ///
	ef_res_men ef_res_wom ef_res ///
	(max) Xef_*, ///
	by(unitid year)

foreach var of varlist ef_* {
	di "`var'"
	replace `var' = . if X`var'==1
}
drop Xef_*

xtset unitid year, yearly

* University weight
egen median_enrollment = median(ef_tot), by(unitid)
label var median_enrollment "Median Enrollment"
egen tot_state_enrollment = total(ef_tot), by(stabbr year level)
label var tot_state_enrollment "Total State Enrollment"
gen prop_tot_state_enrollment = ef_tot / tot_state_enrollment
label var prop_tot_state_enrollment "Proportion of Total State Enrollment"
egen res_state_enrollment = total(ef_res), by(stabbr year level)
label var res_state_enrollment "Resident State Enrollment"
gen prop_res_state_enrollment = ef_res / res_state_enrollment
label var prop_res_state_enrollment "Proportion of Resident State Enrollment"

* Fall Enrollment Proportions
foreach base in `bases' {
	if "`base'"=="res" {
		local cap_base "Resident"
	}
	if "`base'"=="tot" {
		local cap_base "Total"
	}

	foreach race in `races' {
		if "`race'"=="hisp" {
			local cap_race "Hispanic"
		}
		else if "`race'"=="indian" {
			local cap_race "Native American"
		}
		else if "`race'"=="min" {
			local cap_race "Minority"
		}
		else if "`race'"=="maj" {
			local cap_race "Majority"
		}
		else {
			local cap_race = upper(substr("`race'", 1, 1)) + substr("`race'", 2, .)
		}

		display "`cap_race' `cap_base'"

		gen ef_`race'_men_prop_`base' = ef_`race'_men / ef_`base'_men
		label var ef_`race'_men_prop_`base' "`cap_race' Men Proportion of `cap_base' Enrollment"
		gen ef_`race'_wom_prop_`base' = ef_`race'_wom / ef_`base'_wom
		label var ef_`race'_wom_prop_`base' "`cap_race' Women Proportion of `cap_base' Enrollment"
		gen ef_`race'_prop_`base' = ef_`race'_tot / ef_`base'
		label var ef_`race'_prop_`base' "`cap_race' Proportion of `cap_base' Enrollment"
	}
}

sort unitid year
compress
save clean_data/fall_enrollment/undergrad_total_clean.dta, replace


**** First Time First Year Undergraduates
use clean_data/fall_enrollment/fall_enrollment_clean.dta, clear

drop if year>=1980 & year<=1985 & line!=2 & line!=16
drop if year>=1986 & year<=1998 & line!=1 & line!=15
drop if year==1999 & line!=1 & line!=15
drop if year>=2000 & year<=2001 & line!=1 & line!=15
drop if year>=2002 & year<=2008 & line!=1 & line!=15
drop if year>=2009 & year<=2014 & line!=1 & line!=15

sum

foreach var of varlist ef_* {
	di "`var'"
	bysort unitid year: egen N`var' = count(`var')
	gen X`var' = (N`var'==0)
}

collapse (rawsum) ef_white_men ef_white_wom ef_white_tot ef_black_men ///
	ef_black_wom ef_black_tot ef_hisp_men ef_hisp_wom ///
	ef_hisp_tot ef_asian_men ef_asian_wom ef_asian_tot ef_indian_men ///
	ef_indian_wom ef_indian_tot ef_alien_men ef_alien_wom ef_alien_tot ///
	ef_tot_men ef_tot_wom ef_tot ef_min_men ef_min_wom ///
	ef_min_tot ef_maj_men ef_maj_wom ef_maj_tot ///
	ef_res_men ef_res_wom ef_res ///
	(max) Xef_*, ///
	by(unitid year) /*cw*/

foreach var of varlist ef_* {
	di "`var'"
	replace `var' = . if X`var'==1
}
drop Xef_*

xtset unitid year, yearly

* University weight
egen median_enrollment = median(ef_tot), by(unitid)
label var median_enrollment "Median Enrollment"
egen tot_state_enrollment = total(ef_tot), by(stabbr year level)
label var tot_state_enrollment "Total State Enrollment"
gen prop_tot_state_enrollment = ef_tot / tot_state_enrollment
label var prop_tot_state_enrollment "Proportion of Total State Enrollment"
egen res_state_enrollment = total(ef_res), by(stabbr year level)
label var res_state_enrollment "Resident State Enrollment"
gen prop_res_state_enrollment = ef_res / res_state_enrollment
label var prop_res_state_enrollment "Proportion of Resident State Enrollment"

* Fall Enrollment Proportions
foreach base in `bases' {
	if "`base'"=="res" {
		local cap_base "Resident"
	}
	if "`base'"=="tot" {
		local cap_base "Total"
	}

	foreach race in `races' {
		if "`race'"=="hisp" {
			local cap_race "Hispanic"
		}
		else if "`race'"=="indian" {
			local cap_race "Native American"
		}
		else if "`race'"=="min" {
			local cap_race "Minority"
		}
		else if "`race'"=="maj" {
			local cap_race "Majority"
		}
		else {
			local cap_race = upper(substr("`race'", 1, 1)) + substr("`race'", 2, .)
		}

		display "`cap_race' `cap_base'"

		gen ef_`race'_men_prop_`base' = ef_`race'_men / ef_`base'_men
		label var ef_`race'_men_prop_`base' "`cap_race' Men Proportion of `cap_base' Enrollment"
		gen ef_`race'_wom_prop_`base' = ef_`race'_wom / ef_`base'_wom
		label var ef_`race'_wom_prop_`base' "`cap_race' Women Proportion of `cap_base' Enrollment"
		gen ef_`race'_prop_`base' = ef_`race'_tot / ef_`base'
		label var ef_`race'_prop_`base' "`cap_race' Proportion of `cap_base' Enrollment"
	}
}

sort unitid year
compress
save clean_data/fall_enrollment/undergrad_freshman_clean.dta, replace


**** First Professional
use clean_data/fall_enrollment/fall_enrollment_clean.dta, clear

drop if year>=1980 & year<=1985 & line!=10 & line!=24
drop if year>=1986 & year<=1998 & line!=9 & line!=10 & line!=23 & line!=24
drop if year==1999 & line!=9 & line!=10 & line!=23 & line!=24
drop if year>=2000 & year<=2001 & line!=9 & line!=23
drop if year>=2002 & year<=2008 & line!=9 & line!=23
drop if year>=2009 & year<=2014

sum

foreach var of varlist ef_* {
	di "`var'"
	bysort unitid year: egen N`var' = count(`var')
	gen X`var' = (N`var'==0)
}

collapse (rawsum) ef_white_men ef_white_wom ef_white_tot ef_black_men ///
	ef_black_wom ef_black_tot ef_hisp_men ef_hisp_wom ///
	ef_hisp_tot ef_asian_men ef_asian_wom ef_asian_tot ef_indian_men ///
	ef_indian_wom ef_indian_tot ef_alien_men ef_alien_wom ef_alien_tot ///
	ef_tot_men ef_tot_wom ef_tot ef_min_men ef_min_wom ///
	ef_min_tot ef_maj_men ef_maj_wom ef_maj_tot ///
	ef_res_men ef_res_wom ef_res ///
	(max) Xef_*, ///
	by(unitid year) /*cw*/

foreach var of varlist ef_* {
	di "`var'"
	replace `var' = . if X`var'==1
}
drop Xef_*

xtset unitid year, yearly

* University weight
egen median_enrollment = median(ef_tot), by(unitid)
label var median_enrollment "Median Enrollment"
egen tot_state_enrollment = total(ef_tot), by(stabbr year level)
label var tot_state_enrollment "Total State Enrollment"
gen prop_tot_state_enrollment = ef_tot / tot_state_enrollment
label var prop_tot_state_enrollment "Proportion of Total State Enrollment"
egen res_state_enrollment = total(ef_res), by(stabbr year level)
label var res_state_enrollment "Resident State Enrollment"
gen prop_res_state_enrollment = ef_res / res_state_enrollment
label var prop_res_state_enrollment "Proportion of Resident State Enrollment"

* Fall Enrollment Proportions
foreach base in `bases' {
	if "`base'"=="res" {
		local cap_base "Resident"
	}
	if "`base'"=="tot" {
		local cap_base "Total"
	}

	foreach race in `races' {
		if "`race'"=="hisp" {
			local cap_race "Hispanic"
		}
		else if "`race'"=="indian" {
			local cap_race "Native American"
		}
		else if "`race'"=="min" {
			local cap_race "Minority"
		}
		else if "`race'"=="maj" {
			local cap_race "Majority"
		}
		else {
			local cap_race = upper(substr("`race'", 1, 1)) + substr("`race'", 2, .)
		}

		display "`cap_race' `cap_base'"

		gen ef_`race'_men_prop_`base' = ef_`race'_men / ef_`base'_men
		label var ef_`race'_men_prop_`base' "`cap_race' Men Proportion of `cap_base' Enrollment"
		gen ef_`race'_wom_prop_`base' = ef_`race'_wom / ef_`base'_wom
		label var ef_`race'_wom_prop_`base' "`cap_race' Women Proportion of `cap_base' Enrollment"
		gen ef_`race'_prop_`base' = ef_`race'_tot / ef_`base'
		label var ef_`race'_prop_`base' "`cap_race' Proportion of `cap_base' Enrollment"
	}
}

sort unitid year
compress
save clean_data/fall_enrollment/first_professional_total_clean.dta, replace


* Graduate
use clean_data/fall_enrollment/fall_enrollment_clean.dta, clear

drop if year>=1980 & year<=1985 & line!=11 & line!=25
drop if year>=1986 & year<=1998 & line!=11 & line!=12 & line!=25 & line!=26
drop if year==1999 & line!=11 & line!=12 & line!=25 & line!=26
drop if year>=2000 & year<=2001 & line!=11 & line!=25
drop if year>=2002 & year<=2008 & line!=11 & line!=25
drop if year>=2009 & year<=2014 & line!=11 & line!=25

sum

foreach var of varlist ef_* {
	di "`var'"
	bysort unitid year: egen N`var' = count(`var')
	gen X`var' = (N`var'==0)
}

collapse (rawsum) ef_white_men ef_white_wom ef_white_tot ef_black_men ///
	ef_black_wom ef_black_tot ef_hisp_men ef_hisp_wom ///
	ef_hisp_tot ef_asian_men ef_asian_wom ef_asian_tot ef_indian_men ///
	ef_indian_wom ef_indian_tot ef_alien_men ef_alien_wom ef_alien_tot ///
	ef_tot_men ef_tot_wom ef_tot ef_min_men ef_min_wom ///
	ef_min_tot ef_maj_men ef_maj_wom ef_maj_tot ///
	ef_res_men ef_res_wom ef_res ///
	(max) Xef_*, ///
	by(unitid year) /*cw*/

foreach var of varlist ef_* {
	di "`var'"
	replace `var' = . if X`var'==1
}
drop Xef_*

xtset unitid year, yearly

* University weight
egen median_enrollment = median(ef_tot), by(unitid)
label var median_enrollment "Median Enrollment"
egen tot_state_enrollment = total(ef_tot), by(stabbr year level)
label var tot_state_enrollment "Total State Enrollment"
gen prop_tot_state_enrollment = ef_tot / tot_state_enrollment
label var prop_tot_state_enrollment "Proportion of Total State Enrollment"
egen res_state_enrollment = total(ef_res), by(stabbr year level)
label var res_state_enrollment "Resident State Enrollment"
gen prop_res_state_enrollment = ef_res / res_state_enrollment
label var prop_res_state_enrollment "Proportion of Resident State Enrollment"

* Fall Enrollment Proportions
foreach base in `bases' {
	if "`base'"=="res" {
		local cap_base "Resident"
	}
	if "`base'"=="tot" {
		local cap_base "Total"
	}

	foreach race in `races' {
		if "`race'"=="hisp" {
			local cap_race "Hispanic"
		}
		else if "`race'"=="indian" {
			local cap_race "Native American"
		}
		else if "`race'"=="min" {
			local cap_race "Minority"
		}
		else if "`race'"=="maj" {
			local cap_race "Majority"
		}
		else {
			local cap_race = upper(substr("`race'", 1, 1)) + substr("`race'", 2, .)
		}

		display "`cap_race' `cap_base'"

		gen ef_`race'_men_prop_`base' = ef_`race'_men/ef_`base'_men
		label var ef_`race'_men_prop_`base' "`cap_race' Men Proportion of `cap_base' Enrollment"
		gen ef_`race'_wom_prop_`base' = ef_`race'_wom/ef_`base'_wom
		label var ef_`race'_wom_prop_`base' "`cap_race' Women Proportion of `cap_base' Enrollment"
		gen ef_`race'_prop_`base' = ef_`race'_tot/ef_`base'
		label var ef_`race'_prop_`base' "`cap_race' Proportion of `cap_base' Enrollment"
	}
}

sort unitid year
compress
save clean_data/fall_enrollment/grad_total_clean.dta, replace


timer off 1
timer list
log close
