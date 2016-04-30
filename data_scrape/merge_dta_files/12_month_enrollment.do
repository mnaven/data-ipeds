version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/12_month_enrollment.log", replace

* 1980 (no data)

* 1984 (no data)

* 1985 (no data)

* 1986 (no data)

* 1987 (no data)

* 1988 (no data)

* 1989 (no data)

* 1990 (no data)

* 1991 (no data)

* 1992 (no data)

* 1993 (no data)

* 1994 (no data)

* 1995 (no data)

* 1996 (no data)

* 1997 (1996-1997)
cd "$raw/1997"
use dct_ic9798_e.dta, clear
gen year = 1996
*compress
tempfile 12m_enrollment_1997
save `12m_enrollment_1997'

* 1998 (1997-1998)
cd "$raw/1998"
use dct_ic98_e.dta, clear
gen year = 1997
*compress
tempfile 12m_enrollment_1998
save `12m_enrollment_1998'

* 1999 (1998-1999)
cd "$raw/1999"
use dct_ic99_e.dta, clear
gen year = 1998
*compress
tempfile 12m_enrollment_1999
save `12m_enrollment_1999'

* 2000 (1999-2000)
cd "$raw/2000"
use dct_ef2000d.dta, clear
gen year = 1999
*compress
tempfile 12m_enrollment_2000
save `12m_enrollment_2000'

* 2001 (2000-2001)
cd "$raw/2001"
use dct_ef2001d1.dta, clear
merge m:1 unitid using dct_ef2001d2.dta
drop _merge
gen year = 2000
*compress
tempfile 12m_enrollment_2001
save `12m_enrollment_2001'

* 2002 (2001-2002)
cd "$raw/2002"
use dct_effy2002.dta, clear
merge m:1 unitid using dct_efia2002.dta
drop _merge
gen year = 2001
*compress
tempfile 12m_enrollment_2002
save `12m_enrollment_2002'

* 2003 (2002-2003)
cd "$raw/2003"
use dct_effy2003.dta, clear
merge m:1 unitid using dct_efia2003.dta
drop _merge
gen year = 2002
*compress
tempfile 12m_enrollment_2003
save `12m_enrollment_2003'

* 2004 (2003-2004)
cd "$raw/2004"
use dct_effy2004.dta, clear
merge m:1 unitid using dct_efia2004.dta
drop _merge
gen year = 2003
*compress
tempfile 12m_enrollment_2004
save `12m_enrollment_2004'

* 2005 (2004-2005)
cd "$raw/2005"
use dct_effy2005.dta, clear
merge m:1 unitid using dct_efia2005.dta
drop _merge
gen year = 2004
*compress
tempfile 12m_enrollment_2005
save `12m_enrollment_2005'

* 2006 (2005-2006)
cd "$raw/2006"
use dct_effy2006.dta, clear
merge m:1 unitid using dct_efia2006.dta
drop _merge
gen year = 2005
*compress
tempfile 12m_enrollment_2006
save `12m_enrollment_2006'

* 2007 (2006-2007)
cd "$raw/2007"
use dct_effy2007.dta, clear
merge m:1 unitid using dct_efia2007.dta
drop _merge
gen year = 2006
*compress
tempfile 12m_enrollment_2007
save `12m_enrollment_2007'

* 2008 (2007-2008)
cd "$raw/2008"
use dct_effy2008.dta, clear
merge m:1 unitid using dct_efia2008.dta
drop _merge
gen year = 2007
*compress
tempfile 12m_enrollment_2008
save `12m_enrollment_2008'

* 2009 (2008-2009)
cd "$raw/2009"
use dct_effy2009.dta, clear
merge m:1 unitid using dct_efia2009.dta
drop _merge
gen year = 2008
*compress
tempfile 12m_enrollment_2009
save `12m_enrollment_2009'

* 2010 (2009-2010)
cd "$raw/2010"
use dct_effy2010_rv.dta, clear
merge m:1 unitid using dct_efia2010_rv.dta
drop _merge
gen year = 2009
*compress
tempfile 12m_enrollment_2010
save `12m_enrollment_2010'

* 2011 (2010-2011)
cd "$raw/2011"
use dct_effy2011.dta, clear
merge m:1 unitid using dct_efia2011.dta
drop _merge
gen year = 2010
*compress
tempfile 12m_enrollment_2011
save `12m_enrollment_2011'

* 2012 (2011-2012)
cd "$raw/2012"
use dct_effy2012.dta, clear
merge m:1 unitid using dct_efia2012.dta
drop _merge
gen year = 2011
*compress
tempfile 12m_enrollment_2012
save `12m_enrollment_2012'

* 2013
cd "$raw/2013"
use dct_effy2013.dta, clear
merge m:1 unitid using dct_efia2013.dta
drop _merge
merge m:1 unitid using dct_flags2013.dta
drop _merge
gen year = 2012
*compress
tempfile 12m_enrollment_2013
save `12m_enrollment_2013'
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
gen year = 2013
*compress
tempfile 12m_enrollment_2014
save `12m_enrollment_2014'

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
gen year = 2014
*compress
tempfile 12m_enrollment_2015
save `12m_enrollment_2015'
*/


use `12m_enrollment_1997', clear
forvalues year = 1998(1)2013 {
	capture append "`12m_enrollment_`year''"
	if _rc!=601 {
		di _rc
		continue, break
	}
}
compress
save "$clean/12m_enrollment.dta", replace


log close
