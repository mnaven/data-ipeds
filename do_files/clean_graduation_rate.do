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

log using log_files/graduation_rate/clean_graduation_rate.log, replace
timer on 1

local weights "gr_cohort_\`race'_tot prop_\`race'_tot_state_cohort"
local races "min maj white black hisp asian indian"
local sexes "tot men wom"


use "$ipeds/clean_data/graduation_rate.dta", clear


* Graduation counts
**** White
gen gr_white_men = grrace11 if year>=1997 & year<=2007
replace gr_white_men = dvgrwhm if year>=2008 & year<=2010
replace gr_white_men = grwhitm if year>=2011
label var gr_white_men "White Men Graduates"
gen gr_white_wom = grrace12 if year>=1997 & year<=2007
replace gr_white_wom = dvgrwhw if year>=2008 & year<=2010
replace gr_white_wom = grwhitw if year>=2011
label var gr_white_wom "White Women Graduates"
gen gr_white_tot = grrace22 if year>=1997 & year<=2007
replace gr_white_tot = dvgrwht if year>=2008 & year<=2010
replace gr_white_tot = grwhitt if year>=2011
*egen gr_white_tot = rowtotal(gr_white_men gr_white_wom), missing
label var gr_white_tot "White Total Graduates"
gen gr_white_sum = gr_white_men + gr_white_wom
drop if gr_white_tot!=gr_white_sum & !mi(gr_white_tot, gr_white_sum)
replace gr_white_tot = gr_white_sum if mi(gr_white_tot) & !mi(gr_white_sum)
drop gr_white_sum

**** Black
gen gr_black_men = grrace03 if year>=1997 & year<=2007
replace gr_black_men = dvgrbkm if year>=2008 & year<=2010
replace gr_black_men = grbkaam if year>=2011
label var gr_black_men "Black Men Graduates"
gen gr_black_wom = grrace04 if year>=1997 & year<=2007
replace gr_black_wom = dvgrbkw if year>=2008 & year<=2010
replace gr_black_wom = grbkaaw if year>=2011
label var gr_black_wom "Black Women Graduates"
gen gr_black_tot = grrace18 if year>=1997 & year<=2007
replace gr_black_tot = dvgrbkt if year>=2008 & year<=2010
replace gr_black_tot = grbkaat if year>=2011
*egen gr_black_tot = rowtotal(gr_black_men gr_black_wom), missing
label var gr_black_tot "Black Total Graduates"
gen gr_black_sum = gr_black_men + gr_black_wom
drop if gr_black_tot!=gr_black_sum & !mi(gr_black_tot, gr_black_sum)
replace gr_black_tot = gr_black_sum if mi(gr_black_tot) & !mi(gr_black_sum)
drop gr_black_sum

**** Hispanic
gen gr_hisp_men = grrace09 if year>=1997 & year<=2007
replace gr_hisp_men = dvgrhsm if year>=2008 & year<=2010
replace gr_hisp_men = grhispm if year>=2011
label var gr_hisp_men "Hispanic Men Graduates"
gen gr_hisp_wom = grrace10 if year>=1997 & year<=2007
replace gr_hisp_wom = dvgrhsw if year>=2008 & year<=2010
replace gr_hisp_wom = grhispw if year>=2011
label var gr_hisp_wom "Hispanic Women Graduates"
gen gr_hisp_tot = grrace21 if year>=1997 & year<=2007
replace gr_hisp_tot = dvgrhst if year>=2008 & year<=2010
replace gr_hisp_tot = grhispt if year>=2011
*egen gr_hisp_tot = rowtotal(gr_hisp_men gr_hisp_wom), missing
label var gr_hisp_tot "Hispanic Total Graduates"
gen gr_hisp_sum = gr_hisp_men + gr_hisp_wom
drop if gr_hisp_tot!=gr_hisp_sum & !mi(gr_hisp_tot, gr_hisp_sum)
replace gr_hisp_tot = gr_hisp_sum if mi(gr_hisp_tot) & !mi(gr_hisp_sum)
drop gr_hisp_sum

