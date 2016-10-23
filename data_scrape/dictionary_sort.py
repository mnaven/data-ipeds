#!/usr/bin/env python

"""Sorts all of the downloaded IPEDS dictionary files to the codebooks folder"""

import os
from year_function import ipeds_year
from dictionary_sort_function import ipeds_dictionary_sort

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
downloads_directory = os.path.join(ipeds_directory, "downloads")
no_dictionary_year_list = list()

for file_name in os.listdir(downloads_directory):
    print("Checking if " + file_name + " is a dictionary file")
    if os.path.splitext(file_name)[0].endswith("Dict"):
        print(file_name + " is a dictionary file")
        dictionary_file_path = os.path.join(downloads_directory, file_name)

        dictionary_year = ipeds_year(file_name)

        if dictionary_year is None:
            print("No dictionary year found for " + file_name)
            no_dictionary_year_list.append(file_name)

        else:
            ipeds_dictionary_sort(dictionary_file_path)

print("The following files could not be sorted into a dictionary year folder", no_dictionary_year_list)
