#!/usr/bin/env python

"""Creates a function that creates a dta file from the unzipped IPEDS csv files"""

import os
import subprocess

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_create_dta(file_path, stata_executable_path):
    do_files_year_folder_path = os.path.dirname(file_path)
    log_files_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "log_files")
    if not os.path.exists(log_files_year_folder_path):
        print("Creating folder " + log_files_year_folder_path)
        os.makedirs(log_files_year_folder_path)
    file_name = os.path.basename(file_path)

    os.chdir(log_files_year_folder_path)

    if " " not in file_path:
        do_command = [stata_executable_path, "-e", "do", file_path]

    else:
        quoted_file_path = '"' + file_path + '"'
        do_command = [stata_executable_path, "-e", "do", quoted_file_path]

    print("Running " + file_name + " in Stata")
    subprocess.run(do_command)
