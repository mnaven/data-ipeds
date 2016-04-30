version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/age_enrollment.log", replace

* 1980 (no data)

* 1984 (no data)

* 1985 (no data)

* 1986 (no data)

* 1987 (no data by race)
cd "$raw/1987"
use dct_ef1987_ic.dta, clear
merge 1:m unitid using dct_ef1987_b.dta
drop _merge
merge m:1 unitid using dct_ef1987_d.dta
drop _merge
gen year = 1987
*compress
tempfile age_1987
save `age_1987'

* 1988 (no data)

* 1989 (no data)

* 1990 (no data)

* 1991
cd "$raw/1991"
use dct_ef1991_hdr.dta, clear
merge 1:m unitid using dct_ef1991_b.dta
drop _merge
gen year = 1991
*compress
tempfile age_1991
save `age_1991'

* 1992 (no data)

* 1993
cd "$raw/1993"
use dct_ef1993_ic.dta, clear
merge 1:m unitid using dct_ef1993_b.dta
drop _merge
merge m:1 unitid using dct_ef1993_d.dta
drop _merge
gen year = 1993
*compress
tempfile age_1993
save `age_1993'

* 1994 (no data)

* 1995
cd "$raw/1995"
use dct_ef95_ic.dta, clear
merge 1:m unitid using dct_ef95_b.dta
drop _merge
merge m:1 unitid using dct_ef95_d.dta
drop _merge
gen year = 1995
*compress
tempfile age_1995
save `age_1995'

* 1996 (no data)

* 1997
cd "$raw/1997"
use dct_ef97_hdr.dta, clear
merge 1:m unitid using dct_ef97_b.dta
drop _merge
merge m:1 unitid using dct_ef97_d.dta
drop _merge
gen year = 1997
*compress
tempfile age_1997
save `age_1997'

* 1998 (no data)

* 1999
cd "$raw/1999"
use dct_ef99_b.dta, clear
merge m:1 unitid using dct_ef99_d.dta
drop _merge
gen year = 1999
*compress
tempfile age_1999
save `age_1999'

* 2000
cd "$raw/2000"
use dct_ef2000b.dta, clear
gen year = 2000
*compress
tempfile age_2000
save `age_2000'

* 2001
cd "$raw/2001"
use dct_ef2001b.dta, clear
merge m:1 unitid using dct_ef2001e.dta
drop _merge
gen year = 2001
*compress
tempfile age_2001
save `age_2001'

* 2002
cd "$raw/2002"
use dct_ef2002b.dta, clear
merge m:1 unitid using dct_ef2002d.dta
drop _merge
gen year = 2002
*compress
tempfile age_2002
save `age_2002'

* 2003
cd "$raw/2003"
use dct_ef2003b.dta, clear
merge m:1 unitid using dct_ef2003d.dta
drop _merge
gen year = 2003
*compress
tempfile age_2003
save `age_2003'

* 2004
cd "$raw/2004"
use dct_ef2004b.dta, clear
merge m:1 unitid using dct_ef2004d.dta
drop _merge
merge m:1 unitid using dct_flags2004.dta
drop _merge
gen year = 2004
*compress
tempfile age_2004
save `age_2004'

* 2005
cd "$raw/2005"
use dct_ef2005b.dta, clear
merge m:1 unitid using dct_ef2005d.dta
drop _merge
merge m:1 unitid using dct_flags2005.dta
drop _merge
gen year = 2005
*compress
tempfile age_2005
save `age_2005'

* 2006
cd "$raw/2006"
use dct_ef2006b.dta, clear
merge m:1 unitid using dct_ef2006d.dta
drop _merge
merge m:1 unitid using dct_flags2006.dta
drop _merge
gen year = 2006
*compress
tempfile age_2006
save `age_2006'

* 2007
cd "$raw/2007"
use dct_ef2007b.dta, clear
merge m:1 unitid using dct_ef2007d.dta
drop _merge
merge m:1 unitid using dct_efest2007.dta
drop _merge
merge m:1 unitid using dct_flags2007.dta
drop _merge
gen year = 2007
*compress
tempfile age_2007
save `age_2007'

* 2008
cd "$raw/2008"
use dct_ef2008b.dta, clear
merge m:1 unitid using dct_ef2008d.dta
drop _merge
merge m:1 unitid using dct_efest2008.dta
drop _merge
merge m:1 unitid using dct_flags2008.dta
drop _merge
gen year = 2008
*compress
tempfile age_2008
save `age_2008'

* 2009
cd "$raw/2009"
use dct_ef2009b_rv.dta, clear
merge m:1 unitid using dct_ef2009d_rv.dta
drop _merge
merge m:1 unitid using dct_efest2009.dta
drop _merge
merge m:1 unitid using dct_flags2009.dta
drop _merge
gen year = 2009
*compress
tempfile age_2009
save `age_2009'

* 2010
cd "$raw/2010"
use dct_ef2010b.dta, clear
merge m:1 unitid using dct_ef2010d.dta
drop _merge
merge m:1 unitid using dct_flags2010.dta
drop _merge
gen year = 2010
*compress
tempfile age_2010
save `age_2010'

* 2011
cd "$raw/2011"
use dct_ef2011b.dta, clear
merge m:1 unitid using dct_ef2011d.dta
drop _merge
merge m:1 unitid using dct_flags2011.dta
drop _merge
gen year = 2011
*compress
tempfile age_2011
save `age_2011'

* 2012
cd "$raw/2012"
use dct_ef2012b.dta, clear
merge m:1 unitid using dct_ef2012d.dta
drop _merge
merge m:1 unitid using dct_flags2012.dta
drop _merge
gen year = 2012
*compress
tempfile age_2012
save `age_2012'

* 2013
cd "$raw/2013"
use dct_ef2013b.dta, clear
merge m:1 unitid using dct_ef2013d.dta
drop _merge
merge m:1 unitid using dct_flags2013.dta
drop _merge
gen year = 2013
*compress
tempfile age_2013
save `age_2013'
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
tempfile age_2014
save `age_2014'

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
tempfile age_2015
save `age_2015'
*/


use `age_1987', clear
forvalues year = 1988(1)2013 {
	capture append "`age_`year''"
	if _rc!=601 {
		di _rc
		continue, break
	}
}
compress
save "$clean/age_enrollment.dta", replace


log close
