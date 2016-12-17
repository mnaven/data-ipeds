version 14.1
cap log close
clear all
graph drop _all
set more off
set varabbrev off
set graphics off
set scheme s1color

**** First created by Matthew Naven on November 10, 2016

if c(machine_type)=="Macintosh (Intel 64-bit)" & c(username)=="Naven" {
	local home /Users/Naven/Documents/research/data/ipeds
	local raw `home'/raw_data
	local clean `home'/clean_data
}
if c(hostname)=="sapper" {
	local home /home/users/navenm.AD3/research/data/ipeds
	local raw `home'/raw_data
	local clean `home'/clean_data
}
cd `home'

log using log_files/clean_directory_information.log, replace
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
tempfile hd_1980
save `hd_1980'

* 1984
cd `raw'/1984
use dct_ic1984.dta, clear
*tostring gentele, replace
*tostring fdgrmoyr, replace
gen year = 1984
label variable year "Year of Fall Semester"
tempfile hd_1984
save `hd_1984'

* 1985 (no data by race)
cd `raw'/1985
use dct_ic1985.dta, clear
*tostring gentele, replace
*tostring fdgrmoyr, replace
decode sequen, gen(temp_sequen)
drop sequen
rename temp_sequen sequen
gen year = 1985
label variable year "Year of Fall Semester"
tempfile hd_1985
save `hd_1985'

* 1986
cd `raw'/1986
use dct_ic1986_a.dta, clear
drop if unitid == 247719
*decode fdgrmoyr, gen(temp_fdgrmoyr)
*drop fdgrmoyr
*rename temp_fdgrmoyr fdgrmoyr
*decode sequen, gen(temp_sequen)
*drop sequen
*rename temp_sequen sequen
gen year = 1986
label variable year "Year of Fall Semester"
tempfile hd_1986
save `hd_1986'

* 1987 (no data by race)
cd `raw'/1987
use dct_ic1987_a.dta, clear
*tostring gentele, replace
gen year = 1987
label variable year "Year of Fall Semester"
tempfile hd_1987
save `hd_1987'

* 1988
cd `raw'/1988
use dct_ic1988_a.dta, clear
*tostring gentele, replace
*encode formrt, gen(temp_formrt) label(label_formrt)
*drop formrt
*rename temp_formrt formrt
gen year = 1988
label variable year "Year of Fall Semester"
tempfile hd_1988
save `hd_1988'

* 1989 (no data by race)
cd `raw'/1989
use dct_ic1989_a.dta, clear
*tostring gentele, replace
*destring ffmin, replace ignore(*)
*destring ffmax, replace ignore(*)
gen year = 1989
label variable year "Year of Fall Semester"
tempfile hd_1989
save `hd_1989'

* 1990
cd `raw'/1990
use dct_ic90hd.dta, clear
*tostring gentele, replace
gen year = 1990
label variable year "Year of Fall Semester"
tempfile hd_1990
save `hd_1990'

* 1991
cd `raw'/1991
use dct_ic1991_hdr.dta, clear
*tostring gentele, replace
gen year = 1991
label variable year "Year of Fall Semester"
tempfile hd_1991
save `hd_1991'

* 1992
cd `raw'/1992
use dct_ic1992_a.dta, clear
*if missing(agenname) {
*	tostring agenname, replace
*	replace agenname = "" if agenname=="."
*}
*if missing(agenstrt) {
*	tostring agenstrt, replace
*	replace agenstrt = "" if agenstrt=="."
*}
*if missing(agenplce) {
*	tostring agenplce, replace
*	replace agenplce = "" if agenplce=="."
*}
*if missing(agenst) {
*	tostring agenst, replace
*	replace agenst = "" if agenst=="."
*}
gen year = 1992
label variable year "Year of Fall Semester"
tempfile hd_1992
save `hd_1992'

