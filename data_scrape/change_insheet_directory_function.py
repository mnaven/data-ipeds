#!/usr/bin/env python

"""Creates a function that adds a line of code to the IPEDS insheet file changing the directory to the raw data folder"""

import os

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_change_insheet_directory(do_file_path):
    do_files_year_folder_path = os.path.dirname(do_file_path)
    raw_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "raw_data")
    do_file_name = os.path.basename(do_file_path)

    cd_added = None
    do_file_text = None

    with open(do_file_path, 'r', encoding='iso-8859-1') as original_do_file:
        do_file_text = original_do_file.read()
        print("Checking if insheet directory already changed with Python in " + do_file_name)
        if do_file_text.find("* directory changed with python") != -1:
            cd_added = True
        else:
            cd_added = False

    if cd_added:
        print("Insheet directory already changed with Python in " + do_file_name)

    elif not cd_added:
        print("Insheet directory not already changed with Python in " + do_file_name)
        with open(do_file_path, 'w', encoding='iso-8859-1') as edited_do_file:
            print("Adding cd " + raw_data_year_folder_path + " to " + do_file_name)
            do_file_text = 'cd "' + raw_data_year_folder_path + '"' + '\n' + do_file_text
            print("Marking " + do_file_name + " as edited")
            do_file_text = "* directory changed with python" + "\n" + do_file_text
            print("Saving " + do_file_name)
            edited_do_file.write(do_file_text)