**** Asian
gen gr_asian_men = grrace07 if year>=1997 & year<=2007
replace gr_asian_men = dvgrapm if year>=2008 & year<=2010
replace gr_asian_men = grasiam if year>=2011
label var gr_asian_men "Asian Men Graduates"
gen gr_asian_wom = grrace08 if year>=1997 & year<=2007
replace gr_asian_wom = dvgrapw if year>=2008 & year<=2010
replace gr_asian_wom = grasiaw if year>=2011
label var gr_asian_wom "Asian Women Graduates"
gen gr_asian_tot = grrace20 if year>=1997 & year<=2007
replace gr_asian_tot = dvgrapt if year>=2008 & year<=2010
replace gr_asian_tot = grasiat if year>=2011
*egen gr_asian_tot = rowtotal(gr_asian_men gr_asian_wom), missing
label var gr_asian_tot "Asian Total Graduates"
gen gr_asian_sum = gr_asian_men + gr_asian_wom
drop if gr_asian_tot!=gr_asian_sum & !mi(gr_asian_tot, gr_asian_sum)
replace gr_asian_tot = gr_asian_sum if mi(gr_asian_tot) & !mi(gr_asian_sum)
drop gr_asian_sum

**** Native American
gen gr_indian_men = grrace05 if year>=1997 & year<=2007
replace gr_indian_men = dvgraim if year>=2008 & year<=2010
replace gr_indian_men = graianm if year>=2011
label var gr_indian_men "Native American Men Graduates"
gen gr_indian_wom = grrace06 if year>=1997 & year<=2007
replace gr_indian_wom = dvgraiw if year>=2008 & year<=2010
replace gr_indian_wom = graianw if year>=2011
label var gr_indian_wom "Native American Women Graduates"
gen gr_indian_tot = grrace19 if year>=1997 & year<=2007
replace gr_indian_tot = dvgrait if year>=2008 & year<=2010
replace gr_indian_tot = graiant if year>=2011
*egen gr_indian_tot = rowtotal(gr_indian_men gr_indian_wom), missing
label var gr_indian_tot "Native American Total Graduates"
gen gr_indian_sum = gr_indian_men + gr_indian_wom
drop if gr_indian_tot!=gr_indian_sum & !mi(gr_indian_tot, gr_indian_sum)
replace gr_indian_tot = gr_indian_sum if mi(gr_indian_tot) & !mi(gr_indian_sum)
drop gr_indian_sum

**** Native Hawaiian or Other Pacific Islander
gen gr_hawaiian_men = grnhpim if year>=1980
label var gr_hawaiian_men "Native Hawaiian Men Fall Encollment"
gen gr_hawaiian_wom = grnhpiw if year>=1980
label var gr_hawaiian_wom "Native Hawaiian Women Fall Encollment"
gen gr_hawaiian_tot = grnhpit if year>=1980
*egen gr_hawaiian_tot = rowtotal(gr_hawaiian_men gr_hawaiian_wom), missing
label var gr_hawaiian_tot "Native Hawaiian Total Fall Encollment"
gen gr_hawaiian_sum = gr_hawaiian_men + gr_hawaiian_wom
drop if gr_hawaiian_tot!=gr_hawaiian_sum & !mi(gr_hawaiian_tot, gr_hawaiian_sum)
replace gr_hawaiian_tot = gr_hawaiian_sum if mi(gr_hawaiian_tot) & !mi(gr_hawaiian_sum)
drop gr_hawaiian_sum

**** Two or More Races
gen gr_biracial_men = gr2morm if year>=1980
label var gr_biracial_men "2 or More Races Men Graduates"
gen gr_biracial_wom = gr2morw if year>=1980
label var gr_biracial_wom "2 or More Races Women Graduates"
gen gr_biracial_tot = gr2mort if year>=1980
*egen gr_biracial_tot = rowtotal(gr_biracial_men gr_biracial_wom), missing
label var gr_biracial_tot "2 or More Races Total Graduates"
gen gr_biracial_sum = gr_biracial_men + gr_biracial_wom
drop if gr_biracial_tot!=gr_biracial_sum & !mi(gr_biracial_tot, gr_biracial_sum)
replace gr_biracial_tot = gr_biracial_sum if mi(gr_biracial_tot) & !mi(gr_biracial_sum)
drop gr_biracial_sum

