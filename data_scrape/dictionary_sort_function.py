#!/usr/bin/env python

"""Creates a function that sorts all of the downloaded IPEDS dictionary files to the codebooks folder"""

import os
from year_function import ipeds_year

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_dictionary_sort(dictionary_file_path):
    downloads_directory = os.path.dirname(dictionary_file_path)
    codebooks_directory = os.path.join(downloads_directory, os.path.pardir, "codebooks")
    if not os.path.exists(codebooks_directory):
        print("Creating folder " + codebooks_directory)
        os.makedirs(codebooks_directory)
    dictionary_file_name = os.path.basename(dictionary_file_path)

    dictionary_year = ipeds_year(dictionary_file_name)

    if dictionary_year is None:
        print("No dictionary year found for " + dictionary_file_name)

    else:
        print("The dictionary year for " + dictionary_file_name + " is " + dictionary_year)
        codebooks_year_folder_path = os.path.join(codebooks_directory, dictionary_year)
        if not os.path.exists(codebooks_year_folder_path):
            print("Creating folder " + codebooks_year_folder_path)
            os.makedirs(codebooks_year_folder_path)
        destination_file_path = os.path.join(codebooks_year_folder_path, dictionary_file_name)
        print("Renaming " + dictionary_file_path + " as " + destination_file_path)
        os.rename(dictionary_file_path, destination_file_path)
