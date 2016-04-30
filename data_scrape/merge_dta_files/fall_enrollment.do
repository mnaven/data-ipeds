version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/fall_enrollment.log", replace

* 1980
cd "$raw/1980"
use dct_ef1980_a.dta, clear
*recode line 1=8 2=1 3=2 4=3 5=4 6=5 12=11 13=12 15=22 16=15 17=16 24=23 26=25 27=26
gen year = 1980
label variable year "Year"
tempfile fall_enrollment_1980
save `fall_enrollment_1980'

* 1984
cd "$raw/1984"
use dct_ef1984.dta, clear
*recode line 1=8 2=1 3=2 4=3 5=4 6=5 12=11 13=12 15=22 16=15 17=16 24=23 26=25 27=26
gen year = 1984
label variable year "Year"
tempfile fall_enrollment_1984
save `fall_enrollment_1984'

* 1985 (no data by race)
cd "$raw/1985"
use dct_ef1985.dta, clear
gen year = 1985
label variable year "Year"
tempfile fall_enrollment_1985
save `fall_enrollment_1985'

* 1986
cd "$raw/1986"
use dct_ef1986_ic.dta, clear
merge 1:m unitid using dct_ef1986_a.dta
drop _merge
merge m:1 unitid using dct_ef1986_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1986
label variable year "Year"
tempfile fall_enrollment_1986
save `fall_enrollment_1986'

* 1987 (no data by race)
cd "$raw/1987"
use dct_ef1987_ic.dta, clear
merge 1:m unitid using dct_ef1987_a.dta
drop _merge
merge m:1 unitid using dct_ef1987_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1987
label variable year "Year"
tempfile fall_enrollment_1987
save `fall_enrollment_1987'

* 1988
cd "$raw/1988"
use dct_ef1988_ic.dta, clear
merge 1:m unitid using dct_ef1988_a.dta
drop _merge
tostring h_samp, replace
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1988
label variable year "Year"
tempfile fall_enrollment_1988
save `fall_enrollment_1988'

* 1989 (no data by race)
cd "$raw/1989"
use dct_ef1989_ic.dta, clear
merge 1:m unitid using dct_ef1989_a.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1989
label variable year "Year"
tempfile fall_enrollment_1989
save `fall_enrollment_1989'

* 1990
cd "$raw/1990"
use dct_ef90_hd.dta, clear
merge 1:m unitid using dct_ef90_a.dta // raked
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1990
label variable year "Year"
tempfile fall_enrollment_1990
save `fall_enrollment_1990'

* 1991
cd "$raw/1991"
use dct_ef1991_hdr.dta, clear
merge 1:m unitid using dct_ef1991_a.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1991
label variable year "Year"
tempfile fall_enrollment_1991
save `fall_enrollment_1991'

* 1992
cd "$raw/1992"
use dct_ef1992_ic.dta, clear
merge 1:m unitid using dct_ef1992_a.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1992
label variable year "Year"
tempfile fall_enrollment_1992
save `fall_enrollment_1992'

* 1993
cd "$raw/1993"
use dct_ef1993_ic.dta, clear
merge 1:m unitid using dct_ef1993_a.dta
drop _merge
merge m:1 unitid using dct_ef1993_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1993
label variable year "Year"
tempfile fall_enrollment_1993
save `fall_enrollment_1993'

* 1994
cd "$raw/1994"
use dct_ef1994_ic.dta, clear
*merge 1:m unitid using dct_ef1994_anr.dta // not raked
*drop _merge
merge 1:m unitid using dct_ef1994_ark.dta // raked
drop _merge
merge m:1 unitid using dct_ef1994_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1994
label variable year "Year"
tempfile fall_enrollment_1994
save `fall_enrollment_1994'

* 1995
cd "$raw/1995"
use dct_ef95_ic.dta, clear
*merge 1:m unitid using dct_ef95_anr.dta // not raked
*drop _merge
merge 1:m unitid using dct_ef95_ark.dta // raked
drop _merge
merge m:1 unitid using dct_ef95_d.dta
drop _merge
tostring filler3, replace
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1995
label variable year "Year"
tempfile fall_enrollment_1995
save `fall_enrollment_1995'

* 1996
cd "$raw/1996"
use dct_ef96_ic.dta, clear
*merge 1:m unitid using dct_ef96_anr.dta // not raked
*drop _merge
merge 1:m unitid using dct_ef96_ark.dta // raked
drop _merge
merge m:1 unitid using dct_ef96_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1996
label variable year "Year"
tempfile fall_enrollment_1996
save `fall_enrollment_1996'