**** Nonresident Alien
gen gr_alien_men = grrace01 if year>=1997 & year<=2007
replace gr_alien_men = grnralm if year>=2008
label var gr_alien_men "Nonresident Alien Men Graduates"
gen gr_alien_wom = grrace02 if year>=1997 & year<=2007
replace gr_alien_wom = grnralw if year>=2008
label var gr_alien_wom "Nonresident Alien Women Graduates"
gen gr_alien_tot = grrace17 if year>=1997 & year<=2007
replace gr_alien_tot = grnralt if year>=2008
*egen gr_alien_tot = rowtotal(gr_alien_men gr_alien_wom), missing
label var gr_alien_tot "Nonresident Alien Total Graduates"
gen gr_alien_sum = gr_alien_men + gr_alien_wom
drop if gr_alien_tot!=gr_alien_sum & !mi(gr_alien_tot, gr_alien_sum)
replace gr_alien_tot = gr_alien_sum if mi(gr_alien_tot) & !mi(gr_alien_sum)
drop gr_alien_sum

**** Unknown
gen gr_unknown_men = grrace13 if year>=1997 & year<=2007
replace gr_unknown_men = grunknm if year>=2008
label var gr_unknown_men "Unknown Race Men Graduates"
gen gr_unknown_wom = grrace14 if year>=1997 & year<=2007
replace gr_unknown_wom = grunknw if year>=2008
label var gr_unknown_wom "Unknown Race Women Graduates"
gen gr_unknown_tot = grrace23 if year>=1997 & year<=2007
replace gr_unknown_tot = grunknt if year>=2008
*egen gr_unknown_tot = rowtotal(gr_unknown_men gr_unknown_wom), missing
label var gr_unknown_tot "Unknown Race Total Graduates"
gen gr_unknown_sum = gr_unknown_men + gr_unknown_wom
drop if gr_unknown_tot!=gr_unknown_sum & !mi(gr_unknown_tot, gr_unknown_sum)
replace gr_unknown_tot = gr_unknown_sum if mi(gr_unknown_tot) & !mi(gr_unknown_sum)
drop gr_unknown_sum

**** Include Hawaiians with Asians
egen temp_gr_asian_men = rowtotal(gr_asian_men gr_hawaiian_men), missing
drop gr_asian_men
rename temp_gr_asian_men gr_asian_men
egen temp_gr_asian_wom = rowtotal(gr_asian_wom gr_hawaiian_wom), missing
drop gr_asian_wom
rename temp_gr_asian_wom gr_asian_wom
egen temp_gr_asian_tot = rowtotal(gr_asian_tot gr_hawaiian_tot), missing
drop gr_asian_tot
rename temp_gr_asian_tot gr_asian_tot

**** Minority
egen gr_min_men = rowtotal(gr_black_men gr_hisp_men gr_indian_men ///
	gr_biracial_men), missing
label var gr_min_men "Minority Men Graduates"
egen gr_min_wom = rowtotal(gr_black_wom gr_hisp_wom gr_indian_wom ///
	gr_biracial_wom), missing
label var gr_min_wom "Minority Women Graduates"
*egen gr_min_tot = rowtotal(gr_min_men gr_min_wom), missing
gen gr_min_tot = gr_min_men + gr_min_wom
label var gr_min_tot "Minority Total Graduates"

*** Majority
egen gr_maj_men = rowtotal(gr_white_men gr_asian_men), missing
label var gr_maj_men "Majority Men Graduates"
egen gr_maj_wom = rowtotal(gr_white_wom gr_asian_wom), missing
label var gr_maj_wom "Majority Women Graduates"
*egen gr_maj_tot = rowtotal(gr_maj_men gr_maj_wom), missing
gen gr_maj_tot = gr_maj_men + gr_maj_wom
label var gr_maj_tot "Majority Total Graduates"

