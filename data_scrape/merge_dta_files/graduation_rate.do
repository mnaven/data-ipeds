version 12.1
cap log close
clear all
set more off

global home /Users/Naven/Google Drive/data/ipeds/data_scrape/merge_dta_files
global raw /Users/Naven/Google Drive/data/ipeds/raw_data
global clean /Users/Naven/Google Drive/data/ipeds/clean_data

log using "$home/graduation_rate.log", replace

* 1997
cd "$raw/1997"
use dct_gr1997.dta, clear
gen year = 1997
label variable year "Year"
tempfile grads_1997
save `grads_1997'

* 1998
cd "$raw/1998"
use dct_gr1998.dta, clear
gen year = 1998
label variable year "Year"
tempfile grads_1998
save `grads_1998'

* 1999
cd "$raw/1999"
use dct_gr1999.dta, clear
gen year = 1999
label variable year "Year"
tempfile grads_1999
save `grads_1999'

* 2000
cd "$raw/2000"
use dct_gr2000.dta, clear
gen year = 2000
label variable year "Year"
tempfile grads_2000
save `grads_2000'

* 2001
cd "$raw/2001"
use dct_gr2001.dta, clear
gen year = 2001
label variable year "Year"
tempfile grads_2001
save `grads_2001'

* 2002
cd "$raw/2002"
use dct_gr2002.dta, clear
gen year = 2002
label variable year "Year"
tempfile grads_2002
save `grads_2002'

* 2003
cd "$raw/2003"
use dct_gr2003.dta, clear
gen year = 2003
label variable year "Year"
tempfile grads_2003
save `grads_2003'

* 2004
cd "$raw/2004"
use dct_gr2004.dta, clear
gen year = 2004
label variable year "Year"
tempfile grads_2004
save `grads_2004'

* 2005
cd "$raw/2005"
use dct_gr2005.dta, clear
gen year = 2005
label variable year "Year"
tempfile grads_2005
save `grads_2005'

* 2006
cd "$raw/2006"
use dct_gr2006.dta, clear
gen year = 2006
label variable year "Year"
tempfile grads_2006
save `grads_2006'

* 2007
cd "$raw/2007"
use dct_gr2007.dta, clear
gen year = 2007
label variable year "Year"
tempfile grads_2007
save `grads_2007'

* 2008
cd "$raw/2008"
use dct_gr2008.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
gen year = 2008
label variable year "Year"
tempfile grads_2008
save `grads_2008'

* 2009
cd "$raw/2009"
use dct_gr2009_rv.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
tempfile grads_2009
save `grads_2009'

* 2010
cd "$raw/2010"
use dct_gr2010.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
tempfile grads_2010
save `grads_2010'

* 2011
cd "$raw/2011"
use dct_gr2011.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
tempfile grads_2011
save `grads_2011'

* 2012
cd "$raw/2012"
use dct_gr2012.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
tempfile grads_2012
save `grads_2012'

* 2013
cd "$raw/2013"
use dct_gr2013.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
tempfile grads_2013
save `grads_2013'

* 2014
cd "$raw/2014"
use dct_gr2014.dta, clear
foreach var of varlist x* {
		capture confirm string variable `var'
		if !_rc {
			di `var'
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
label variable year "Year"
tempfile grads_2014
save `grads_2014'


use `grads_2014', clear
forvalues data_year = 2013(-1)1997 {
	di `data_year'
	append using `grads_`data_year''
}
sort unitid year
compress
save "$clean/graduation_rate.dta", replace


log close
