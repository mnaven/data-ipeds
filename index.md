# Using the IPEDS Data
While the IPEDS survey data contains a wealth of information, the data provided on the IPEDS website is not very user-friendly. This project provides files that create long form panel Stata datasets of IPEDS surveys for use in academic research. The files are free to download, use, and edit as you wish. If they have been helpful in furthering your research, a citation would be appreciated.

## Setup
You will need [Python 3+](https://www.python.org/downloads/) (the scripts will NOT run in Python 2) and Stata to run the code. Download either a zip or tarball of the code by clicking the download link at the top of the page then unzip/unpack this file which should contain one folder. I will refer to this folder as the _IPEDS directory_.

If the name of the _IPEDS directory_ has spaces in any part of its absolute path (such as _/users/naven/my documents/research/data/ipeds_), then Stata will incorrectly name all of the log files to the word before the first space (in this case _my.log_) so I recommend naming the _IPEDS directory_ without spaces and choosing a location in which the names of the folders containing the _IPEDS directory_ also have no spaces (such as _/users/naven/documents/research/data/ipeds_). Within the _IPEDS directory_, create a folder named _downloads_ (in all lowercase).

The current version as is only works for Mac, Windows, and Linux if Stata is installed in the default directory with the default name. If you installed Stata into a directory or under a name that is not the default, then you will need to paste the absolute path to the Stata executable file between the double quotes of the _stata_executable_path_ variable in the _create_dta.py_ file.

## Downloading the IPEDS Files
The raw data to create the datasets can be downloaded from the [IPEDS Data Center Complete Data Files](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx). My preferred method to download all of the files simultaneously is to use the Firefox extension [DownThemAll!](http://www.downthemall.net/) with the archives filter. Save all of the files to the _IPEDS directory/downloads_ folder.

## Code Instructions
Open the _run_all.py_ file in the _data_scrape_ folder using an IDE such as [Pycharm](https://www.jetbrains.com/pycharm/download/) or IDLE (included with Python) running Python 3+, and then click _run_. This will execute all of the Python scripts necessary to create individual year Stata datasets for each survey. Next run the do files in the _do_files_ folder to create panel Stata datasets for each survey.

## Types of Files

### Python Files
These files use Python to facilitate the organization and creation of raw (uncleaned) Stata .dta files for each academic year from the IPEDS Data Center Complete Data Files. These individual year files can then be appended to create Stata .dta files that contain all years of data for each survey. As mentioned above, the scripts operate under the assumption that the _IPEDS directory_ contains a subfolder named _downloads_ to which all IPEDS files are originally downloaded.

The project scripts do the following:

1. Delete duplicate/SPSS/SAS files

2. Sort data dictionaries to the corresponding year within the _codebooks_ folder

3. Sort .do files that create .dta files to the corresponding year within the _do_files_ folder

4. Sort raw .csv files to the corresponding year within the _raw_data_ folder

5. Change the directory in each do file to the _clean_data_ folder

6. Replace the default insheet file path which corresponds to a path local to IPEDS servers to the _raw_data_ folder

7. Add a capture command to each label command in the .do files (some files have incorrect labels or illegal characters)

8. Unzip all the files

9. Create .dta files from the raw .csv files

10. Delete all unnecessary unzipped files

A list of files for which a .dta file could not be successfully created from the raw .csv file is also created.

A README file describes the order in which each script should be run, although the _run_all.py_ script will automatically run the scripts in the correct order. The IPEDS files are originally downloaded as zipped files, however the project also includes functions and scripts that will edit unzipped files in case the files have already been unzipped or if edits only need to be made to an individual file.


### Do Files
After creating individual year .dta files using the Python scripts, these files append the individual years for each survey together and then clean the resulting datasets.


## Bugs
If you notice any bugs or errors, please notify me at [msnaven@ucdavis.edu](mailto:msnaven@ucdavis.edu).