* 1993
cd `raw'/1993
use dct_ic1993_a.dta, clear
*tostring gentele, replace
gen year = 1993
label variable year "Year of Fall Semester"
tempfile hd_1993
save `hd_1993'

* 1994
cd `raw'/1994
use dct_ic1994_a.dta, clear
*tostring gentele, replace
gen year = 1994
label variable year "Year of Fall Semester"
tempfile hd_1994
save `hd_1994'

* 1995
cd `raw'/1995
use dct_ic9596_a.dta, clear
*tostring opeid, replace
*tostring gentele, replace
*encode formrt, gen(temp_formrt) label(label_formrt)
*drop formrt
*rename temp_formrt formrt
*if missing(imp3) {
*	tostring imp3, replace
*	replace imp3 = "" if imp3=="."
*}
gen year = 1995
label variable year "Year of Fall Semester"
tempfile hd_1995
save `hd_1995'

* 1996
cd `raw'/1996
use dct_ic9697_a.dta, clear
*tostring gentele, replace
*encode formrt, gen(temp_formrt) label(label_formrt)
*drop formrt
*rename temp_formrt formrt
gen year = 1996
label variable year "Year of Fall Semester"
tempfile hd_1996
save `hd_1996'

* 1997
cd `raw'/1997
use dct_ic9798_hdr.dta, clear
*tostring gentele, replace
*destring formrt, replace
*encode formrt, gen(temp_formrt) label(label_formrt)
*drop formrt
*rename temp_formrt formrt
gen year = 1997
label variable year "Year of Fall Semester"
tempfile hd_1997
save `hd_1997'

* 1998
cd `raw'/1998
use dct_ic98hdac.dta, clear
*tostring closedat, replace
*tostring gentele, replace
*tostring fintele, replace
*tostring admtele, replace
gen year = 1998
label variable year "Year of Fall Semester"
tempfile hd_1998
save `hd_1998'

* 1999
cd `raw'/1999
use dct_ic99_hd.dta, clear
*decode gentele, gen(temp_gentele)
*drop gentele
*rename temp_gentele gentele
*decode fintele, gen(temp_fintele)
*drop fintele
*rename temp_fintele fintele
*decode admtele, gen(temp_admtele)
*drop admtele
*rename temp_admtele admtele
*destring closedat, replace ignore("JMTS")
gen year = 1999
label variable year "Year of Fall Semester"
tempfile hd_1999
save `hd_1999'

* 2000
cd `raw'/2000
use dct_fa2000hd.dta, clear
*decode gentele, gen(temp_gentele)
*drop gentele
*rename temp_gentele gentele
*decode admtele, gen(temp_admtele)
*drop admtele
*rename temp_admtele admtele
*decode closedat, gen(temp_closedat)
*drop closedat
*rename temp_closedat closedat
gen year = 2000
label variable year "Year of Fall Semester"
tempfile hd_2000
save `hd_2000'

* 2001
cd `raw'/2001
use dct_fa2001hd.dta, clear
*decode gentele, gen(temp_gentele)
*drop gentele
*rename temp_gentele gentele
*decode fintele, gen(temp_fintele)
*drop fintele
*rename temp_fintele fintele
*decode admtele, gen(temp_admtele)
*drop admtele
*rename temp_admtele admtele
*decode closedat, gen(temp_closedat)
*drop closedat
*rename temp_closedat closedat
*destring fybeg, replace ignore("/")
*destring fyend, replace ignore("/")
gen year = 2001
label variable year "Year of Fall Semester"
tempfile hd_2001
save `hd_2001'

* 2002
cd `raw'/2002
use dct_hd2002.dta, clear
*destring closedat, replace ignore("/JMT")
gen year = 2002
label variable year "Year of Fall Semester"
tempfile hd_2002
save `hd_2002'

* 2003
cd `raw'/2003
use dct_hd2003.dta, clear
*destring closedat, replace ignore("/")
gen year = 2003
label variable year "Year of Fall Semester"
tempfile hd_2003
save `hd_2003'

