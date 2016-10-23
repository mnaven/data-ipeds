#!/usr/bin/env python

"""Creates a function that prefixes capture to all of the label commands in a zipped IPEDS insheet file because some labels are incorrectly coded or contain illegal characters"""

import os
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_capture_label_zip(zipped_do_file_path):
    do_files_year_folder_path = os.path.dirname(zipped_do_file_path)
    zipped_do_file_name = os.path.basename(zipped_do_file_path)

    with zipfile.ZipFile(zipped_do_file_path, 'r') as zipped_do_file:
        print("Unzipping " + zipped_do_file_name)
        zipped_do_file.extractall(do_files_year_folder_path)
        unzipped_do_file_name = zipped_do_file.namelist()[0]
        unzipped_do_file_path = os.path.join(do_files_year_folder_path, unzipped_do_file_name)

        capture_prefixed = None
        unzipped_do_file_text = None

        with open(unzipped_do_file_path, 'r', encoding='iso-8859-1') as original_unzipped_do_file:
            unzipped_do_file_text = original_unzipped_do_file.read()
            print("Checking if capture already prefixed to label commands with Python in " + unzipped_do_file_name)
            if unzipped_do_file_text.find("* capture prefixed to label commands with python") != -1:
                capture_prefixed = True
            else:
                capture_prefixed = False

        if capture_prefixed:
            print("Capture already prefixed to label commands with Python in " + unzipped_do_file_name)

        elif not capture_prefixed:
            print("Capture not already prefixed to label commands with Python in " + unzipped_do_file_name)
            with open(unzipped_do_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_do_file:
                print("Prefixing capture to all label commands")
                unzipped_do_file_text = unzipped_do_file_text.replace("\n" + "label", "\n" + "capture label")
                print("Marking " + unzipped_do_file_name + " as edited")
                unzipped_do_file_text = "* capture prefixed to label commands with python" + "\n" + unzipped_do_file_text
                print("Saving " + unzipped_do_file_name)
                edited_unzipped_do_file.write(unzipped_do_file_text)

    with zipfile.ZipFile(zipped_do_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_do_file:
        print("Zipping " + unzipped_do_file_name)
        zipped_do_file.write(unzipped_do_file_path, unzipped_do_file_name)
    print("Deleting " + unzipped_do_file_name)
    os.remove(unzipped_do_file_path)
