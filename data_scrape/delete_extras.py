#!/usr/bin/env python

"""Deletes duplicate, SPSS, and SAS files downloaded from IPEDS"""

import os
from delete_extras_function import ipeds_delete_extras

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
downloads_directory = os.path.join(ipeds_directory, "downloads")

for directory_path, directory_names_list, file_names_list in os.walk(downloads_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a duplicate, SPSS, or SAS file")
        file_path = os.path.join(directory_path, file_name)
        ipeds_delete_extras(file_path)
