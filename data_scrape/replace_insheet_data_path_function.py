#!/usr/bin/env python

"""Creates a function that changes the insheet data file path to match the local data file path in an IPEDS insheet file"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_replace_insheet_data_path(file_path):
    file_name = os.path.basename(file_path)

    path_replaced = None
    file_text = None

    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        print("Checking if insheet data path already replaced with Python in " + file_name)
        if file_text.find("* insheet data path replaced with python") != -1:
            path_replaced = True
        else:
            path_replaced = False

    if path_replaced is True:
        print("Insheet data path already replaced with Python in " + file_name)

    elif path_replaced is False:
        print("Insheet data path not already replaced with Python in " + file_name)
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Deleting original insheet file path in " + file_name)
            file_text = re.sub(r'insheet using .*\\', 'insheet using "', file_text)
            print("Marking " + file_name + " as edited")
            file_text = "* insheet data path replaced with python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
