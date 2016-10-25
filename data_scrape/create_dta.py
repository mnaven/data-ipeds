#!/usr/bin/env python

"""Creates a dta file from an unzipped IPEDS csv file"""

import os
import sys
import glob
import re
from create_dta_function import ipeds_create_dta

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
do_files_directory = os.path.join(ipeds_directory, "do_files")
stata_executable_path = ""  # PASTE THE FULL PATH TO THE STATA EXECUTABLE FILE BETWEEN THE DOUBLE QUOTES IF STATA IS NOT INSTALLED IN THE DEFAULT LOCATION

# Go through all the files and folders contained in the directory, now including the unzipped files
for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a do file")
        if file_name.endswith(".do"):
            print(file_name + " is a do file")
            print("Creating a dta file with Stata using the do file " + file_name)
            do_file_path = os.path.join(directory_path, file_name)
            if stata_executable_path == "":
                ipeds_create_dta(do_file_path)
            else:
                ipeds_create_dta(do_file_path, stata_executable_path)
