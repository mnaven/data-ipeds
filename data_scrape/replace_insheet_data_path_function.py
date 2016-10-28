#!/usr/bin/env python

"""Creates a function that changes the insheet data file path to match the local data file path in an IPEDS insheet file"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_replace_insheet_data_path(do_file_path):
    do_files_year_folder_path = os.path.dirname(do_file_path)
    raw_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "raw_data")
    do_file_name = os.path.basename(do_file_path)

    path_replaced = None
    do_file_text = None

    with open(do_file_path, 'r', encoding='iso-8859-1') as original_do_file:
        do_file_text = original_do_file.read()
        print("Checking if insheet data path already replaced with Python in " + do_file_name)
        if do_file_text.find("* insheet data path replaced with python") != -1:
            path_replaced = True
        else:
            path_replaced = False

    if path_replaced:
        print("Insheet data path already replaced with Python in " + do_file_name)

    elif not path_replaced:
        print("Insheet data path not already replaced with Python in " + do_file_name)
        with open(do_file_path, 'w', encoding='iso-8859-1') as edited_do_file:
            print("Deleting original insheet file path in " + do_file_name)
            do_file_text = re.sub(r'insheet using .*\\', 'insheet using "' + raw_data_year_folder_path + os.path.sep, do_file_text)
            print("Marking " + do_file_name + " as edited")
            do_file_text = "* insheet data path replaced with python" + "\n" + do_file_text
            print("Saving " + do_file_name)
            edited_do_file.write(do_file_text)