* 2004
cd `raw'/2004
use dct_hd2004.dta, clear
*destring closedat, replace ignore("/")
gen year = 2004
label variable year "Year of Fall Semester"
tempfile hd_2004
save `hd_2004'

* 2005
cd `raw'/2005
use dct_hd2005.dta, clear
gen year = 2005
label variable year "Year of Fall Semester"
tempfile hd_2005
save `hd_2005'

* 2006
cd `raw'/2006
use dct_hd2006.dta, clear
*tostring gentele, replace format(%16.0f)
*tostring fintele, replace format(%16.0f)
*tostring admtele, replace format(%16.0f)
*gen ein_negative1 = 1 if ein=="-1"
*destring ein, replace ignore("-")
*replace ein = -1 if ein_negative1==1
*drop ein_negative1
gen year = 2006
label variable year "Year of Fall Semester"
tempfile hd_2006
save `hd_2006'

* 2007
cd `raw'/2007
use dct_hd2007.dta, clear
*tostring gentele, replace format(%16.0f)
*gen ein_negative1 = 1 if ein=="-1"
*destring ein, replace ignore("-")
*replace ein = -1 if ein_negative1==1
*drop ein_negative1
gen year = 2007
label variable year "Year of Fall Semester"
tempfile hd_2007
save `hd_2007'

* 2008
cd `raw'/2008
use dct_hd2008.dta, clear
*gen ein_negative1 = 1 if ein=="-1"
*destring ein, replace ignore("-P.")
*replace ein = -1 if ein_negative1==1
*drop ein_negative1
gen year = 2008
label variable year "Year of Fall Semester"
tempfile hd_2008
save `hd_2008'

* 2009
cd `raw'/2009
use dct_hd2009.dta, clear
*gen ein_negative1 = 1 if ein=="-1"
*destring ein, replace ignore("-P.")
*replace ein = -1 if ein_negative1==1
*drop ein_negative1
gen year = 2009
label variable year "Year of Fall Semester"
tempfile hd_2009
save `hd_2009'

* 2010
cd `raw'/2010
use dct_hd2010.dta, clear
*gen ein_negative1 = 1 if ein=="-1"
*destring ein, replace ignore("-P.")
*replace ein = -1 if ein_negative1==1
*drop ein_negative1
gen year = 2010
label variable year "Year of Fall Semester"
tempfile hd_2010
save `hd_2010'

* 2011
cd `raw'/2011
use dct_hd2011.dta, clear
*tostring gentele, replace format(%16.0f)
*tostring opeid, replace
gen year = 2011
label variable year "Year of Fall Semester"
tempfile hd_2011
save `hd_2011'

* 2012
cd `raw'/2012
use dct_hd2012.dta, clear
*tostring opeid, replace
gen year = 2012
label variable year "Year of Fall Semester"
tempfile hd_2012
save `hd_2012'

* 2013
cd `raw'/2013
use dct_hd2013.dta, clear
*tostring opeid, replace
gen year = 2013
label variable year "Year of Fall Semester"
tempfile hd_2013
save `hd_2013'

* 2014
cd `raw'/2014
use dct_hd2014.dta, clear
*tostring opeid, replace
gen year = 2014
label variable year "Year of Fall Semester"
tempfile hd_2014
save `hd_2014'

* 2015
cd `raw'/2015
use dct_hd2015.dta, clear
gen year = 2015
label variable year "Year of Fall Semester"
tempfile hd_2015
save `hd_2015'




use `hd_2015', clear
forvalues data_year = 2014 (-1) 1984 {
	di `data_year'
	append using "`hd_`data_year''"
}
append using `hd_1980'

compress
order unitid year
sort unitid year
xtset unitid year, yearly
label data "IPEDS Directory Information"
save `clean'/directory_information_clean.dta, replace


timer off 1
timer list
log close


if c(hostname)=="sapper" {
	exit, STATA clear
}
