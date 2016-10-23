#!/usr/bin/env python

"""Creates a function that sorts all of the downloaded IPEDS data files to the raw data folder"""

import os
from year_function import ipeds_year

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_raw_data_sort(raw_data_file_path):
    downloads_directory = os.path.dirname(raw_data_file_path)
    raw_data_directory = os.path.join(downloads_directory, os.path.pardir, "raw_data")
    if not os.path.exists(raw_data_directory):
        print("Creating folder " + raw_data_directory)
        os.makedirs(raw_data_directory)
    raw_data_file_name = os.path.basename(raw_data_file_path)

    raw_data_year = ipeds_year(raw_data_file_name)

    if raw_data_year is None:
        print("No data year found for " + raw_data_file_name)

    else:
        print("The data year for " + raw_data_file_name + " is " + raw_data_year)
        raw_data_year_folder_path = os.path.join(raw_data_directory, raw_data_year)
        if not os.path.exists(raw_data_year_folder_path):
            print("Creating folder " + raw_data_year_folder_path)
            os.makedirs(raw_data_year_folder_path)
        destination_file_path = os.path.join(raw_data_year_folder_path, raw_data_file_name)
        print("Renaming " + raw_data_file_path + " as " + destination_file_path)
        os.rename(raw_data_file_path, destination_file_path)
