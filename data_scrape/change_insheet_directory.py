#!/usr/bin/env python

"""Adds a line of code to the IPEDS insheet file changing the directory to the raw data folder"""

import os
from change_insheet_directory_function import ipeds_change_insheet_directory

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a do file")
        if file_name.endswith(".do"):
            print(file_name + " is a do file")
            print("Changing the insheet directory in " + file_name)
            file_path = os.path.join(directory_path, file_name)
            ipeds_change_insheet_directory(file_path)
