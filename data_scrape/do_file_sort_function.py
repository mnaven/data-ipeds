#!/usr/bin/env python

"""Creates a function that sorts all of the downloaded IPEDS do files to the do files folder"""

import os
from year_function import ipeds_year

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_do_file_sort(do_file_path):
    downloads_directory = os.path.dirname(do_file_path)
    do_files_directory = os.path.join(downloads_directory, os.path.pardir, "do_files")
    if not os.path.exists(do_files_directory):
        print("Creating folder " + do_files_directory)
        os.makedirs(do_files_directory)
    do_file_name = os.path.basename(do_file_path)

    do_file_year = ipeds_year(do_file_name)

    if do_file_year is None:
        print("No data year found for " + do_file_name)

    else:
        print("The data year for " + do_file_name + " is " + do_file_year)
        do_file_year_folder_path = os.path.join(do_files_directory, do_file_year)
        if not os.path.exists(do_file_year_folder_path):
            print("Creating folder " + do_file_year_folder_path)
            os.makedirs(do_file_year_folder_path)
        destination_file_path = os.path.join(do_file_year_folder_path, do_file_name)
        print("Renaming " + do_file_path + " as " + destination_file_path)
        os.rename(do_file_path, destination_file_path)