* 1997
cd "$raw/1997"
use dct_ef97_hdr.dta, clear
*merge 1:m unitid using dct_ef97_anr.dta // not raked
*drop _merge
merge 1:m unitid using dct_ef97_ark.dta // raked
drop _merge
merge m:1 unitid using dct_ef97_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	destring lstudy, replace
}
gen year = 1997
label variable year "Year"
tempfile fall_enrollment_1997
save `fall_enrollment_1997'

* 1998
cd "$raw/1998"
use dct_ef98_hd.dta, clear
*merge 1:m unitid using dct_ef98_anr // not raked
*drop _merge
merge 1:m unitid using dct_ef98_ark.dta // raked
drop _merge
merge m:1 unitid using dct_ef98_d.dta
drop _merge
capture confirm string variable lstudy
if !_rc {
	replace lstudy = upper(ltrim(rtrim(lstudy)))
	replace lstudy = "1" if lstudy=="A"
	replace lstudy = "2" if lstudy=="B"
	replace lstudy = "3" if lstudy=="C"
	replace lstudy = "99" if lstudy=="D"
	replace lstudy = "4" if lstudy=="E"
	destring lstudy, replace
}
gen year = 1998
label variable year "Year"
tempfile fall_enrollment_1998
save `fall_enrollment_1998'

* 1999
cd "$raw/1999"
use dct_ef99_anr.dta, clear // not raked?
merge m:1 unitid using dct_ef99_d.dta
drop _merge
gen year = 1999
label variable year "Year"
tempfile fall_enrollment_1999
save `fall_enrollment_1999'

* 2000
cd "$raw/2000"
use dct_ef2000a.dta, clear
gen year = 2000
label variable year "Year"
tempfile fall_enrollment_2000
save `fall_enrollment_2000'

* 2001
cd "$raw/2001"
use dct_ef2001a.dta, clear
merge m:1 unitid using dct_ef2001e.dta
drop _merge
gen year = 2001
label variable year "Year"
tempfile fall_enrollment_2001
save `fall_enrollment_2001'

* 2002
cd "$raw/2002"
use dct_ef2002a.dta, clear
merge m:1 unitid using dct_ef2002d.dta
drop _merge
gen year = 2002
label variable year "Year"
tempfile fall_enrollment_2002
save `fall_enrollment_2002'

* 2003
cd "$raw/2003"
use dct_ef2003a.dta, clear
merge m:1 unitid using dct_ef2003d.dta
drop _merge
gen year = 2003
label variable year "Year"
tempfile fall_enrollment_2003
save `fall_enrollment_2003'

* 2004
cd "$raw/2004"
use dct_ef2004a.dta, clear
merge m:1 unitid using dct_ef2004d.dta
drop _merge
merge m:1 unitid using dct_flags2004.dta
drop _merge
gen year = 2004
label variable year "Year"
tempfile fall_enrollment_2004
save `fall_enrollment_2004'

* 2005
cd "$raw/2005"
use dct_ef2005a.dta, clear
merge m:1 unitid using dct_ef2005d.dta
drop _merge
merge m:1 unitid using dct_flags2005.dta
drop _merge
gen year = 2005
label variable year "Year"
tempfile fall_enrollment_2005
save `fall_enrollment_2005'

* 2006
cd "$raw/2006"
use dct_ef2006a.dta, clear
merge m:1 unitid using dct_ef2006d.dta
drop _merge
merge m:1 unitid using dct_flags2006.dta
drop _merge
gen year = 2006
label variable year "Year"
tempfile fall_enrollment_2006
save `fall_enrollment_2006'

* 2007
cd "$raw/2007"
use dct_ef2007a.dta, clear
merge m:1 unitid using dct_ef2007d.dta
drop _merge
merge m:1 unitid using dct_efest2007.dta
drop _merge
merge m:1 unitid using dct_flags2007.dta
drop _merge
gen year = 2007
label variable year "Year"
tempfile fall_enrollment_2007
save `fall_enrollment_2007'

* 2008
cd "$raw/2008"
use dct_ef2008a.dta, clear
merge m:1 unitid using dct_ef2008d.dta
drop _merge
merge m:1 unitid using dct_efest2008.dta
drop _merge
merge m:1 unitid using dct_flags2008.dta
drop _merge
gen year = 2008
label variable year "Year"
tempfile fall_enrollment_2008
save `fall_enrollment_2008'

