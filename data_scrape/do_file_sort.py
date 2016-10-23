#!/usr/bin/env python

"""Sorts all of the downloaded IPEDS do files to the do files folder"""

import os
from year_function import ipeds_year
from do_file_sort_function import ipeds_do_file_sort

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
downloads_directory = os.path.join(ipeds_directory, "downloads")
no_do_file_year_list = list()

for file_name in os.listdir(downloads_directory):
    print("Checking if " + file_name + " is a do file")
    if os.path.splitext(file_name)[0].endswith("Stata") and not os.path.splitext(file_name)[0].endswith("Data_Stata"):
        print(file_name + " is a do file")
        do_file_path = os.path.join(downloads_directory, file_name)

        do_file_year = ipeds_year(file_name)

        if do_file_year is None:
            print("No data year found for " + file_name)
            no_do_file_year_list.append(file_name)

        else:
            ipeds_do_file_sort(do_file_path)

print("The following files could not be sorted into a do file year folder", no_do_file_year_list)
