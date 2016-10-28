#!/usr/bin/env python

"""Creates a function that adds a line of code to the zipped IPEDS insheet file changing the directory to the raw data folder"""

import os
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_change_insheet_directory_zip(zipped_do_file_path):
    do_files_year_folder_path = os.path.dirname(zipped_do_file_path)
    clean_data_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "clean_data")
    zipped_do_file_name = os.path.basename(zipped_do_file_path)

    with zipfile.ZipFile(zipped_do_file_path, 'r') as zipped_do_file:
        print("Unzipping " + zipped_do_file_name)
        zipped_do_file.extractall(do_files_year_folder_path)
        unzipped_do_file_name = zipped_do_file.namelist()[0]
        unzipped_do_file_path = os.path.join(do_files_year_folder_path, unzipped_do_file_name)

        cd_added = None
        unzipped_do_file_text = None

        with open(unzipped_do_file_path, 'r', encoding='iso-8859-1') as original_unzipped_do_file:
            unzipped_do_file_text = original_unzipped_do_file.read()
            print("Checking if insheet directory already changed with Python in " + unzipped_do_file_name)
            if unzipped_do_file_text.find("* directory changed with python") != -1:
                cd_added = True
            else:
                cd_added = False

        if cd_added:
            print("Insheet directory already changed with Python in " + unzipped_do_file_name)

        elif not cd_added:
            print("Insheet directory not already changed with Python in " + unzipped_do_file_name)
            with open(unzipped_do_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_do_file:
                print("Adding cd " + clean_data_year_folder_path + " to " + unzipped_do_file_name)
                unzipped_do_file_text = 'cd "' + clean_data_year_folder_path + '"' + '\n' + unzipped_do_file_text
                print("Marking " + unzipped_do_file_name + " as edited")
                unzipped_do_file_text = "* directory changed with python" + "\n" + unzipped_do_file_text
                print("Saving " + unzipped_do_file_name)
                edited_unzipped_do_file.write(unzipped_do_file_text)

    with zipfile.ZipFile(zipped_do_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_do_file:
        print("Zipping " + unzipped_do_file_name)
        zipped_do_file.write(unzipped_do_file_path, unzipped_do_file_name)
    print("Deleting " + unzipped_do_file_name)
    os.remove(unzipped_do_file_path)
