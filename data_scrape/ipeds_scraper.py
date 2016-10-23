from bs4 import BeautifulSoup
import requests
import re
import os
from ipeds_year import ipeds_year
from replace_insheet_data_path_zip import ipeds_replace_insheet_data_path_zip

__author__ = 'Naven'


# Directory where files will be saved
directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
# Adding years of data
all_years = ["1980"]
for year in range(1984, 2015, 1):
    all_years.append(str(year))

# Main IPEDS data webpage
ipeds_url = "https://nces.ed.gov/ipeds/datacenter/Default.aspx"

# Starts sessions so that cookies can be saved for the session
session = requests.session()

# Request IPEDS website
print("Requesting " + ipeds_url)
ipeds_get1 = requests.get(ipeds_url)

# Save content of IPEDS website
print("Saving content of IPEDS request")
ipeds_get1_content = BeautifulSoup(ipeds_get1.content)

# Find element with name __VIEWSTATE
viewstate1 = ipeds_get1_content.find(id='__VIEWSTATE')
# Find element with name __VIEWSTATEGENERATOR
viewstategenerator1 = ipeds_get1_content.find(id='__VIEWSTATEGENERATOR')

# Get value of __VIEWSTATE
viewstate1_value = viewstate1.get('value')
print("__VIEWSTATE value is " + viewstate1_value)
# Get value of __VIEWSTATEGENERATOR
viewstategenerator1_value = viewstategenerator1.get('value')
print("__VIEWSTATEGENERATOR value is " + viewstategenerator1_value)
# Set report type equal to download survey files
reporttypeid_value = "7"
print("Setting reportTypeId value equal to " + reporttypeid_value)

# Elements by name along with their desired values
name_values1 = {
    '__VIEWSTATE':viewstate1_value,
    '__VIEWSTATEGENERATOR':viewstategenerator1_value,
    'reportTypeId':reporttypeid_value,
}

# Post values to IPEDS login
print("Posting values to IPEDS login")
ipeds_post1 = requests.post('https://nces.ed.gov/ipeds/datacenter/login.aspx', data=name_values1)

# Save content of IPEDS website
print("Saving content of IPEDS login post")
ipeds_post1_content = BeautifulSoup(ipeds_post1.content)

# Find element with name __VIEWSTATE
viewstate2 = ipeds_post1_content.find(id='__VIEWSTATE')
# Find element with name __VIEWSTATEGENERATOR
viewstategenerator2 = ipeds_post1_content.find(id='__VIEWSTATEGENERATOR')
# Find element with name __EVENTVALIDATION
eventvalidation2 = ipeds_post1_content.find(id='__EVENTVALIDATION')
# Find element with name ibtnLoginLevelOne.x
ibtnloginlevelonex2 = ipeds_post1_content.find(id='ibtnLoginLevelOne.x')
# Find element with name ibtnLoginLevelOne.y
ibtnloginleveloney2 = ipeds_post1_content.find(id='ibtnLoginLevelOne.y')
# Find element with name rbInstLevelUseRevData
rbinstleveluserevdata2 = ipeds_post1_content.find(id='rbInstLevelUseRevData')

# Get value of __VIEWSTATE
viewstate2_value = viewstate2.get('value')
print("__VIEWSTATE value is " + viewstate2_value)
# Get value of __VIEWSTATEGENERATOR
viewstategenerator2_value = viewstategenerator2.get('value')
print("__VIEWSTATEGENERATOR value is " + viewstategenerator2_value)
# Get value of __EVENTVALIDATION
eventvalidation2_value = eventvalidation2.get('value')
print("__EVENTVALIDATION value is " + eventvalidation2_value)
# Set data type equal to final provisional data
rbguestuserevdata_value = "yes"
print("Setting rbGuestUseRevData value equal to " + rbguestuserevdata_value)
# Get value of ibtnLoginLevelOne.x
ibtnloginlevelonex2_value = ibtnloginlevelonex2.get('value')
print("ibtnLoginLevelOne.x value is " + ibtnloginlevelonex2_value)
# Get value of ibtnLoginLevelOne.y
ibtnloginleveloney2_value = ibtnloginleveloney2.get('value')
print("ibtnLoginLevelOne.y value is " + ibtnloginleveloney2_value)
# Get value of rbInstLevelUseRevData
rbinstleveluserevdata2_value = rbinstleveluserevdata2.get('value')
print("rbInstLevelUseRevData value is " + rbinstleveluserevdata2_value)
# Set value of rbInstLevelUseRevData
#rb_inst_level_use_rev_data = 'yes'

# Elements by name along with their desired values
name_values2 = {
    '__VIEWSTATE':viewstate2_value,
    '__VIEWSTATEGENERATOR':viewstategenerator2_value,
    '__EVENTVALIDATION':eventvalidation2_value,
    'rbGuestUseRevData':rbguestuserevdata_value,
    'ibtnLoginLevelOne.x':ibtnloginlevelonex2_value,
    'ibtnLoginLevelOne.y':ibtnloginleveloney2_value,
    'rbInstLevelUseRevData':rbinstleveluserevdata2_value
}

# Post values to IPEDS login
print("Posting values to IPEDS login")
ipeds_post2 = requests.post('https://nces.ed.gov/ipeds/datacenter/login.aspx', data=name_values2)

# Get redirector after posting values
print("Requesting IPEDS redirect")
ipeds_get3 = requests.get('https://nces.ed.gov/ipeds/datacenter/loginRedirector2.aspx')

# Get IPEDS data website
print("Requesting IPEDS data files")
ipeds_get4 = requests.get('https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx')

