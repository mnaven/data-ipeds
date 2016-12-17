version 14.1
cap log close
clear all
set more off
set graphics off
set scheme s1color

if c(hostname)=="MacBook-Pro.local" {
	global ipeds /Users/Naven/Google Drive/data/ipeds
}
if c(hostname)=="sapper" {
	global ipeds /home/users/navenm.AD3/research/data/ipeds
}
cd $ipeds

log using log_files/clean_institutional_characteristics.log, replace
timer on 1


use "$ipeds/clean_data/institutional_characteristics.dta", clear
xtset unitid year, yearly

sum

* Recode variables
recode control 0=. -3=.
recode sector 99=.

* Public/Private institution
label def public 1 "Public" 0 "Private"
gen public:public = (control==1)
replace public = . if mi(control)
label var public "Public Institution"
label def private_nfp 1 "Private NFP" 0 "Public/Private FP"
gen private_nfp:private_nfp = (control==2 & year>=1986)
replace private_nfp = . if mi(control)
replace private_nfp = . if year<=1985
label var private_nfp "Private Not-For-Profit"
label def private_fp 1 "Private FP" 0 "Public/Private NFP"
gen private_fp:private_fp = (control==3 & year>=1986)
replace private_fp = . if mi(control)
replace private_fp = . if year<=1985
label var private_fp "Private For-Profit"
label def private 1 "Private" 0 "Public", replace
gen private:private = (private_nfp==1 | private_fp==1 | (control==2 & year<=1985))
replace private = . if mi(private_nfp) & mi(private_fp) & (mi(control) & year<=1985 | year>=1986)
label var private "Private University"

* Drop if switches from public to private
bysort unitid: egen temp_pub_min = min(public)
bysort unitid: egen temp_pub_max = max(public)
bysort unitid: gen temp_pub_flag = (temp_pub_min!=temp_pub_max)
sum if temp_pub_flag==1
drop if temp_pub_flag==1
drop temp_pub_*

* Drop if switches from private nonprofit to other
bysort unitid: egen temp_private_nfp_min = min(private_nfp)
bysort unitid: egen temp_private_nfp_max = max(private_nfp)
bysort unitid: gen temp_private_nfp_flag ///
	= (temp_private_nfp_min!=temp_private_nfp_max)
sum if temp_private_nfp_flag==1
drop if temp_private_nfp_flag==1
drop temp_private_nfp_*

* Drop if switches from private for-profit to other
bysort unitid: egen temp_private_fp_min = min(private_fp)
bysort unitid: egen temp_private_fp_max = max(private_fp)
bysort unitid: gen temp_private_fp_flag ///
	= (temp_private_fp_min!=temp_private_fp_max)
sum if temp_private_fp_flag==1
drop if temp_private_fp_flag==1
drop temp_private_fp_*

* Create groups based on public/private
*egen owner = group(public private_nfp private_fp), lname(owner)
label def owner 1 "Public" 2 "Private NFP" 3 "Private FP"
gen owner:owner = 1 if public==1
replace owner = 2 if private_nfp==1
replace owner = 3 if private_fp==1

* Four-year/community college/below associates
label def university 1 "Four-Year University" 0 "Less than Four Years"
gen university:university = (iclevel==1)
replace university = . if mi(iclevel)
label var university "Four-Year University"
label def community_college 1 "Community College" 0 "University/Below Associates"
gen community_college:community_college = (iclevel==2)
replace community_college = . if mi(iclevel)
label var community_college "Two to Four-Year College"
label def below_associates 1 "Below Associates" 0 "Associates or Higher"
gen below_associates:below_associates = (iclevel==3)
replace below_associates = . if mi(iclevel)
label var below_associates "Less than Two Years (Below Associate)"

* Drop if switches from four-year
bysort unitid: egen temp_university_min = min(university)
bysort unitid: egen temp_university_max = max(university)
bysort unitid: gen temp_university_flag ///
	= (temp_university_min!=temp_university_max)
sum if temp_university_flag==1
drop if temp_university_flag==1
drop temp_university_*

* Drop if switches from community college
bysort unitid: egen temp_community_college_min = min(community_college)
bysort unitid: egen temp_community_college_max = max(community_college)
bysort unitid: gen temp_community_college_flag ///
	= (temp_community_college_min!=temp_community_college_max)
sum if temp_community_college_flag==1
drop if temp_community_college_flag==1
drop temp_community_college_*

* Drop if switches from below associates
bysort unitid: egen temp_below_associates_min = min(below_associates)
bysort unitid: egen temp_below_associates_max = max(below_associates)
bysort unitid: gen temp_below_associates_flag ///
	= (temp_below_associates_min!=temp_below_associates_max)
sum if temp_below_associates_flag==1
drop if temp_below_associates_flag==1
drop temp_below_associates_*

* Create groups by university/community college/below associates
*egen level = group(university community_college below_associates), lname(level)
label def level 1 "University" 2 "Community College" 3 "Below Associates"
gen level:level = 1 if university==1
replace level = 2 if community_college==1
replace level = 3 if below_associates==1

* Create groups by type and level
egen owner_level = group(owner level), lname(owner_level)
/*label def owner_level 11 "Public University" 12 "Public Community College" ///
	13 "Public Below Associates" 21 "Private NFP University" ///
	22 "Private NFP Community College" 23 "Private NFP Below Associates" ///
	31 "Private FP University" 32 "Private FP Communty College" ///
	33 "Private FP Below Associates"
gen owner_level:owner_level = 10 * type + level*/

* Test score totals
gen sat_total_25 = satvr25 + satmt25
replace sat_total_25 = . if mi(satvr25, satmt25)
label var sat_total_25 "SAT 25th Percentile Total"
gen sat_total_75 = satvr75 + satmt75
replace sat_total_75 = . if mi(satvr75, satmt75)
label var sat_total_75 "SAT 75th Percentile Total"
rename actcm25 act_total_25
label var act_total_25 "ACT Total 25th Percentile"
rename actcm75 act_total_75
label var act_total_75 "ACT Total 75th Percentile"

* Admission rate
gen admission_rate = admssn / applcn
label var admission_rate "Admission Rate"

sum

sort unitid year
compress
save clean_data/institutional_characteristics_clean.dta, replace


timer off 1
timer list
log close
