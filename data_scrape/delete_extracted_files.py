#!/usr/bin/env python

"""Deletes all IPEDS do, csv, and html files after the dta files have been created"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)

# Go through all the files and folders contained in the directory, now including the created dta files
for directory_path, directory_names_list, file_names_list in os.walk(ipeds_directory):
    directory_name = os.path.basename(directory_path)
    if directory_name == "codebooks":
        if re.fullmatch("[0-9]{4}", directory_name):
            for file_name in file_names_list:
                file_path = os.path.join(directory_path, file_name)
                print("Checking if " + file_name + " is a zip file")
                if file_name.endswith(".zip"):
                    print(file_name + " is a zip file")
                    print("Deleting " + file_name)
                    os.remove(file_path)

    if directory_name == "do_files":
        if re.fullmatch("[0-9]{4}", directory_name):
            for file_name in file_names_list:
                file_path = os.path.join(directory_path, file_name)
                print("Checking if " + file_name + " is a do file")
                if file_name.endswith(".do"):
                    print(file_name + " is a do file")
                    print("Deleting " + file_name)
                    os.remove(file_path)

    if directory_name == "raw_data":
        if re.fullmatch("[0-9]{4}", directory_name):
            for file_name in file_names_list:
                file_path = os.path.join(directory_path, file_name)
                print("Checking if " + file_name + " is a csv file")
                if file_name.endswith(".csv"):
                    print(file_name + " is a csv file")
                    print("Deleting " + file_name)
                    os.remove(file_path)
