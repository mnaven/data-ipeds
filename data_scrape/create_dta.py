#!/usr/bin/env python

"""Creates a dta file from an unzipped IPEDS csv file"""

import os
import sys
from create_dta_function import ipeds_create_dta

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
do_files_directory = os.path.join(ipeds_directory, "do_files")

os_platform = sys.platform

if os_platform == "darwin":
    operating_system = "Mac"
    stata_directory = "/Applications/Stata"
    if os.path.exists(os.path.join(stata_directory, "StataMP.app")):
        stata_flavor = "MP"
        stata_console_executable_path = "/Applications/Stata/StataMP.app/Contents/MacOS/stata-mp"
        stata_gui_executable_path = "/Applications/Stata/StataMP.app/Contents/MacOS/StataMP"
    elif os.path.exists(os.path.join(stata_directory, "StataSE.app")):
        stata_flavor = "SE"
        stata_console_executable_path = "/Applications/Stata/StataSE.app/Contents/MacOS/stata-se"
        stata_gui_executable_path = "/Applications/Stata/StataSE.app/Contents/MacOS/StataSE"
    elif os.path.exists(os.path.join(stata_directory, "Stata.app")):
        stata_flavor = "IC"
        stata_gui_executable_path = "/Applications/Stata/Stata.app/Contents/MacOS/Stata"
    elif os.path.exists(os.path.join(stata_directory, "smStata.app")):
        stata_flavor = "Small"
        stata_gui_executable_path = "/Applications/Stata/smStata.app/Contents/MacOS/smStata"

elif os_platform == "win32" or os_platform == "cygwin":
    operating_system = "Windows"

elif os_platform.startswith("linux"):
    operating_system = "Linux"
    stata_directory = "/user/local/bin"
    if os.path.exists(os.path.join(stata_directory, "stata-mp")):
        stata_flavor = "MP"
        stata_console_executable_path = os.path.join(stata_directory, "stata-mp")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata-mp")
    elif os.path.exists(os.path.join(stata_directory, "stata-se")):
        stata_flavor = "SE"
        stata_console_executable_path = os.path.join(stata_directory, "stata-se")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata-se")
    elif os.path.exists(os.path.join(stata_directory, "stata")):
        stata_flavor = "IC"
        stata_console_executable_path = os.path.join(stata_directory, "stata")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata")

# Go through all the files and folders contained in the directory, now including the unzipped files
for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a do file")
        if file_name.endswith(".do"):
            print(file_name + " is a do file")
            print("Creating a dta file with Stata using the do file " + file_name)
            do_file_path = os.path.join(directory_path, file_name)
            if stata_console_executable_path is not None:
                ipeds_create_dta(do_file_path, stata_console_executable_path)
            else:
                ipeds_create_dta(do_file_path, stata_gui_executable_path)
