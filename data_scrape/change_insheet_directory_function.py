#!/usr/bin/env python

"""Creates a function that adds a line of code to the IPEDS insheet file changing the directory to the raw data folder"""

import os

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_change_insheet_directory(file_path):
    do_files_year_folder_path = os.path.dirname(file_path)
    raw_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "raw_data")
    file_name = os.path.basename(file_path)

    cd_added = None
    file_text = None

    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        print("Checking if insheet directory already changed with Python in " + file_name)
        if file_text.find("* directory changed with python") != -1:
            cd_added = True
        else:
            cd_added = False

    if cd_added is True:
        print("Insheet directory already changed with Python in " + file_name)

    elif cd_added is False:
        print("Insheet directory not already changed with Python in " + file_name)
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Adding cd " + raw_data_year_folder_path + " to " + file_name)
            file_text = 'cd "' + raw_data_year_folder_path + '"' + '\n' + file_text
            print("Marking " + file_name + " as edited")
            file_text = "* directory changed with python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
