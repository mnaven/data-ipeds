version 14.1
cap log close
clear all
graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color

**** First created by Matthew Naven on October 7, 2016

if c(machine_type)=="Macintosh (Intel 64-bit)" & c(username)=="Naven" {
	local home /Users/Naven/Documents/Research/data/ipeds
	local raw `home'/raw_data
	local clean `home'/clean_data
}
if c(hostname)=="sapper" {
	local home /home/users/navenm.AD3/research/data/ipeds
	local raw `home'/raw_data
	local clean `home'/clean_data
}
cd `home'

log using log_files/clean_institutional_characteristics.log, replace
timer on 1

/*
This file appends all the individual years of the institutional characteristics
datasets from IPEDS and then cleans the resulting dataset.
*/


* 1980
cd `raw'/1980
use dct_ic1980.dta, clear
gen year = 1980
label variable year "Year of Fall Semester"
tempfile ic_1980
save `ic_1980'

* 1984
cd `raw'/1984
use dct_ic1984.dta, clear
tostring gentele, replace
tostring fdgrmoyr, replace
gen year = 1984
label variable year "Year of Fall Semester"
tempfile ic_1984
save `ic_1984'

* 1985 (no data by race)
cd `raw'/1985
use dct_ic1985.dta, clear
tostring gentele, replace
tostring fdgrmoyr, replace
decode sequen, gen(temp_sequen)
drop sequen
rename temp_sequen sequen
gen year = 1985
label variable year "Year of Fall Semester"
tempfile ic_1985
save `ic_1985'

* 1986
cd `raw'/1986
use dct_ic1986_a.dta, clear
drop if unitid == 247719
tempfile dct_ic1986_a_unique
save `dct_ic1986_a_unique'
use dct_ic1986_b.dta, clear
drop if unitid == 247719
tempfile dct_ic1986_b_unique
save `dct_ic1986_b_unique'
use `dct_ic1986_a_unique', clear
merge 1:1 unitid using `dct_ic1986_b_unique'
drop _merge
decode fdgrmoyr, gen(temp_fdgrmoyr)
drop fdgrmoyr
rename temp_fdgrmoyr fdgrmoyr
decode sequen, gen(temp_sequen)
drop sequen
rename temp_sequen sequen
gen year = 1986
label variable year "Year of Fall Semester"
tempfile ic_1986
save `ic_1986'

* 1987 (no data by race)
cd `raw'/1987
use dct_ic1987_a.dta, clear
merge 1:1 unitid using dct_ic1987_b.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring gentele, replace
gen year = 1987
label variable year "Year of Fall Semester"
tempfile ic_1987
save `ic_1987'

* 1988
cd `raw'/1988
use dct_ic1988_a.dta, clear
merge 1:1 unitid using dct_ic1988_b.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring gentele, replace
encode formrt, gen(temp_formrt) label(label_formrt)
drop formrt
rename temp_formrt formrt
gen year = 1988
label variable year "Year of Fall Semester"
tempfile ic_1988
save `ic_1988'

* 1989 (no data by race)
cd `raw'/1989
use dct_ic1989_a.dta, clear
merge 1:1 unitid using dct_ic1989_b.dta
drop _merge
tostring gentele, replace
destring ffmin, replace ignore(*)
destring ffmax, replace ignore(*)
gen year = 1989
label variable year "Year of Fall Semester"
tempfile ic_1989
save `ic_1989'

* 1990
cd `raw'/1990
use dct_ic90hd.dta, clear
merge 1:1 unitid using dct_ic90abce.dta
drop _merge
merge 1:1 unitid using dct_ic90d.dta
drop _merge
tostring gentele, replace
gen year = 1990
label variable year "Year of Fall Semester"
tempfile ic_1990
save `ic_1990'

* 1991
cd `raw'/1991
use dct_ic1991_hdr.dta, clear
merge 1:1 unitid using dct_ic1991_ab.dta
drop _merge
merge 1:1 unitid using dct_ic1991_c
drop _merge
merge 1:1 unitid using dct_ic1991_d.dta
drop _merge
merge 1:1 unitid using dct_ic1991_e.dta
drop _merge
merge 1:1 unitid using dct_ic1991_f.dta
drop _merge
merge 1:1 unitid using dct_ic1991_other.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-&")
tostring gentele, replace
gen year = 1991
label variable year "Year of Fall Semester"
tempfile ic_1991
save `ic_1991'

* 1992
cd `raw'/1992
use dct_ic1992_a.dta, clear
merge 1:1 unitid using dct_ic1992_b.dta
drop _merge
if missing(agenname) {
	tostring agenname, replace
	replace agenname = "" if agenname=="."
}
if missing(agenstrt) {
	tostring agenstrt, replace
	replace agenstrt = "" if agenstrt=="."
}
if missing(agenplce) {
	tostring agenplce, replace
	replace agenplce = "" if agenplce=="."
}
if missing(agenst) {
	tostring agenst, replace
	replace agenst = "" if agenst=="."
}
gen year = 1992
label variable year "Year of Fall Semester"
tempfile ic_1992
save `ic_1992'

* 1993
cd `raw'/1993
use dct_ic1993_a.dta, clear
merge 1:1 unitid using dct_ic1993_b.dta
drop _merge
tostring gentele, replace
gen year = 1993
label variable year "Year of Fall Semester"
tempfile ic_1993
save `ic_1993'

* 1994
cd `raw'/1994
use dct_ic1994_a.dta, clear
merge 1:1 unitid using dct_ic1994_b.dta
drop _merge
tostring gentele, replace
gen year = 1994
label variable year "Year of Fall Semester"
tempfile ic_1994
save `ic_1994'

* 1995
cd `raw'/1995
use dct_ic9596_a.dta, clear
merge 1:1 unitid using dct_ic9596_b.dta
drop _merge
tostring opeid, replace
tostring gentele, replace
encode formrt, gen(temp_formrt) label(label_formrt)
drop formrt
rename temp_formrt formrt
if missing(imp3) {
	tostring imp3, replace
	replace imp3 = "" if imp3=="."
}
gen year = 1995
label variable year "Year of Fall Semester"
tempfile ic_1995
save `ic_1995'

* 1996
cd `raw'/1996
use dct_ic9697_a.dta, clear
merge 1:1 unitid using dct_ic9697_b.dta
drop _merge
merge 1:1 unitid using dct_ic9697_c.dta
drop _merge
tostring gentele, replace
encode formrt, gen(temp_formrt) label(label_formrt)
drop formrt
rename temp_formrt formrt
gen year = 1996
label variable year "Year of Fall Semester"
tempfile ic_1996
save `ic_1996'

* 1997
cd `raw'/1997
use dct_ic9798_hdr.dta, clear
merge 1:1 unitid using dct_ic9798_ab.dta
drop _merge
merge 1:1 unitid using dct_ic9798_c.dta
drop _merge
merge 1:1 unitid using dct_ic9798_d.dta
drop _merge
merge 1:1 unitid using dct_ic9798_f.dta
drop _merge
tostring gentele, replace
destring formrt, replace
encode formrt, gen(temp_formrt) label(label_formrt)
drop formrt
rename temp_formrt formrt
gen year = 1997
label variable year "Year of Fall Semester"
tempfile ic_1997
save `ic_1997'

* 1998
cd `raw'/1998
use dct_ic98hdac.dta, clear
merge 1:1 unitid using dct_ic98_ab.dta
drop _merge
merge 1:1 unitid using dct_ic98_c.dta
drop _merge
merge 1:1 unitid using dct_ic98_d.dta
drop _merge
merge 1:1 unitid using dct_ic98_f.dta
drop _merge
tostring closedat, replace
tostring gentele, replace
tostring fintele, replace
tostring admtele, replace
* dct_ic98_d
foreach var in xappfeeu xappfeeg xappfeep xciptui1 xcipsup1 xciplgt1 xciptui2 ///
	xcipsup2 xciplgt2 xciptui3 xcipsup3 xciplgt3 xciptui4 xcipsup4 xciplgt4 ///
	xciptui5 xcipsup5 xciplgt5 xciptui6 xcipsup6 xciplgt6 xtuit1 xtuit2 xtuit3 ///
	xtypugcr xtypugcn xtuit5 xtuit6 xtuit7 xtypgrcr xispro1 xospro1 xispro2 ///
	xospro2 xispro3 xospro3 xispro4 xospro4 xispro5 xospro5 xispro6 xospro6 ///
	xispro7 xospro7 xispro8 xospro8 xispro9 xospro9 xispro10 xospro10 xispro11 ///
	xospro11 xtypfpcr xroomcap xmealswk xroomamt xbordamt xrmbdamt {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "11" if `var'=="A"
			replace `var' = "30" if `var'=="B"
			replace `var' = "16" if `var'=="C"
			replace `var' = "40" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "21" if `var'=="I"
			replace `var' = "14" if `var'=="J"
			replace `var' = "15" if `var'=="M"
			replace `var' = "31" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "17" if `var'=="S"
			replace `var' = "18" if `var'=="T"
			replace `var' = "30" if `var'=="U"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 11 "Analyst corrected reported value"
			label define label_`var' 30 "Not applicable", add
			label define label_`var' 16 "Analyst corrected a cell that was previously not reported", add
			label define label_`var' 40 "Suppressed to protect confidentiality", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 21 "Imputed using method other than prior year data", add
			label define label_`var' 14 "Data adjusted in scan edits", add
			label define label_`var' 15 "Data copied from another field", add
			label define label_`var' 31 "Original data field was not reported", add
			label define label_`var' 20 "Imputed using data from prior year", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 17 "Details are adjusted to sum to total", add
			label define label_`var' 18 "Total generated to equal the sum of detail", add
			*label define label_`var' 30 "Not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 1998
label variable year "Year of Fall Semester"
tempfile ic_1998
save `ic_1998'

* 1999
cd `raw'/1999
use dct_ic99_hd.dta, clear
merge 1:1 unitid using dct_ic99abcf.dta
drop _merge
merge 1:1 unitid using dct_ip1999ay.dta
drop _merge
merge 1:1 unitid using dct_ip1999py.dta
drop _merge
merge 1:1 unitid using dct_ic99_actot.dta
drop _merge
merge 1:1 unitid using dct_ic99_d.dta
drop _merge
decode gentele, gen(temp_gentele)
drop gentele
rename temp_gentele gentele
decode fintele, gen(temp_fintele)
drop fintele
rename temp_fintele fintele
decode admtele, gen(temp_admtele)
drop admtele
rename temp_admtele admtele
*destring closedat, replace ignore("JMTS")
gen year = 1999
label variable year "Year of Fall Semester"
tempfile ic_1999
save `ic_1999'

* 2000
cd `raw'/2000
use dct_fa2000hd.dta, clear
merge 1:1 unitid using dct_ic2000.dta
drop _merge
merge 1:1 unitid using dct_ic2000_actot.dta
drop _merge
merge 1:1 unitid using dct_ic2000_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2000_py.dta
drop _merge
decode gentele, gen(temp_gentele)
drop gentele
rename temp_gentele gentele
decode admtele, gen(temp_admtele)
drop admtele
rename temp_admtele admtele
decode closedat, gen(temp_closedat)
drop closedat
rename temp_closedat closedat
gen year = 2000
label variable year "Year of Fall Semester"
tempfile ic_2000
save `ic_2000'

* 2001
cd `raw'/2001
use dct_fa2001hd.dta, clear
merge 1:1 unitid using dct_ic2001.dta
drop _merge
merge 1:1 unitid using dct_ic2001_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2001_py.dta
drop _merge
decode gentele, gen(temp_gentele)
drop gentele
rename temp_gentele gentele
decode fintele, gen(temp_fintele)
drop fintele
rename temp_fintele fintele
decode admtele, gen(temp_admtele)
drop admtele
rename temp_admtele admtele
decode closedat, gen(temp_closedat)
drop closedat
rename temp_closedat closedat
destring fybeg, replace ignore("/")
destring fyend, replace ignore("/")
* dct_ic2001_ay
foreach var in xchg1ay1 xchg1ay2 xchg1ay3 xchg2ay1 xchg2ay2 xchg2ay3 xchg3ay1 ///
	xchg3ay2 xchg3ay3 xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay1 xchg5ay2 xchg5ay3 ///
	xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay1 xchg8ay2 ///
	xchg8ay3 xchg9ay1 xchg9ay2 xchg9ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "40" if `var'=="H"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "23" if `var'=="Q"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 40 "Suppressed to protect confidentiality", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 23 "Partial imputation", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular 1st prof field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2001_py
foreach var in xchg1py1 xchg1py2 xchg1py3 xchg4py1 xchg4py2 xchg4py3 xchg5py1 ///
	xchg5py2 xchg5py3 xchg6py1 xchg6py2 xchg6py3 xchg7py1 xchg7py2 xchg7py3 ///
	xchg8py1 xchg8py2 xchg8py3 xchg9py1 xchg9py2 xchg9py3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "40" if `var'=="H"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "23" if `var'=="Q"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 40 "Suppressed to protect confidentiality", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 23 "Partial imputation", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular 1st prof field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2001
label variable year "Year of Fall Semester"
tempfile ic_2001
save `ic_2001'

* 2002
cd `raw'/2002
use dct_hd2002.dta, clear
merge 1:1 unitid using dct_ic2002.dta
drop _merge
merge 1:1 unitid using dct_ic2002_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2002_py.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
*destring closedat, replace ignore("/JMT")
gen year = 2002
label variable year "Year of Fall Semester"
tempfile ic_2002
save `ic_2002'

* 2003
cd `raw'/2003
use dct_hd2003.dta, clear
merge 1:1 unitid using dct_ic2003.dta
drop _merge
merge 1:1 unitid using dct_ic2003_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2003_py.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
*destring closedat, replace ignore("/")
gen year = 2003
label variable year "Year of Fall Semester"
tempfile ic_2003
save `ic_2003'

* 2004
cd `raw'/2004
use dct_hd2004.dta, clear
merge 1:1 unitid using dct_flags2004.dta
drop _merge
merge 1:1 unitid using dct_ic2004.dta
drop _merge
merge 1:1 unitid using dct_ic2004_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2004_py.dta
drop _merge
merge 1:1 unitid using dct_ic2004mission.dta
drop _merge
destring zip, replace ignore("-")
*destring closedat, replace ignore("/")
* dct_ic2004_ay
foreach var in xchg1ay1 xchg1ay2 xchg1ay3 xchg2ay1 xchg2ay2 xchg2ay3 xchg3ay1 ///
	xchg3ay2 xchg3ay3 xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay1 xchg5ay2 xchg5ay3 ///
	xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay1 xchg8ay2 ///
	xchg8ay3 xchg9ay1 xchg9ay2 xchg9ay3 xcmp1ay1 xcmp1ay2 xcmp1ay3 xcmp2ay1 ///
	xcmp2ay2 xcmp2ay3 xcmp3ay1 xcmp3ay2 xcmp3ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "50" if `var'=="U"
			replace `var' = "51" if `var'=="V"
			replace `var' = "52" if `var'=="W"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment based on enrollment by race and gender (part A)", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 50 "Outlier value derived from reported data", add
			label define label_`var' 51 "Outlier value derived from imputed data", add
			label define label_`var' 52 "Value not derived - parent/child differs across components", add
			label define label_`var' 33 "Particular 1st prof field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2004_py
foreach var in xchg1py1 xchg1py2 xchg1py3 xchg4py1 xchg4py2 xchg4py3 xchg5py1 ///
	xchg5py2 xchg5py3 xchg6py1 xchg6py2 xchg6py3 xchg7py1 xchg7py2 xchg7py3 ///
	xchg8py1 xchg8py2 xchg8py3 xchg9py1 xchg9py2 xchg9py3 xcmp1py1 xcmp1py2 ///
	xcmp1py3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "50" if `var'=="U"
			replace `var' = "51" if `var'=="V"
			replace `var' = "52" if `var'=="W"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment based on enrollment by race and gender (part A)", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 50 "Outlier value derived from reported data", add
			label define label_`var' 51 "Outlier value derived from imputed data", add
			label define label_`var' 52 "Value not derived - parent/child differs across components", add
			label define label_`var' 33 "Particular 1st prof field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2004
label variable year "Year of Fall Semester"
tempfile ic_2004
save `ic_2004'

* 2005
cd `raw'/2005
use dct_hd2005.dta, clear
merge 1:1 unitid using dct_flags2005.dta
drop _merge
merge 1:1 unitid using dct_ic2005.dta
drop _merge
merge 1:1 unitid using dct_ic2005_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2005_py.dta
drop _merge
merge 1:1 unitid using dct_ic2005mission.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
gen year = 2005
label variable year "Year of Fall Semester"
tempfile ic_2005
save `ic_2005'

* 2006
cd `raw'/2006
use dct_hd2006.dta, clear
merge 1:1 unitid using dct_ic2006.dta
drop _merge
merge 1:1 unitid using dct_ic2006_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2006_py.dta
drop _merge
merge 1:1 unitid using dct_ic2006mission.dta
drop _merge
merge 1:1 unitid using dct_flags2006.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring gentele, replace format(%16.0f)
tostring fintele, replace format(%16.0f)
tostring admtele, replace format(%16.0f)
gen ein_negative1 = 1 if ein=="-1"
destring ein, replace ignore("-")
replace ein = -1 if ein_negative1==1
drop ein_negative1
gen year = 2006
label variable year "Year of Fall Semester"
tempfile ic_2006
save `ic_2006'

* 2007
cd `raw'/2007
use dct_hd2007.dta, clear
merge 1:1 unitid using dct_ic2007.dta
drop _merge
merge 1:1 unitid using dct_ic2007_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2007_py.dta
drop _merge
merge 1:1 unitid using dct_ic2007mission.dta
drop _merge
merge 1:1 unitid using dct_flags2007.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring gentele, replace format(%16.0f)
gen ein_negative1 = 1 if ein=="-1"
destring ein, replace ignore("-")
replace ein = -1 if ein_negative1==1
drop ein_negative1
gen year = 2007
label variable year "Year of Fall Semester"
tempfile ic_2007
save `ic_2007'

* 2008
cd `raw'/2008
use dct_hd2008.dta, clear
merge 1:1 unitid using dct_ic2008.dta
drop _merge
merge 1:1 unitid using dct_ic2008_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2008_py.dta
drop _merge
merge 1:1 unitid using dct_flags2008.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
gen ein_negative1 = 1 if ein=="-1"
destring ein, replace ignore("-P.")
replace ein = -1 if ein_negative1==1
drop ein_negative1
gen year = 2008
label variable year "Year of Fall Semester"
tempfile ic_2008
save `ic_2008'

* 2009
cd `raw'/2009
use dct_hd2009.dta, clear
merge 1:1 unitid using dct_ic2009_rv.dta
drop _merge
merge 1:1 unitid using dct_ic2009_ay_rv.dta
drop _merge
merge 1:1 unitid using dct_ic2009_py_rv.dta
drop _merge
merge 1:1 unitid using dct_flags2009.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
gen ein_negative1 = 1 if ein=="-1"
destring ein, replace ignore("-P.")
replace ein = -1 if ein_negative1==1
drop ein_negative1
* dct_ic2009_py_rv
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xchg1py0 xchg1py1 xchg1py2 ///
	xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 xchg5py0 xchg5py1 xchg5py2 ///
	xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 xchg7py0 xchg7py1 xchg7py2 ///
	xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 xchg9py0 xchg9py1 xchg9py2 ///
	xchg9py3 xcmp1py0 xcmp1py1 xcmp1py2 xcmp1py3 xciptui2 xcipsup2 xciplgt2 ///
	xmthcmp2 xciptui3 xcipsup3 xciplgt3 xmthcmp3 xciptui4 xcipsup4 xciplgt4 ///
	xmthcmp4 xciptui5 xcipsup5 xciplgt5 xmthcmp5 xciptui6 xcipsup6 xciplgt6 ///
	xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2009_ay_rv
foreach var in xtuit1 xfee1 xhrchg1 xcmpfee1 xtuit2 xfee2 xhrchg2 xcmpfee2 ///
	xtuit3 xfee3 xhrchg3 xcmpfee3 xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 ///
	xtuit7 xfee7 xhrchg7 xchg1at0 xchg1af0 xchg1ay0 xchg1at1 xchg1af1 xchg1ay1 ///
	xchg1at2 xchg1af2 xchg1ay2 xchg1at3 xchg1af3 xchg1ay3 xchg2at0 xchg2af0 ///
	xchg2ay0 xchg2at1 xchg2af1 xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 xchg2at3 ///
	xchg2af3 xchg2ay3 xchg3at0 xchg3af0 xchg3ay0 xchg3at1 xchg3af1 xchg3ay1 ///
	xchg3at2 xchg3af2 xchg3ay2 xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 xchg4ay1 ///
	xchg4ay2 xchg4ay3 xchg5ay0 xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 xchg6ay1 ///
	xchg6ay2 xchg6ay3 xchg7ay0 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 xchg8ay1 ///
	xchg8ay2 xchg8ay3 xchg9ay0 xchg9ay1 xchg9ay2 xchg9ay3 xcmp1ay0 xcmp1ay1 ///
	xcmp1ay2 xcmp1ay3 xcmp2ay0 xcmp2ay1 xcmp2ay2 xcmp2ay3 xcmp3ay0 xcmp3ay1 ///
	xcmp3ay2 xcmp3ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2009
label variable year "Year of Fall Semester"
tempfile ic_2009
save `ic_2009'

* 2010
cd `raw'/2010
use dct_hd2010.dta, clear
merge 1:1 unitid using dct_ic2010_rv.dta
drop _merge
merge 1:1 unitid using dct_ic2010_ay_rv.dta
drop _merge
merge 1:1 unitid using dct_ic2010_py_rv.dta
drop _merge
merge 1:1 unitid using dct_flags2010.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
gen ein_negative1 = 1 if ein=="-1"
destring ein, replace ignore("-P.")
replace ein = -1 if ein_negative1==1
drop ein_negative1
* dct_ic2010_rv
foreach var in xapplcnm xapplcnw xadmssnm xadmssnw xenrlftm xenrlftw xenrlptm ///
	xenrlptw xsatnum xsatpct xactnum xactpct xsatvr25 xsatvr75 xsatmt25 xsatmt75 ///
	xsatwr25 xsatwr75 xactcm25 xactcm75 xacten25 xacten75 xactmt25 xactmt75 ///
	xactwr25 xactwr75 xappfeeu xappfeeg xroomcap xmealswk xroomamt xbordamt ///
	xrmbdamt xenrlm xenrlw xenrlt xapplcn xadmssn xenrlft xenrlpt xdisabpc {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2010_py_rv
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xchg1py0 xchg1py1 xchg1py2 ///
	xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 xchg5py0 xchg5py1 xchg5py2 ///
	xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 xchg7py0 xchg7py1 xchg7py2 ///
	xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 xchg9py0 xchg9py1 xchg9py2 ///
	xchg9py3 xcmp1py0 xcmp1py1 xcmp1py2 xcmp1py3 xciptui2 xcipsup2 xciplgt2 ///
	xmthcmp2 xciptui3 xcipsup3 xciplgt3 xmthcmp3 xciptui4 xcipsup4 xciplgt4 ///
	xmthcmp4 xciptui5 xcipsup5 xciplgt5 xmthcmp5 xciptui6 xcipsup6 xciplgt6 ///
	xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2010_ay_rv
foreach var in xtuit1 xfee1 xhrchg1 xcmpfee1 xtuit2 xfee2 xhrchg2 xcmpfee2 ///
	xtuit3 xfee3 xhrchg3 xcmpfee3 xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 ///
	xtuit7 xfee7 xhrchg7 xispro1 xispfe1 xospro1 xospfe1 xispro2 xispfe2 ///
	xospro2 xospfe2 xispro3 xispfe3 xospro3 xospfe3 xispro4 xispfe4 xospro4 ///
	xospfe4 xispro5 xispfe5 xospro5 xospfe5 xispro6 xispfe6 xospro6 xospfe6 ///
	xispro7 xispfe7 xospro7 xospfe7 xispro8 xispfe8 xospro8 xospfe8 xispro9 ///
	xispfe9 xospro9 xospfe9 xchg1at0 xchg1af0 xchg1ay0 xchg1at1 xchg1af1 ///
	xchg1ay1 xchg1at2 xchg1af2 xchg1ay2 xchg1at3 xchg1af3 xchg1ay3 xchg2at0 ///
	xchg2af0 xchg2ay0 xchg2at1 xchg2af1 xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 ///
	xchg2at3 xchg2af3 xchg2ay3 xchg3at0 xchg3af0 xchg3ay0 xchg3at1 xchg3af1 ///
	xchg3ay1 xchg3at2 xchg3af2 xchg3ay2 xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 ///
	xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay0 xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 ///
	xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay0 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 ///
	xchg8ay1 xchg8ay2 xchg8ay3 xchg9ay0 xchg9ay1 xchg9ay2 xchg9ay3 xcmp1ay0 ///
	xcmp1ay1 xcmp1ay2 xcmp1ay3 xcmp2ay0 xcmp2ay1 xcmp2ay2 xcmp2ay3 xcmp3ay0 ///
	xcmp3ay1 xcmp3ay2 xcmp3ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2010
label variable year "Year of Fall Semester"
tempfile ic_2010
save `ic_2010'

* 2011
cd `raw'/2011
use dct_hd2011.dta, clear
merge 1:1 unitid using dct_ic2011.dta
drop _merge
merge 1:1 unitid using dct_ic2011_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2011_py.dta
drop _merge
merge 1:1 unitid using dct_flags2011.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring gentele, replace format(%16.0f)
tostring opeid, replace
* dct_ic2011
foreach var in xapplcnm xapplcnw xadmssnm xadmssnw xenrlftm xenrlftw xenrlptm ///
	xenrlptw xsatnum xsatpct xactnum xactpct xsatvr25 xsatvr75 xsatmt25 xsatmt75 ///
	xsatwr25 xsatwr75 xactcm25 xactcm75 xacten25 xacten75 xactmt25 xactmt75 ///
	xactwr25 xactwr75 xappfeeu xappfeeg xroomcap xmealswk xroomamt xbordamt ///
	xrmbdamt xenrlm xenrlw xenrlt xapplcn xadmssn xenrlft xenrlpt xdisabpc {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2011_py
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xwkcmp1 xlnayhr1 xlnaywk1 ///
	xchg1py0 xchg1py1 xchg1py2 xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 ///
	xchg5py0 xchg5py1 xchg5py2 xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 ///
	xchg7py0 xchg7py1 xchg7py2 xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 ///
	xchg9py0 xchg9py1 xchg9py2 xchg9py3 xcmp1py0 xcmp1py1 xcmp1py2 xcmp1py3 ///
	xciptui2 xcipsup2 xciplgt2 xmthcmp2 xciptui3 xcipsup3 xciplgt3 xmthcmp3 ///
	xciptui4 xcipsup4 xciplgt4 xmthcmp4 xciptui5 xcipsup5 xciplgt5 xmthcmp5 ///
	xciptui6 xcipsup6 xciplgt6 xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2011_ay
foreach var in xtuit1 xfee1 xhrchg1 xcmpfee1 xtuit2 xfee2 xhrchg2 xcmpfee2 ///
	xtuit3 xfee3 xhrchg3 xcmpfee3 xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 ///
	xtuit7 xfee7 xhrchg7 xispro1 xispfe1 xospro1 xospfe1 xispro2 xispfe2 ///
	xospro2 xospfe2 xispro3 xispfe3 xospro3 xospfe3 xispro4 xispfe4 xospro4 ///
	xospfe4 xispro5 xispfe5 xospro5 xospfe5 xispro6 xispfe6 xospro6 xospfe6 ///
	xispro7 xispfe7 xospro7 xospfe7 xispro8 xispfe8 xospro8 xospfe8 xispro9 ///
	xispfe9 xospro9 xospfe9 xchg1at0 xchg1af0 xchg1ay0 xchg1at1 xchg1af1 ///
	xchg1ay1 xchg1at2 xchg1af2 xchg1ay2 xchg1at3 xchg1af3 xchg1ay3 xchg2at0 ///
	xchg2af0 xchg2ay0 xchg2at1 xchg2af1 xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 ///
	xchg2at3 xchg2af3 xchg2ay3 xchg3at0 xchg3af0 xchg3ay0 xchg3at1 xchg3af1 ///
	xchg3ay1 xchg3at2 xchg3af2 xchg3ay2 xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 ///
	xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay0 xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 ///
	xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay0 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 ///
	xchg8ay1 xchg8ay2 xchg8ay3 xchg9ay0 xchg9ay1 xchg9ay2 xchg9ay3 xcmp1ay0 ///
	xcmp1ay1 xcmp1ay2 xcmp1ay3 xcmp2ay0 xcmp2ay1 xcmp2ay2 xcmp2ay3 xcmp3ay0 ///
	xcmp3ay1 xcmp3ay2 xcmp3ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2011
label variable year "Year of Fall Semester"
tempfile ic_2011
save `ic_2011'

* 2012
cd `raw'/2012
use dct_hd2012.dta, clear
merge 1:1 unitid using dct_ic2012.dta
drop _merge
merge 1:1 unitid using dct_ic2012_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2012_py.dta
drop _merge
merge 1:1 unitid using dct_flags2012.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
* dct_ic2012
foreach var in xapplcnm xapplcnw xadmssnm xadmssnw xenrlftm xenrlftw xenrlptm ///
	xenrlptw xsatnum xsatpct xactnum xactpct xsatvr25 xsatvr75 xsatmt25 xsatmt75 ///
	xsatwr25 xsatwr75 xactcm25 xactcm75 xacten25 xacten75 xactmt25 xactmt75 ///
	xactwr25 xactwr75 xappfeeu xappfeeg xroomcap xmealswk xroomamt xbordamt ///
	xrmbdamt xenrlm xenrlw xenrlt xapplcn xadmssn xenrlft xenrlpt xdisabpc {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2012_py
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xwkcmp1 xlnayhr1 xlnaywk1 ///
	xchg1py0 xchg1py1 xchg1py2 xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 ///
	xchg5py0 xchg5py1 xchg5py2 xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 ///
	xchg7py0 xchg7py1 xchg7py2 xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 ///
	xchg9py0 xchg9py1 xchg9py2 xchg9py3 xcmp1py0 xcmp1py1 xcmp1py2 xcmp1py3 ///
	xciptui2 xcipsup2 xciplgt2 xmthcmp2 xciptui3 xcipsup3 xciplgt3 xmthcmp3 ///
	xciptui4 xcipsup4 xciplgt4 xmthcmp4 xciptui5 xcipsup5 xciplgt5 xmthcmp5 ///
	xciptui6 xcipsup6 xciplgt6 xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2012_ay
foreach var in xtuit1 xfee1 xhrchg1 xcmpfee1 xtuit2 xfee2 xhrchg2 xcmpfee2 ///
	xtuit3 xfee3 xhrchg3 xcmpfee3 xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 ///
	xtuit7 xfee7 xhrchg7 xispro1 xispfe1 xospro1 xospfe1 xispro2 xispfe2 ///
	xospro2 xospfe2 xispro3 xispfe3 xospro3 xospfe3 xispro4 xispfe4 xospro4 ///
	xospfe4 xispro5 xispfe5 xospro5 xospfe5 xispro6 xispfe6 xospro6 xospfe6 ///
	xispro7 xispfe7 xospro7 xospfe7 xispro8 xispfe8 xospro8 xospfe8 xispro9 ///
	xispfe9 xospro9 xospfe9 xchg1at0 xchg1af0 xchg1ay0 xchg1at1 xchg1af1 ///
	xchg1ay1 xchg1at2 xchg1af2 xchg1ay2 xchg1at3 xchg1af3 xchg1ay3 xchg2at0 ///
	xchg2af0 xchg2ay0 xchg2at1 xchg2af1 xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 ///
	xchg2at3 xchg2af3 xchg2ay3 xchg3at0 xchg3af0 xchg3ay0 xchg3at1 xchg3af1 ///
	xchg3ay1 xchg3at2 xchg3af2 xchg3ay2 xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 ///
	xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay0 xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 ///
	xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay0 xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 ///
	xchg8ay1 xchg8ay2 xchg8ay3 xchg9ay0 xchg9ay1 xchg9ay2 xchg9ay3 xcmp1ay0 ///
	xcmp1ay1 xcmp1ay2 xcmp1ay3 xcmp2ay0 xcmp2ay1 xcmp2ay2 xcmp2ay3 xcmp3ay0 ///
	xcmp3ay1 xcmp3ay2 xcmp3ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
tostring opeid, replace
gen year = 2012
label variable year "Year of Fall Semester"
tempfile ic_2012
save `ic_2012'

* 2013
cd `raw'/2013
use dct_hd2013.dta, clear
merge 1:1 unitid using dct_ic2013.dta
drop _merge
merge 1:1 unitid using dct_ic2013_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2013_py.dta
drop _merge
merge 1:1 unitid using dct_flags2013.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring opeid, replace
* dct_ic2013
foreach var in xapplcnm xapplcnw xadmssnm xadmssnw xenrlftm xenrlftw xenrlptm ///
	xenrlptw xsatnum xsatpct xactnum xactpct xsatvr25 xsatvr75 xsatmt25 ///
	xsatmt75 xsatwr25 xsatwr75 xactcm25 xactcm75 xacten25 xacten75 xactmt25 ///
	xactmt75 xactwr25 xactwr75 xappfeeu xappfeeg xroomcap xmealswk xroomamt ///
	xbordamt xrmbdamt xenrlm xenrlw xenrlt xapplcn xadmssn xenrlft xenrlpt ///
	xdisabpc {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2013_py
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xwkcmp1 xlnayhr1 xlnaywk1 ///
	xchg1py0 xchg1py1 xchg1py2 xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 ///
	xchg5py0 xchg5py1 xchg5py2 xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 ///
	xchg7py0 xchg7py1 xchg7py2 xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 ///
	xchg9py0 xchg9py1 xchg9py2 xchg9py3 xciptui2 xcipsup2 xciplgt2 xmthcmp2 ///
	xciptui3 xcipsup3 xciplgt3 xmthcmp3 xciptui4 xcipsup4 xciplgt4 xmthcmp4 ///
	xciptui5 xcipsup5 xciplgt5 xmthcmp5 xciptui6 xcipsup6 xciplgt6 xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2013_ay
foreach var in xtuit1 xfee1 xhrchg1 xtuit2 xfee2 xhrchg2 xtuit3 xfee3 xhrchg3 ///
	xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 xtuit7 xfee7 xhrchg7 xispro1 ///
	xispfe1 xospro1 xospfe1 xispro2 xispfe2 xospro2 xospfe2 xispro3 xispfe3 ///
	xospro3 xospfe3 xispro4 xispfe4 xospro4 xospfe4 xispro5 xispfe5 xospro5 ///
	xospfe5 xispro6 xispfe6 xospro6 xospfe6 xispro7 xispfe7 xospro7 xospfe7 ///
	xispro8 xispfe8 xospro8 xospfe8 xispro9 xispfe9 xospro9 xospfe9 xchg1at0 ///
	xchg1af0 xchg1ay0 xchg1at1 xchg1af1 xchg1ay1 xchg1at2 xchg1af2 xchg1ay2 ///
	xchg1at3 xchg1af3 xchg1ay3 xchg2at0 xchg2af0 xchg2ay0 xchg2at1 xchg2af1 ///
	xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 xchg2at3 xchg2af3 xchg2ay3 xchg3at0 ///
	xchg3af0 xchg3ay0 xchg3at1 xchg3af1 xchg3ay1 xchg3at2 xchg3af2 xchg3ay2 ///
	xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay0 ///
	xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay0 ///
	xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 xchg8ay1 xchg8ay2 xchg8ay3 xchg9ay0 ///
	xchg9ay1 xchg9ay2 xchg9ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2013
label variable year "Year of Fall Semester"
tempfile ic_2013
save `ic_2013'

* 2014
cd `raw'/2014
use dct_hd2014.dta, clear
merge 1:1 unitid using dct_ic2014.dta
drop _merge
merge 1:1 unitid using dct_ic2014_ay.dta
drop _merge
merge 1:1 unitid using dct_ic2014_py.dta
drop _merge
merge 1:1 unitid using dct_flags2014.dta
drop _merge
*replace zip = regexs(1) if regexm(zip, "([0-9][0-9][0-9][0-9][0-9])-?([0-9][0-9][0-9][0-9])")
destring zip, replace ignore("-")
tostring opeid, replace
* dct_ic2014
foreach var in xapplcnm xapplcnw xadmssnm xadmssnw xenrlftm xenrlftw xenrlptm ///
	xenrlptw xsatnum xsatpct xactnum xactpct xsatvr25 xsatvr75 xsatmt25 ///
	xsatmt75 xsatwr25 xsatwr75 xactcm25 xactcm75 xacten25 xacten75 xactmt25 ///
	xactmt75 xactwr25 xactwr75 xappfeeu xappfeeg xroomcap xmealswk xroomamt ///
	xbordamt xrmbdamt xenrlm xenrlw xenrlt xapplcn xadmssn xenrlft xenrlpt ///
	xdisabpc {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2014_py
foreach var in xciptui1 xcipsup1 xciplgt1 xmthcmp1 xwkcmp1 xlnayhr1 xlnaywk1 ///
	xchg1py0 xchg1py1 xchg1py2 xchg1py3 xchg4py0 xchg4py1 xchg4py2 xchg4py3 ///
	xchg5py0 xchg5py1 xchg5py2 xchg5py3 xchg6py0 xchg6py1 xchg6py2 xchg6py3 ///
	xchg7py0 xchg7py1 xchg7py2 xchg7py3 xchg8py0 xchg8py1 xchg8py2 xchg8py3 ///
	xchg9py0 xchg9py1 xchg9py2 xchg9py3 xciptui2 xcipsup2 xciplgt2 xmthcmp2 ///
	xciptui3 xcipsup3 xciplgt3 xmthcmp3 xciptui4 xcipsup4 xciplgt4 xmthcmp4 ///
	xciptui5 xcipsup5 xciplgt5 xmthcmp5 xciptui6 xcipsup6 xciplgt6 xmthcmp6 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
* dct_ic2014_ay
foreach var in xtuit1 xfee1 xhrchg1 xtuit2 xfee2 xhrchg2 xtuit3 xfee3 xhrchg3 ///
	xtuit5 xfee5 xhrchg5 xtuit6 xfee6 xhrchg6 xtuit7 xfee7 xhrchg7 xispro1 ///
	xispfe1 xospro1 xospfe1 xispro2 xispfe2 xospro2 xospfe2 xispro3 xispfe3 ///
	xospro3 xospfe3 xispro4 xispfe4 xospro4 xospfe4 xispro5 xispfe5 xospro5 ///
	xospfe5 xispro6 xispfe6 xospro6 xospfe6 xispro7 xispfe7 xospro7 xospfe7 ///
	xispro8 xispfe8 xospro8 xospfe8 xispro9 xispfe9 xospro9 xospfe9 xchg1at0 ///
	xchg1af0 xchg1ay0 xchg1at1 xchg1af1 xchg1ay1 xchg1at2 xchg1af2 xchg1ay2 ///
	xchg1at3 xchg1af3 xchg1ay3 xchg2at0 xchg2af0 xchg2ay0 xchg2at1 xchg2af1 ///
	xchg2ay1 xchg2at2 xchg2af2 xchg2ay2 xchg2at3 xchg2af3 xchg2ay3 xchg3at0 ///
	xchg3af0 xchg3ay0 xchg3at1 xchg3af1 xchg3ay1 xchg3at2 xchg3af2 xchg3ay2 ///
	xchg3at3 xchg3af3 xchg3ay3 xchg4ay0 xchg4ay1 xchg4ay2 xchg4ay3 xchg5ay0 ///
	xchg5ay1 xchg5ay2 xchg5ay3 xchg6ay0 xchg6ay1 xchg6ay2 xchg6ay3 xchg7ay0 ///
	xchg7ay1 xchg7ay2 xchg7ay3 xchg8ay0 xchg8ay1 xchg8ay2 xchg8ay3 xchg9ay0 ///
	xchg9ay1 xchg9ay2 xchg9ay3 {
		capture confirm string variable `var'
		if !_rc {
			replace `var' = upper(ltrim(rtrim(`var')))
			replace `var' = "30" if `var'=="A"
			replace `var' = "31" if `var'=="B"
			replace `var' = "11" if `var'=="C"
			replace `var' = "32" if `var'=="D"
			replace `var' = "12" if `var'=="G"
			replace `var' = "53" if `var'=="H"
			replace `var' = "23" if `var'=="J"
			replace `var' = "24" if `var'=="K"
			replace `var' = "22" if `var'=="L"
			replace `var' = "21" if `var'=="N"
			replace `var' = "20" if `var'=="P"
			replace `var' = "10" if `var'=="R"
			replace `var' = "33" if `var'=="Y"
			replace `var' = "13" if `var'=="Z"
			destring `var', replace
			label define label_`var' 30 "Not applicable"
			label define label_`var' 31 "Institution left item blank", add
			label define label_`var' 11 "Analyst corrected reported value", add
			label define label_`var' 32 "Do not know", add
			label define label_`var' 12 "Data generated from other data values", add
			label define label_`var' 53 "Value not derived - data not usable", add
			label define label_`var' 23 "Logical imputation", add
			label define label_`var' 24 "Ratio adjustment", add
			label define label_`var' 22 "Imputed using the Group Median procedure", add
			label define label_`var' 21 "Imputed using Nearest Neighbor procedure", add
			label define label_`var' 20 "Imputed using Carry Forward procedure", add
			label define label_`var' 10 "Reported", add
			label define label_`var' 33 "Particular Doctor's professional practice field not applicable", add
			label define label_`var' 13 "Implied zero", add
			label values `var' label_`var'
		}
}
gen year = 2014
label variable year "Year of Fall Semester"
tempfile ic_2014
save `ic_2014'
/*
* 2015
cd `raw'/2015
use , clear
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:1 unitid using 
*keep if _merge == 3
drop _merge
merge 1:m unitid using 
*keep if _merge == 3
drop _merge
gen year = 2015
label variable year "Year of Fall Semester"
*compress
tempfile ic_2015
save `ic_2015'
*/


use `ic_2014', clear
forvalues data_year = 2013 (-1) 1984 {
	di `data_year'
	append using "`ic_`data_year''"
}
append using `ic_1980'

compress
sort unitid year
save `clean'/institutional_characteristics_clean.dta, replace

log close
