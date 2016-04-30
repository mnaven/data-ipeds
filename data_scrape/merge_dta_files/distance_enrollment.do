version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/distance_enrollment.log", replace

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

* 1997 (no data)

* 1998 (no data)

* 1999 (no data)

* 2000 (no data)

* 2001 (no data)

* 2002 (no data)

* 2003 (no data)

* 2004 (no data)

* 2005 (no data)

* 2006 (no data)

* 2007 (no data)

* 2008 (no data)

* 2009 (no data)

* 2010 (no data)

* 2011 (no data)

* 2012
cd "$raw/2012"
use dct_ef2012a_dist.dta, clear
merge m:1 unitid using dct_ef2012d.dta
drop _merge
merge m:1 unitid using dct_flags2012.dta
drop _merge
gen year = 2012
*compress
tempfile distance_2012
save `distance_2012'

* 2013
cd "$raw/2013"
use dct_ef2013a_dist.dta, clear
merge m:1 unitid using dct_ef2013d.dta
drop _merge
merge m:1 unitid using dct_flags2013.dta
drop _merge
gen year = 2013
*compress
tempfile distance_2013
save `distance_2013'


use `distance_2012', clear
forvalues year = 2013(1)2013 {
	capture append "`distance_`year''"
	if _rc!=601 {
		di _rc
		continue, break
	}
}
compress
save "$clean/distance_enrollment.dta", replace


log close
