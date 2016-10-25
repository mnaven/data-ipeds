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
    if re.fullmatch("[0-9]{4}", directory_name):
        for file_name in file_names_list:
            file_path = os.path.join(directory_path, file_name)
            # Check to see if the file came from a zipped file
            print("Checking if " + file_name + " is a do, csv, or html file")

            if file_name.endswith(".dta"):
                print(file_name + " is a dta file")
                print("Keeping " + file_name)

            elif file_name.endswith(".log"):
                print(file_name + " is a log file")
                print("Keeping " + file_name)

            elif file_name.endswith(".do"):
                print(file_name + " is a do file")
                print("Deleting " + file_name)
                os.remove(file_path)

            elif file_name.endswith(".csv"):
                print(file_name + " is a csv file")
                print("Deleting " + file_name)
                os.remove(file_path)

            # elif file_name.endswith(".html"):
            #     print(file_name + " is an html file")
            #     print("Deleting " + file_name)
            #     os.remove(file_path)
