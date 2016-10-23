#!/usr/bin/env python

"""Prefixes capture to all of the label commands in a IPEDS insheet file because some labels are incorrectly coded or contain illegal characters"""

import os
from capture_label_function import ipeds_capture_label

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a do file")
        if file_name.endswith(".do"):
            print(file_name + " is a do file")
            print("Prefixing capture to all label commands in " + file_name)
            do_file_path = os.path.join(directory_path, file_name)
            ipeds_capture_label(do_file_path)
