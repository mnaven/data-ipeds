version 14.1
cap log close
clear all
graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color

**** First created by Matthew Naven on October 23, 2015

if c(machine_type)=="Macintosh (Intel 64-bit)" & c(username)=="Naven" {
	local home /Users/Naven/Documents/research/data/ipeds
}
if c(hostname)=="sapper" {
	global S_ADO BASE;.;PERSONAL;PLUS;SITE;OLDPLACE
	local home /home/users/navenm.AD3/research/data/ipeds
}
cd `home'

log using log_files/append_fall_enrollment_race_gender_attendance_level.log, replace
timer on 1


/*
This file appends all the individual years of the fall enrollment by 
race/ethnicity, gender, attendance status, and level of student datasets from 
IPEDS and then cleans the resulting dataset.
*/


* 1980
use clean_data/1980/dct_ef1980_a.dta, clear
*recode line 1=8 2=1 3=2 4=3 5=4 6=5 12=11 13=12 15=22 16=15 17=16 24=23 26=25 27=26
gen year = 1980
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1980
save `fall_enrollment_1980'

* 1984
use clean_data/1984/dct_ef1984.dta, clear
*recode line 1=8 2=1 3=2 4=3 5=4 6=5 12=11 13=12 15=22 16=15 17=16 24=23 26=25 27=26
gen year = 1984
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1984
save `fall_enrollment_1984'

* 1986
use clean_data/1986/dct_ef1986_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1986
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1986
save `fall_enrollment_1986'

* 1988
use clean_data/1988/dct_ef1988_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1988
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1988
save `fall_enrollment_1988'

* 1990
use clean_data/1990/dct_ef90_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1990
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1990
save `fall_enrollment_1990'

* 1991
use clean_data/1991/dct_ef1991_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1991
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1991
save `fall_enrollment_1991'

* 1992
use clean_data/1992/dct_ef1992_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1992
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1992
save `fall_enrollment_1992'

* 1993
use clean_data/1993/dct_ef1993_a.dta, clear
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1993
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1993
save `fall_enrollment_1993'

* 1994
*use clean_data/1994/dct_ef1994_anr.dta, clear // not raked
use clean_data/1994/dct_ef1994_ark.dta, clear // raked
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1994
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1994
save `fall_enrollment_1994'

* 1995
*use clean_data/1995/dct_ef95_anr.dta, clear // not raked
use clean_data/1995/dct_ef95_ark.dta, clear // raked
/*tostring filler3, replace*/
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1995
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1995
save `fall_enrollment_1995'

* 1996
*use clean_data/1996/dct_ef96_anr.dta, clear // not raked
use clean_data/1996/dct_ef96_ark.dta, clear // raked
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
destring lstudy, replace
gen year = 1996
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1996
save `fall_enrollment_1996'

* 1997
*use clean_data/1997/dct_ef97_anr.dta, clear // not raked
use clean_data/1997/dct_ef97_ark.dta, clear // raked
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "5" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1997
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1997
save `fall_enrollment_1997'

* 1998
*use clean_data/1998/dct_ef98_anr.dta, clear // not raked
use clean_data/1998/dct_ef98_ark.dta, clear // raked
replace lstudy = "1" if lstudy=="A"
replace lstudy = "2" if lstudy=="B"
replace lstudy = "3" if lstudy=="C"
replace lstudy = "5" if lstudy=="D"
replace lstudy = "4" if lstudy=="E"
destring lstudy, replace
gen year = 1998
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1998
save `fall_enrollment_1998'

* 1999
use clean_data/1999/dct_ef99_anr.dta, clear // not raked?
gen year = 1999
label variable year "Year of Fall Semester"
tempfile fall_enrollment_1999
save `fall_enrollment_1999'

* 2000
use clean_data/2000/dct_ef2000a.dta, clear
gen year = 2000
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2000
save `fall_enrollment_2000'

