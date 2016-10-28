#!/usr/bin/env python

"""Creates a function that changes the insheet data file path to match the local data file path in a zipped IPEDS insheet file"""

import os
import re
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_replace_insheet_data_path_zip(zipped_do_file_path):
    do_files_year_folder_path = os.path.dirname(zipped_do_file_path)
    raw_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "raw_data")
    zipped_do_file_name = os.path.basename(zipped_do_file_path)

    with zipfile.ZipFile(zipped_do_file_path, 'r') as zipped_do_file:
        print("Unzipping " + zipped_do_file_name)
        zipped_do_file.extractall(do_files_year_folder_path)
        unzipped_do_file_name = zipped_do_file.namelist()[0]
        unzipped_do_file_path = os.path.join(do_files_year_folder_path, unzipped_do_file_name)

        path_replaced = None
        unzipped_do_file_text = None

        with open(unzipped_do_file_path, 'r', encoding='iso-8859-1') as original_unzipped_do_file:
            unzipped_do_file_text = original_unzipped_do_file.read()
            print("Checking if insheet data path already replaced with Python in " + unzipped_do_file_name)
            if unzipped_do_file_text.find("* insheet data path replaced with python") != -1:
                path_replaced = True
            else:
                path_replaced = False

        if path_replaced:
            print("Insheet data path already replaced with Python in " + unzipped_do_file_name)

        elif not path_replaced:
            print("Insheet data path not already replaced with Python in " + unzipped_do_file_name)
            with open(unzipped_do_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_do_file:
                print("Deleting original insheet data path in " + unzipped_do_file_name)
                unzipped_do_file_text = re.sub(r'insheet using .*\\', 'insheet using "' + raw_data_year_folder_path + os.path.sep, unzipped_do_file_text)
                print("Marking " + unzipped_do_file_name + " as edited")
                unzipped_do_file_text = "* insheet data path replaced with python" + "\n" + unzipped_do_file_text
                print("Saving " + unzipped_do_file_name)
                edited_unzipped_do_file.write(unzipped_do_file_text)

    with zipfile.ZipFile(zipped_do_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_do_file:
        print("Zipping " + unzipped_do_file_name)
        zipped_do_file.write(unzipped_do_file_path, unzipped_do_file_name)
    print("Deleting " + unzipped_do_file_name)
    os.remove(unzipped_do_file_path)
