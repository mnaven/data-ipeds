#!/usr/bin/env python

"""Prefixes capture to all of the label commands in a IPEDS insheet file because some labels are incorrectly coded or contain illegal characters"""

import os
import re
from capture_label_function import ipeds_capture_label

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    directory_name = os.path.basename(directory_path)
    if re.fullmatch("[0-9]{4}", directory_name):
        for file_name in file_names_list:
            print("Checking if " + file_name + " is a do file")
            if file_name.endswith(".do"):
                print(file_name + " is a do file")
                print("Prefixing capture to all label commands in " + file_name)
                do_file_path = os.path.join(directory_path, file_name)
                ipeds_capture_label(do_file_path)