# Save content of IPEDS website
print("Saving content of IPEDS data files request")
ipeds_get4_content = BeautifulSoup(ipeds_get4.content)

# Find element with name __VIEWSTATE
viewstate4 = ipeds_get4_content.find(id='__VIEWSTATE')
# Find element with name __VIEWSTATEGENERATOR
viewstategenerator4 = ipeds_get4_content.find(id='__VIEWSTATEGENERATOR')
# Find element with name __EVENTVALIDATION
eventvalidation4 = ipeds_get4_content.find(id='__EVENTVALIDATION')
# Find element with name ctl00%24contentPlaceHolder%24ibtnContinue.x
ctl00contentplaceholderibtncontinuex4 = ipeds_get4_content.find(id='ctl00%24contentPlaceHolder%24ibtnContinue.x')
# Find element with name ctl00%24contentPlaceHolder%24ibtnContinue.y
ctl00contentplaceholderibtncontinuey4 = ipeds_get4_content.find(id='ctl00%24contentPlaceHolder%24ibtnContinue.y')

# Get value of __VIEWSTATE
viewstate4_value = viewstate4.get('value')
print("__VIEWSTATE value is " + viewstate4_value)
# Get value of __VIEWSTATEGENERATOR
viewstategenerator4_value = viewstategenerator4.get('value')
print("__VIEWSTATEGENERATOR value is " + viewstategenerator4_value)
# Get value of __EVENTVALIDATION
eventvalidation4_value = eventvalidation4.get('value')
print("__EVENTVALIDATION value is " + eventvalidation4_value)
# Set years equal to all years
ctl00contentplaceholderddlyears_value = '-1'
print("Setting ctl00%24contentPlaceHolder%24ddlYears value equal to " + ctl00contentplaceholderddlyears_value)
# Set survey equal to all surveys
ddlsurveys_value = '-1'
print("ddlSurveys value is " + ddlsurveys_value)
# Get value of ctl00%24contentPlaceHolder%24ibtnContinue.x
ctl00contentplaceholderibtncontinuex4_value = ctl00contentplaceholderibtncontinuex4.get('value')
print("ctl00%24contentPlaceHolder%24ibtnContinue.x value is " + ctl00contentplaceholderibtncontinuex4_value)
# Get value of ctl00%24contentPlaceHolder%24ibtnContinue.y
ctl00contentplaceholderibtncontinuey4_value = ctl00contentplaceholderibtncontinuey4.get('value')
print("ctl00%24contentPlaceHolder%24ibtnContinue.y value is " + ctl00contentplaceholderibtncontinuey4_value)

# Elements by name along with their desired values
name_values4 = {
    '__VIEWSTATE':viewstate4_value,
    '__VIEWSTATEGENERATOR':viewstategenerator4_value,
    '__EVENTVALIDATION':eventvalidation4_value,
    'ctl00%24contentPlaceHolder%24ddlYears':ctl00contentplaceholderddlyears_value,
    'ddlSurveys':ddlsurveys_value,
    'ctl00%24contentPlaceHolder%24ibtnContinue.x':ctl00contentplaceholderibtncontinuex4_value,
    'ctl00%24contentPlaceHolder%24ibtnContinue.y':ctl00contentplaceholderibtncontinuey4_value,
}

# Post values to IPEDS data files
print("Posting values to IPEDS data files")
ipeds_post5 = requests.post('https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx', data=name_values4)

# Save content of IPEDS website
print("Saving content of post to IPEDS data files")
ipeds_post5_content = BeautifulSoup(ipeds_post5.content)

url_list = list()

for link in ipeds_post5_content.find_all('a', href=True):
    if link.endswith(".zip") and link.endswith("SPS.zip")==False and link.endswith("SAS.zip")==False:
        print("Adding link " + link['href'])
        url_list.append(link['href'])

for url in url_list:
    zipped_file_name = os.path.basename(url)
    year = ipeds_year(url)
    year_folder_path = os.path.join(directory, year)
    zipped_file_path = os.path.join(year_folder_path, zipped_file_name)
    if url.endswith('SPS.zip'):
        print("Skipping SPSS dictionary file")
    elif url.endswith('SAS.zip'):
        print("Skipping SAS dictionary file")
    else:
        print("Requesting " + url)
        url_request = requests.get(url)
        if url_request.status_code == 404:
            print("404 Error")
        else:
            with open(zipped_file_path, "wb") as zipped_file:
                print("Saving " + zipped_file_name)
                zipped_file.write(url_request.content)

            ipeds_replace_insheet_data_path_zip(zipped_file_path)

            # with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
            #     unzipped_file_name = zipped_file.namelist()[0]
            #     unzipped_file_path = directory + year + "/" + unzipped_file_name
            #     if unzipped_file_name.endswith('.do',):
            #         print("Unzipping file " + zipped_file_name)
            #         zipped_file.extractall(directory + year)
            #         unzipped_file_text = None
            #         with open(unzipped_file_path, 'r') as unzipped_file:
            #             unzipped_file_text = unzipped_file.read()
            #             print("Replacing file path in " + unzipped_file_name + " with " + directory + year + '/')
            #             unzipped_file_text = re.sub(r'insheet using .*\\', 'insheet using ' + '"' + directory + year + '/', unzipped_file_text)
            #         with open(unzipped_file_path, 'w') as unzipped_file:
            #             print("Saving file " + unzipped_file_name)
            #             unzipped_file.write(unzipped_file_text)
            #         with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
            #             print("Zipping file " + unzipped_file_name)
            #             zipped_file.write(unzipped_file_path,unzipped_file_name)
            #         print("Deleting " + unzipped_file_name)
            #         os.remove(unzipped_file_path)

session.close()
