#!/usr/bin/env python

"""Unzips all of the downloaded IPEDS files"""

import os
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"

# Go through all the files and folders contained in the IPEDS directory
for directory_path, directory_names_list, file_names_list in os.walk(ipeds_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a zip file")
        if file_name.endswith(".zip"):
            print(file_name + " is a zip file")
            zip_file_path = os.path.join(directory_path, file_name)
            with zipfile.ZipFile(zip_file_path, 'r') as zipped_file:
                print("Unzipping " + file_name + " to " + directory_path)
                zipped_file.extractall(directory_path)