**** Resident
egen gr_res_men = rowtotal(gr_white_men gr_black_men gr_hisp_men ///
	gr_asian_men gr_indian_men gr_biracial_men), missing
label var gr_res_men "Resident Men Graduates"
egen gr_res_wom = rowtotal(gr_white_wom gr_black_wom gr_hisp_wom ///
	gr_asian_wom gr_indian_wom gr_biracial_wom), missing
label var gr_res_wom "Resident Women Graduates"
*egen gr_res = rowtotal(gr_res_men gr_res_wom), missing
gen gr_res = gr_res_men + gr_res_wom
label var gr_res "Resident Total Graduates"

**** Total
/*gen gr_tot_men = grrace15 if year>=1997 & year<=2007
replace gr_tot_men = grtotlm if year>=2008*/
egen gr_tot_men = rowtotal(gr_white_men gr_black_men gr_hisp_men ///
	gr_asian_men gr_indian_men gr_biracial_men gr_alien_men), missing
label var gr_tot_men "Total Men Graduates"
/*gen gr_tot_wom = grrace16 if year>=1997 & year<=2007
replace gr_tot_wom = grtotlw if year>=2008*/
egen gr_tot_wom = rowtotal(gr_white_wom gr_black_wom gr_hisp_wom ///
	gr_asian_wom gr_indian_wom gr_biracial_wom gr_alien_wom), missing
label var gr_tot_wom "Total Women Graduates"
/*gen gr_tot = grrace24 if year>=1997 & year<=2007
replace gr_tot = grtotlt if year>=2008*/
*egen gr_tot = rowtotal(gr_tot_men gr_tot_wom), missing
gen gr_tot = gr_tot_men + gr_tot_wom
label var gr_tot "Total Graduates"


* Drop unneeded enrollment variables
drop grrace* dvgr* grwhitm grbkaam grhispm grasiam graianm grnhpim gr2morm ///
	grnralm grunknm grtotlm grwhitw grbkaaw grhispw grasiaw graianw grnhpiw ///
	gr2morw grnralw grunknw grtotlw grwhitt grbkaat grhispt grasiat graiant ///
	grnhpit gr2mort grnralt grunknt grtotlt

sum

sort unitid year grtype
compress
save clean_data/graduation_rate/graduation_rate_clean.dta, replace


**** 4-year institutions, Adjusted cohort (revised cohort minus exclusions)
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=2

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_cohort_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_cohort_`race'_`sex' "`cap_race' `cap_sex' 4-Year Institutions Adjusted Cohort"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/four_year_adj_cohort_clean.dta, replace


**** 4-year institutions, Completers within 150% of normal time
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=3

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_150_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_150_`race'_`sex' "`cap_race' `cap_sex' 4-Year Institutions Completers within 150% Time"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/four_year_150_time_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) adjusted cohort (revised cohort minus exclusions)
use clean_data/graduation_rate/graduatino_rate_clean.dta, clear

drop if grtype!=8

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_cohort_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_cohort_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Adjusted Subcohort"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/bachelors_adj_cohort_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) Completers within 150% of normal time total
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=9

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_150_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_150_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Subcohort Completers within 150% Time"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save data/graduation_rate/bachelors_150_time_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) Completers of bachelor's or equiv degrees total (150% of normal time)
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=12

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_bach_deg_150_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_bach_deg_150_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Degree Subcohort Completers within 150% Time"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/bachelors_deg_150_time_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) Completers of bachelor's or equiv degrees in 4 years or less
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=13

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_bach_deg_4yrs_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_bach_deg_4yrs_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Degree Subcohort Completers in <=4 Years"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/bachelors_deg_4yrs_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) Completers of bachelor's or equiv degrees in 5 years
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=14

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_bach_deg_5yrs_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_bach_deg_5yrs_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Degree Subcohort Completers in 5 Years"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/bachelors_deg_5yrs_clean.dta, replace


