#!/usr/bin/env python

"""Creates a function that adds a line of code to the zipped IPEDS insheet file changing the directory to the raw data folder"""

import os
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_change_insheet_directory_zip(zipped_file_path):
    do_files_year_folder_path = os.path.dirname(zipped_file_path)
    raw_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "raw_data")
    zipped_file_name = os.path.basename(zipped_file_path)

    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        print("Unzipping " + zipped_file_name)
        zipped_file.extractall(do_files_year_folder_path)
        unzipped_file_name = zipped_file.namelist()[0]
        unzipped_file_path = os.path.join(do_files_year_folder_path, unzipped_file_name)

        cd_added = None
        unzipped_file_text = None

        with open(unzipped_file_path, 'r', encoding='iso-8859-1') as original_unzipped_file:
            unzipped_file_text = original_unzipped_file.read()
            print("Checking if insheet directory already changed with Python in " + unzipped_file_name)
            if unzipped_file_text.find("* directory changed with python") != -1:
                cd_added = True
            else:
                cd_added = False

        if cd_added is True:
            print("Insheet directory already changed with Python in " + unzipped_file_name)

        elif cd_added is False:
            print("Insheet directory not already changed with Python in " + unzipped_file_name)
            with open(unzipped_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_file:
                print("Adding cd " + raw_data_year_folder_path + " to " + unzipped_file_name)
                unzipped_file_text = 'cd "' + raw_data_year_folder_path + '"' + '\n' + unzipped_file_text
                print("Marking " + unzipped_file_name + " as edited")
                unzipped_file_text = "* directory changed with python" + "\n" + unzipped_file_text
                print("Saving " + unzipped_file_name)
                edited_unzipped_file.write(unzipped_file_text)

    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
        print("Zipping " + unzipped_file_name)
        zipped_file.write(unzipped_file_path, unzipped_file_name)
    print("Deleting " + unzipped_file_name)
    os.remove(unzipped_file_path)
