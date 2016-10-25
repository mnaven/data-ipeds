#!/usr/bin/env python

"""Changes the insheet data file path to match the local data file path in a zipped IPEDS insheet file"""

import os
from zip_contains_do_file_function import zip_contains_do_file
from replace_insheet_data_path_zip_function import ipeds_replace_insheet_data_path_zip

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a zip file")
        if file_name.endswith(".zip"):
            print(file_name + " is a zip file")
            print("Checking if " + file_name + " contains a do file")
            zip_file_path = os.path.join(directory_path, file_name)
            if zip_contains_do_file(zip_file_path):
                print(file_name + " contains a do file")
                print("Replacing the insheet data path in " + file_name)
                ipeds_replace_insheet_data_path_zip(zip_file_path)
