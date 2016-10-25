#!/usr/bin/env python

"""Creates a function that creates a dta file from an unzipped IPEDS csv file"""

import os
import subprocess

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_create_dta(do_file_path, stata_executable_path=None):
    do_files_year_folder_path = os.path.dirname(do_file_path)
    log_files_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "log_files")
    if not os.path.exists(log_files_year_folder_path):
        print("Creating folder " + log_files_year_folder_path)
        os.makedirs(log_files_year_folder_path)
    do_file_name = os.path.basename(do_file_path)

    os.chdir(log_files_year_folder_path)

    if " " not in do_file_path:
        do_command = [stata_executable_path, "-e", "do", do_file_path]

    else:
        quoted_do_file_path = '"' + do_file_path + '"'
        do_command = [stata_executable_path, "-e", "do", quoted_do_file_path]

    print("Running " + do_file_name + " in Stata")
    subprocess.run(do_command)