* 2009
cd "$raw/2009"
use dct_ef2009a_rv.dta, clear
merge m:1 unitid using dct_ef2009d_rv.dta
drop _merge
merge m:1 unitid using dct_efest2009.dta
drop _merge
merge m:1 unitid using dct_flags2009.dta
drop _merge
* dct_ef2009a_rv
foreach var in xeftotlt xeftotlm xeftotlw xdvefait xdvefaim xdvefaiw xdvefapt ///
	xdvefapm xdvefapw xdvefbkt xdvefbkm xdvefbkw xdvefhst xdvefhsm xdvefhsw ///
	xdvefwht xdvefwhm xdvefwhw xefaiant xefaianm xefaianw xefasiat xefasiam ///
	xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw xefnhpit ///
	xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm xef2morw ///
	xefrac19 xefrac05 xefrac06 xefrac20 xefrac07 xefrac08 xefrac18 xefrac03 ///
	xefrac04 xefrac21 xefrac09 xefrac10 xefrac22 xefrac11 xefrac12 xefunknt ///
	xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2009d_rv
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2009
label variable year "Year"
tempfile fall_enrollment_2009
save `fall_enrollment_2009'

* 2010
cd "$raw/2010"
use dct_ef2010a.dta, clear
merge m:1 unitid using dct_ef2010d.dta
drop _merge
merge m:1 unitid using dct_flags2010.dta
drop _merge
* dct_ef2010a
foreach var in xeftotlt xeftotlm xeftotlw xefaiant xefaianm xefaianw xefasiat ///
	xefasiam xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw ///
	xefnhpit xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm ///
	xef2morw xefunknt xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2010d
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2010
label variable year "Year"
tempfile fall_enrollment_2010
save `fall_enrollment_2010'

* 2011
cd "$raw/2011"
use dct_ef2011a.dta, clear
merge m:1 unitid using dct_ef2011d.dta
drop _merge
merge m:1 unitid using dct_flags2011.dta
drop _merge
* dct_ef2011a
foreach var in xeftotlt xeftotlm xeftotlw xefaiant xefaianm xefaianw xefasiat ///
	xefasiam xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw ///
	xefnhpit xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm ///
	xef2morw xefunknt xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2011d
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2011
label variable year "Year"
tempfile fall_enrollment_2011
save `fall_enrollment_2011'

* 2012
cd "$raw/2012"
use dct_ef2012a.dta, clear
merge m:1 unitid using dct_ef2012d.dta
drop _merge
merge m:1 unitid using dct_flags2012.dta
drop _merge
* dct_ef2012a
foreach var in xeftotlt xeftotlm xeftotlw xefaiant xefaianm xefaianw xefasiat ///
	xefasiam xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw ///
	xefnhpit xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm ///
	xef2morw xefunknt xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2012d
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2012
label variable year "Year"
tempfile fall_enrollment_2012
save `fall_enrollment_2012'

* 2013
cd "$raw/2013"
use dct_ef2013a.dta, clear
merge m:1 unitid using dct_ef2013d.dta
drop _merge
merge m:1 unitid using dct_flags2013.dta
drop _merge
* dct_ef2013a
foreach var in xeftotlt xeftotlm xeftotlw xefaiant xefaianm xefaianw xefasiat ///
	xefasiam xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw ///
	xefnhpit xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm ///
	xef2morw xefunknt xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2013d
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2013
label variable year "Year"
tempfile fall_enrollment_2013
save `fall_enrollment_2013'

* 2014
cd "$raw/2014"
use dct_ef2014a.dta, clear
merge m:1 unitid using dct_ef2014d.dta
drop _merge
merge m:1 unitid using dct_flags2014.dta
drop _merge
* dct_ef2014a
foreach var in xeftotlt xeftotlm xeftotlw xefaiant xefaianm xefaianw xefasiat ///
	xefasiam xefasiaw xefbkaat xefbkaam xefbkaaw xefhispt xefhispm xefhispw ///
	xefnhpit xefnhpim xefnhpiw xefwhitt xefwhitm xefwhitw xef2mort xef2morm ///
	xef2morw xefunknt xefunknm xefunknw xefnralt xefnralm xefnralw {
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
		}
}
* dct_ef2014d
foreach var in xgrcohrt xugenter xpgrcohr xrrftct xrrftex xrrftcta xret_nmf ///
	xret_pcf xrrptct xrrptex xrrptcta xret_nmp xret_pcp xstufacr {
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
		}
}
gen year = 2014
tempfile fall_enrollment_2014
save `fall_enrollment_2014'
/*
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
tempfile fall_enrollment_2015
save `fall_enrollment_2015'
*/

/*
use `fall_enrollment_1980', clear
forvalues data_year = 1984(1)2013 {
	di `data_year'
	append using "`fall_enrollment_`data_year''"
}
*/
use `fall_enrollment_2014', clear
forvalues data_year = 2013(-1)1984 {
	di `data_year'
	append using "`fall_enrollment_`data_year''"
}
append using `fall_enrollment_1980'
compress
sort unitid year line
save "$clean/fall_enrollment.dta", replace

log close
