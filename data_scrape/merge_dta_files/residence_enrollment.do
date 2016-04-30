version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/residence_enrollment.log", replace

* 1980 (no data)

* 1984 (no data)

* 1985 (no data)

* 1986
cd "$raw/1986"
use dct_res1986_ic.dta, clear
merge 1:m unitid using dct_ef1986_c.dta
drop _merge
gen year = 1986
*compress
tempfile residence_1986
save `residence_1986'

* 1987 (no data)

* 1988
cd "$raw/1988"
use dct_res1988_ic.dta, clear
merge 1:m unitid using dct_ef1988_c.dta
drop _merge
gen year = 1988
*compress
tempfile residence_1988
save `residence_1988'

* 1989 (no data)

* 1990 (no data)

* 1991 (no data)

* 1992
cd "$raw/1992"
use dct_ef1992_ic.dta, clear
merge 1:m unitid using dct_ef1992_c.dta
drop _merge
gen year = 1992
*compress
tempfile residence_1992
save `residence_1992'

* 1993 (no data)

* 1994
cd "$raw/1994"
use dct_ef1994_ic.dta, clear
merge 1:m unitid using dct_ef1994_c.dta
drop _merge
merge m:1 unitid using dct_ef1994_d.dta
drop _merge
gen year = 1994
*compress
tempfile residence_1994
save `residence_1994'

* 1995 (no data)

* 1996
cd "$raw/1996"
use dct_ef96_ic.dta, clear
merge 1:m unitid using dct_ef96_c.dta
drop _merge
merge m:1 unitid using dct_ef96_d.dta
drop _merge
gen year = 1996
*compress
tempfile residence_1996
save `residence_1996'

* 1997 (no data)

* 1998
cd "$raw/1998"
use dct_ef98_hd.dta, clear
merge 1:m unitid using dct_ef98_c.dta
drop _merge
merge m:1 unitid using dct_ef98_d.dta
drop _merge
gen year = 1998
*compress
tempfile residence_1998
save `residence_1998'

* 1999 (no data)

* 2000
cd "$raw/2000"
use dct_ef2000c.dta, clear
gen year = 2000
*compress
tempfile residence_2000
save `residence_2000'

* 2001
cd "$raw/2001"
use dct_ef2001c.dta, clear
merge m:1 unitid using dct_ef2001e.dta
drop _merge
gen year = 2001
*compress
tempfile residence_2001
save `residence_2001'

* 2002
cd "$raw/2002"
use dct_ef2002c.dta, clear
merge m:1 unitid using dct_ef2002d.dta
drop _merge
gen year = 2002
*compress
tempfile residence_2002
save `residence_2002'

* 2003
cd "$raw/2003"
use dct_ef2003c.dta, clear
merge m:1 unitid using dct_ef2003d.dta
drop _merge
gen year = 2003
*compress
tempfile residence_2003
save `residence_2003'

* 2004
cd "$raw/2004"
use dct_ef2004c.dta, clear
merge m:1 unitid using dct_ef2004d.dta
drop _merge
merge m:1 unitid using dct_flags2004.dta
drop _merge
gen year = 2004
*compress
tempfile residence_2004
save `residence_2004'

* 2005
cd "$raw/2005"
use dct_ef2005c.dta, clear
merge m:1 unitid using dct_ef2005d.dta
drop _merge
merge m:1 unitid using dct_flags2005.dta
drop _merge
gen year = 2005
*compress
tempfile residence_2005
save `residence_2005'

* 2006
cd "$raw/2006"
use dct_ef2006c.dta, clear
merge m:1 unitid using dct_ef2006d.dta
drop _merge
merge m:1 unitid using dct_flags2006.dta
drop _merge
gen year = 2006
*compress
tempfile residence_2006
save `residence_2006'

* 2007
cd "$raw/2007"
use dct_ef2007c.dta, clear
merge m:1 unitid using dct_ef2007d.dta
drop _merge
merge m:1 unitid using dct_efest2007.dta
drop _merge
merge m:1 unitid using dct_flags2007.dta
drop _merge
gen year = 2007
*compress
tempfile residence_2007
save `residence_2007'

* 2008
cd "$raw/2008"
use dct_ef2008c.dta, clear
merge m:1 unitid using dct_ef2008d.dta
drop _merge
merge m:1 unitid using dct_efest2008.dta
drop _merge
merge m:1 unitid using dct_flags2008.dta
drop _merge
gen year = 2008
*compress
tempfile residence_2008
save `residence_2008'

* 2009
cd "$raw/2009"
use dct_ef2009c_rv.dta, clear
merge m:1 unitid using dct_ef2009d_rv.dta
drop _merge
merge m:1 unitid using dct_efest2009.dta
drop _merge
merge m:1 unitid using dct_flags2009.dta
drop _merge
gen year = 2009
*compress
tempfile residence_2009
save `residence_2009'

* 2010
cd "$raw/2010"
use dct_ef2010c.dta, clear
merge m:1 unitid using dct_ef2010d.dta
drop _merge
merge m:1 unitid using dct_flags2010.dta
drop _merge
gen year = 2010
*compress
tempfile residence_2010
save `residence_2010'

* 2011
cd "$raw/2011"
use dct_ef2011c.dta, clear
merge m:1 unitid using dct_ef2011d.dta
drop _merge
merge m:1 unitid using dct_flags2011.dta
drop _merge
gen year = 2011
*compress
tempfile residence_2011
save `residence_2011'

* 2012
cd "$raw/2012"
use dct_ef2012c.dta, clear
merge m:1 unitid using dct_ef2012d.dta
drop _merge
merge m:1 unitid using dct_flags2012.dta
drop _merge
gen year = 2012
*compress
tempfile residence_2012
save `residence_2012'

* 2013
cd "$raw/2013"
use dct_ef2013c.dta, clear
merge m:1 unitid using dct_ef2013d.dta
drop _merge
merge m:1 unitid using dct_flags2013.dta
drop _merge
gen year = 2013
*compress
tempfile residence_2013
save `residence_2013'
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
tempfile residence_2014
save `residence_2014'

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
tempfile residence_2015
save `residence_2015'
*/


use `residence_1986', clear
forvalues year = 1987(1)2013 {
	capture append "`residence_`year''"
	if _rc!=601 {
		di _rc
		continue, break
	}
}
compress
save "$clean/residence_enrollment.dta", replace


log close
