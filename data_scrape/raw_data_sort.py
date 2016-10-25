#!/usr/bin/env python

"""Sorts all of the downloaded IPEDS data files to the raw data folder"""

import os
from year_function import ipeds_year
from raw_data_sort_function import ipeds_raw_data_sort

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
downloads_directory = os.path.join(ipeds_directory, "downloads")
no_raw_data_year_list = list()

for file_name in os.listdir(downloads_directory):
    print("Checking if " + file_name + " is a data file")
    if os.path.splitext(file_name)[0].endswith("Data_Stata") or not (os.path.splitext(file_name)[0].endswith("Dict") or os.path.splitext(file_name)[0].endswith("Stata")):
        print(file_name + " is a data file")
        raw_data_file_path = os.path.join(downloads_directory, file_name)

        raw_data_year = ipeds_year(file_name)

        if raw_data_year is None:
            print("No data year found for " + file_name)
            no_raw_data_year_list.append(file_name)

        else:
            ipeds_raw_data_sort(raw_data_file_path)

print("The following files could not be sorted into a data year folder", no_raw_data_year_list)
