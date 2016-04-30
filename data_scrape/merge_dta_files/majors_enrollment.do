version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/majors_enrollment.log", replace

* 1980
cd "$raw/1980"
use dct_ef1980_acp.dta, clear
gen year = 1980
*compress
tempfile majors_1980
save `majors_1980'

* 1984 (no data)

* 1985 (no data)

* 1986
cd "$raw/1986"
use dct_ef1986_ic.dta, clear
merge 1:m unitid using dct_ef1986_acp.dta
drop _merge
merge m:1 unitid using dct_ef1986_d.dta
drop _merge
gen year = 1986
*compress
tempfile majors_1986
save `majors_1986'

* 1987 (no data)

* 1988 (no data)

* 1989 (no data)

* 1990 (no data)

* 1991 (no data)

* 1992 (no data)

* 1993 (no data)

* 1994
cd "$raw/1994"
use dct_ef1994_ic.dta, clear
merge 1:m unitid using dct_ef1994_acp.dta
drop _merge
merge m:1 unitid using dct_ef1994_d.dta
drop _merge
gen year = 1994
*compress
tempfile majors_1994
save `majors_1994'

* 1995 (no data)

* 1996
cd "$raw/1996"
use dct_ef96_ic.dta, clear
merge 1:m unitid using dct_ef96_acp.dta
drop _merge
merge m:1 unitid using dct_ef96_d.dta
drop _merge
gen year = 1996
*compress
tempfile majors_1996
save `majors_1996'

* 1997 (no data)

* 1998
cd "$raw/1998"
use dct_ef98_hd.dta, clear
merge 1:m unitid using dct_ef98_acp.dta
drop _merge
merge m:1 unitid using dct_ef98_d.dta
drop _merge
gen year = 1998
*compress
tempfile majors_1998
save `majors_1998'

* 1999 (no data)

* 2000
cd "$raw/2000"
use dct_ef2000cp.dta, clear
gen year = 2000
*compress
tempfile majors_2000
save `majors_2000'

* 2001 (no data)

* 2002
cd "$raw/2002"
use dct_ef2002cp.dta, clear
merge m:1 unitid using dct_ef2002d.dta
drop _merge
gen year = 2002
*compress
tempfile majors_2002
save `majors_2002'

* 2003 (no data)

* 2004
cd "$raw/2004"
use dct_ef2004cp.dta, clear
merge m:1 unitid using dct_ef2004d.dta
drop _merge
merge m:1 unitid using dct_flags2004.dta
drop _merge
gen year = 2004
*compress
tempfile majors_2004
save `majors_2004'

* 2005 (no data)

* 2006
cd "$raw/2006"
use dct_ef2006cp.dta, clear
merge m:1 unitid using dct_ef2006d.dta
drop _merge
merge m:1 unitid using dct_flags2006.dta
drop _merge
gen year = 2006
*compress
tempfile majors_2006
save `majors_2006'

* 2007 (no data)

* 2008
cd "$raw/2008"
use dct_ef2008cp.dta, clear
merge m:1 unitid using dct_ef2008d.dta
drop _merge
merge m:1 unitid using dct_efest2008.dta
drop _merge
merge m:1 unitid using dct_flags2008.dta
drop _merge
gen year = 2008
*compress
tempfile majors_2008
save `majors_2008'

* 2009 (no data)

* 2010
cd "$raw/2010"
use dct_ef2010cp.dta, clear
merge m:1 unitid using dct_ef2010d.dta
drop _merge
merge m:1 unitid using dct_flags2010.dta
drop _merge
gen year = 2010
*compress
tempfile majors_2010
save `majors_2010'

* 2011 (no data)

* 2012
cd "$raw/2012"
use dct_ef2012cp.dta, clear
merge m:1 unitid using dct_ef2012d.dta
drop _merge
merge m:1 unitid using dct_flags2012.dta
drop _merge
gen year = 2012
*compress
tempfile majors_2012
save `majors_2012'

* 2013 (no data)
/*
* 2014
cd "$raw/2014"
use , clear
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:m unitid using 

drop _merge
gen year = 2014
*compress
tempfile majors_2014
save `majors_2014'

* 2015
cd "$raw/2015"
use , clear
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:1 unitid using 

drop _merge
merge 1:m unitid using 

drop _merge
gen year = 2015
*compress
tempfile majors_2015
save `majors_2015'
*/


use `majors_1980', clear
forvalues year = 1984(1)2013 {
	capture append "`majors_`year''"
	if _rc!=601 {
		di _rc
		continue, break
	}
}
compress
save "$clean/majors_enrollment.dta", replace


log close
