#!/usr/bin/env python

"""Creates a list of do files that encountered an error when attempting to create a dta file from an IPEDS csv file"""

import os
from log_error_function import ipeds_log_error

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
log_files_directory = os.path.join(ipeds_directory, "log_files")
error_log_files = list()

for directory_path, directory_names_list, file_names_list in os.walk(log_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a log file")
        if file_name.endswith(".log"):
            print(file_name + " is a log file")
            print("Checking for errors in log file " + file_name)
            log_file_path = os.path.join(directory_path, file_name)
            if ipeds_log_error(log_file_path):
                print("There is an error in log file " + file_name)
                error_log_files.append(file_name)

print("The following files encountered an error and could not be insheeted", error_log_files)
for file_name in error_log_files:
    print("Error running " + file_name)