* 2001
use clean_data/2001/dct_ef2001a.dta, clear
gen year = 2001
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2001
save `fall_enrollment_2001'

* 2002
use clean_data/2002/dct_ef2002a.dta, clear
gen year = 2002
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2002
save `fall_enrollment_2002'

* 2003
use clean_data/2003/dct_ef2003a.dta, clear
gen year = 2003
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2003
save `fall_enrollment_2003'

* 2004
use clean_data/2004/dct_ef2004a.dta, clear
gen year = 2004
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2004
save `fall_enrollment_2004'

* 2005
use clean_data/2005/dct_ef2005a.dta, clear
gen year = 2005
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2005
save `fall_enrollment_2005'

* 2006
use clean_data/2006/dct_ef2006a.dta, clear
gen year = 2006
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2006
save `fall_enrollment_2006'

* 2007
use clean_data/2007/dct_ef2007a.dta, clear
gen year = 2007
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2007
save `fall_enrollment_2007'

* 2008
use clean_data/2008/dct_ef2008a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2008
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2008
save `fall_enrollment_2008'

* 2009
use clean_data/2009/dct_ef2009a_rv.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2009
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2009
save `fall_enrollment_2009'

* 2010
use clean_data/2010/dct_ef2010a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2010
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2010
save `fall_enrollment_2010'

* 2011
use clean_data/2011/dct_ef2011a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2011
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2011
save `fall_enrollment_2011'

* 2012
use clean_data/2012/dct_ef2012a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2012
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2012
save `fall_enrollment_2012'

* 2013
use clean_data/2013/dct_ef2013a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2013
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2013
save `fall_enrollment_2013'

* 2014
use clean_data/2014/dct_ef2014a.dta, clear
label def xef 30 "Not applicable"
label def xef 31 "Institution left item blank", add
label def xef 11 "Analyst corrected reported value", add
label def xef 32 "Do not know", add
label def xef 12 "Data generated from other data values", add
label def xef 53 "Value not derived - data not usable", add
label def xef 23 "Logical imputation", add
label def xef 24 "Ratio adjustment", add
label def xef 22 "Imputed using the Group Median procedure", add
label def xef 21 "Imputed using Nearest Neighbor procedure", add
label def xef 20 "Imputed using Carry Forward procedure", add
label def xef 10 "Reported", add
label def xef 13 "Implied zero", add
foreach race_imp of varlist xef* {
	replace `race_imp' = "30" if `race_imp'=="A"
	replace `race_imp' = "31" if `race_imp'=="B"
	replace `race_imp' = "11" if `race_imp'=="C"
	replace `race_imp' = "32" if `race_imp'=="D"
	replace `race_imp' = "12" if `race_imp'=="G"
	replace `race_imp' = "53" if `race_imp'=="H"
	replace `race_imp' = "23" if `race_imp'=="J"
	replace `race_imp' = "24" if `race_imp'=="K"
	replace `race_imp' = "22" if `race_imp'=="L"
	replace `race_imp' = "21" if `race_imp'=="N"
	replace `race_imp' = "20" if `race_imp'=="P"
	replace `race_imp' = "10" if `race_imp'=="R"
	replace `race_imp' = "13" if `race_imp'=="Z"
	destring `race_imp', replace
}
gen year = 2014
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2014
save `fall_enrollment_2014'

* 2015
/*use clean_data/2015/, clear
gen year = 2015
label variable year "Year of Fall Semester"
tempfile fall_enrollment_2015
save `fall_enrollment_2015'*/




use `fall_enrollment_2014', clear
forvalues data_year = 2014 (-1) 1990 {
	di `data_year'
	append using "`fall_enrollment_`data_year''"
}
append using `fall_enrollment_1988'
append using `fall_enrollment_1986'
append using `fall_enrollment_1984'
append using `fall_enrollment_1980'

compress
order unitid year lstudy section efalevel line
sort unitid year lstudy section efalevel line
save clean_data/fall_enrollment_race_gender_attendance_level.dta, replace


timer off 1
timer list
log close


if c(hostname)=="sapper" {
	exit, STATA clear
}
