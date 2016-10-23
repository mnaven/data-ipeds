#!/usr/bin/env python

"""Checks if the do file that insheets an IPEDS csv file to a dta file has any errors in the log file"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_log_error(log_file_path):
    log_file_name = os.path.basename(log_file_path)

    with open(log_file_path, 'r', encoding='iso-8859-1') as log_file:
        log_file_text = log_file.read()
        error_code_search = re.search("r\([0-9]{1,4}\);", log_file_text)

        if error_code_search:
            if error_code_search.group() == "r(602);":
                print(log_file_name + " has already been used to create a .dta file")
                return False

            else:
                print("There is an error in log file " + log_file_name)
                return True

        else:
            print("No errors in log file " + log_file_name)
            return False