**** Bachelor's or equiv subcohort (4-yr institution) Completers of bachelor's or equiv degrees in 6 years
use clean_data/graduation_rate/graduation_rate_clean.dta, clear

drop if grtype!=15

* Cohort is from 6 years prior (150% time at a 4-year college)
replace year = year - 6

rename gr_* gr_bach_deg_6yrs_*

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
	
	foreach sex in `sexes' {
		if "`sex'"=="tot" {
			local cap_sex "Total"
		}
		else {
			local cap_sex = upper(substr("`sex'", 1, 1)) + substr("`sex'", 2, .)
		}
		
		label var gr_bach_deg_6yrs_`race'_`sex' "`cap_race' `cap_sex' Bachelor's Degree Subcohort Completers in 6 Years"
	}
}

xtset unitid year, yearly
sort unitid year
compress
save data/graduation_rate/bachelors_deg_6yrs_clean.dta, replace




**** Merge cohort and graduate data
**** Four Year
use clean_data/graduation_rate/four_year_adj_cohort_clean.dta, clear

merge 1:1 unitid year using data/graduation_rate/four_year_150_time_clean.dta

bysort _merge: sum

keep if _merge==3
drop _merge

keep unitid year gr_*

* Weights
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

	egen `race'_state_cohort = total(gr_cohort_`race'_tot), by(stabbr year level)
	label var `race'_state_cohort "`cap_race' Total State Cohort"
	gen prop_`race'_state_cohort = gr_cohort_`race'_tot / `race'_state_cohort
	label var prop_`race'_state_cohort "Proportion of `cap_race' Total State Cohort"
}
egen tot_state_cohort = total(gr_cohort_tot), by(stabbr year level)
label var tot_state_cohort "Total State Cohort"
gen prop_tot_state_cohort = gr_cohort_tot / tot_state_cohort
label var prop_tot_state_cohort "Proportion of Total State Cohort"

* Graduation Rates
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
	
	di "`cap_race'"

	gen gr_rate_150_`race'_men = gr_150_`race'_men / gr_cohort_`race'_men
	label var gr_rate_150_`race'_men "`cap_race' Men 150% Time Graduation Rate"
	gen gr_rate_150_`race'_wom = gr_150_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_150_`race'_wom "`cap_race' Women 150% Time Graduation Rate"
	gen gr_rate_150_`race' = gr_150_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_150_`race' "`cap_race' 150% Time Graduation Rate"
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/four_year_clean.dta, replace


**** Bachelors
use clean_data/graduation_rate/bachelors_adj_cohort_clean.dta, clear

merge 1:1 unitid year using data/graduation_rate/bachelors_150_time_clean.dta

bysort _merge: sum

drop if _merge==2
drop _merge

merge 1:1 unitid year using data/graduation_rate/bachelors_deg_150_time_clean.dta

bysort _merge: sum

drop if _merge==2
drop _merge

merge 1:1 unitid year using data/graduation_rate/bachelors_deg_4yrs_clean.dta

bysort _merge: sum

drop if _merge==2
drop _merge

merge 1:1 unitid year using data/graduation_rate/bachelors_deg_5yrs_clean.dta

bysort _merge: sum

drop if _merge==2
drop _merge

merge 1:1 unitid year using data/graduation_rate/bachelors_deg_6yrs_clean.dta

bysort _merge: sum

drop if _merge==2
drop _merge

keep unitid year gr_*


* Weights
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

	egen `race'_state_cohort = total(gr_cohort_`race'_tot), by(stabbr year level)
	label var `race'_state_cohort "`cap_race' Total State Cohort"
	gen prop_`race'_state_cohort = gr_cohort_`race'_tot / `race'_state_cohort
	label var prop_`race'_state_cohort "Proportion of `cap_race' Total State Cohort"
}
egen tot_state_cohort = total(gr_cohort_tot), by(stabbr year level)
label var tot_state_cohort "Total State Cohort"
gen prop_tot_state_cohort = gr_cohort_tot / tot_state_cohort
label var prop_tot_state_cohort "Proportion of Total State Cohort"


