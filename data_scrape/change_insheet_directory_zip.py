#!/usr/bin/env python

"""Adds a line of code to the zipped IPEDS insheet file changing the directory to the raw data folder"""

import os
from zip_contains_do_file_function import zip_contains_do_file
from change_insheet_directory_zip_function import ipeds_change_insheet_directory_zip

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a zip file")
        if file_name.endswith(".zip"):
            print(file_name + " is a zip file")
            print("Checking if " + file_name + " contains a do file")
            file_path = os.path.join(directory_path, file_name)
            if zip_contains_do_file(file_path):
                print(file_name + " contains a do file")
                print("Changing the insheet directory in " + file_name)
                ipeds_change_insheet_directory_zip(file_path)
