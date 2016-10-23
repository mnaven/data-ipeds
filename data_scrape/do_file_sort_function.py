#!/usr/bin/env python

"""Creates a function that sorts all of the downloaded do files to the do_files folder"""

import os
from year_function import ipeds_year

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_do_file_sort(file_path):
    downloads_directory = os.path.dirname(file_path)
    do_files_directory = os.path.join(downloads_directory, os.path.pardir, "do_files")
    if not os.path.exists(do_files_directory):
        print("Creating folder " + do_files_directory)
        os.makedirs(do_files_directory)
    file_name = os.path.basename(file_path)

    year = ipeds_year(file_name)

    if year is None:
        print("No data year found for " + file_name)

    else:
        print("The data year for " + file_name + " is " + year)
        year_folder_path = os.path.join(do_files_directory, year)
        if not os.path.exists(year_folder_path):
            print("Creating folder " + year_folder_path)
            os.makedirs(year_folder_path)
        destination_file_path = os.path.join(year_folder_path, file_name)
        print("Renaming " + file_path + " as " + destination_file_path)
        os.rename(file_path, destination_file_path)