* Graduation Rates
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

	gen gr_rate_150_`race'_men = ///
		gr_150_`race'_men / gr_cohort_`race'_men
	label var gr_rate_150_`race'_men "`cap_race' Men Bachelor's Subcohort 150% Time Graduation Rate"
	gen gr_rate_150_`race'_wom = ///
		gr_150_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_150_`race'_wom "`cap_race' Women Bachelor's Subcohort 150% Time Graduation Rate"
	gen gr_rate_150_`race' = ///
		gr_150_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_150_`race' "`cap_race' Bachelor's Subcohort 150% Time Graduation Rate"

	gen gr_rate_bach_deg_150_`race'_men = ///
		gr_bach_deg_150_`race'_men / gr_cohort_`race'_men
	label var gr_rate_bach_deg_150_`race'_men "`cap_race' Men Bachelor's Degree Subcohort 150% Time Graduation Rate"
	gen gr_rate_bach_deg_150_`race'_wom = ///
		gr_bach_deg_150_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_bach_deg_150_`race'_wom "`cap_race' Women Bachelor's Degree Subcohort 150% Time Graduation Rate"
	gen gr_rate_bach_deg_150_`race' = ///
		gr_bach_deg_150_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_bach_deg_150_`race' "`cap_race' Bachelor's Degree Subcohort 150% Time Graduation Rate"

	gen gr_rate_bach_deg_4yrs_`race'_men = ///
		gr_bach_deg_4yrs_`race'_men / gr_cohort_`race'_men
	label var gr_rate_bach_deg_4yrs_`race'_men "`cap_race' Men Bachelor's Degree Subcohort <=4 Years Graduation Rate"
	gen gr_rate_bach_deg_4yrs_`race'_wom = ///
		gr_bach_deg_4yrs_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_bach_deg_4yrs_`race'_wom "`cap_race' Women Bachelor's Degree Subcohort <=4 Years Graduation Rate"
	gen gr_rate_bach_deg_4yrs_`race' = ///
		gr_bach_deg_4yrs_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_bach_deg_4yrs_`race' "`cap_race' Bachelor's Degree Subcohort <=4 Years Graduation Rate"

	gen gr_rate_bach_deg_5yrs_`race'_men = ///
		gr_bach_deg_5yrs_`race'_men / gr_cohort_`race'_men
	label var gr_rate_bach_deg_5yrs_`race'_men "`cap_race' Men Bachelor's Degree Subcohort 5 Years Graduation Rate"
	gen gr_rate_bach_deg_5yrs_`race'_wom = ///
		gr_bach_deg_5yrs_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_bach_deg_5yrs_`race'_wom "`cap_race' Women Bachelor's Degree Subcohort 5 Years Graduation Rate"
	gen gr_rate_bach_deg_5yrs_`race' = ///
		gr_bach_deg_5yrs_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_bach_deg_5yrs_`race' "`cap_race' Bachelor's Degree Subcohort 5 Years Graduation Rate"

	gen gr_rate_bach_deg_6yrs_`race'_men = ///
		gr_bach_deg_6yrs_`race'_men / gr_cohort_`race'_men
	label var gr_rate_bach_deg_6yrs_`race'_men "`cap_race' Men Bachelor's Degree Subcohort 6 Years Graduation Rate"
	gen gr_rate_bach_deg_6yrs_`race'_wom = ///
		gr_bach_deg_6yrs_`race'_wom / gr_cohort_`race'_wom
	label var gr_rate_bach_deg_6yrs_`race'_wom "`cap_race' Women Bachelor's Degree Subcohort 6 Years Graduation Rate"
	gen gr_rate_bach_deg_6yrs_`race' = ///
		gr_bach_deg_6yrs_`race'_tot / gr_cohort_`race'_tot
	label var gr_rate_bach_deg_6yrs_`race' "`cap_race' Bachelor's Degree Subcohort 6 Years Graduation Rate"
}

xtset unitid year, yearly
sort unitid year
compress
save clean_data/graduation_rate/bachelors_clean.dta, replace


timer off 1
timer list
log close
