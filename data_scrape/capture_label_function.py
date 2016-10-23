#!/usr/bin/env python

"""Creates a function that prefixes capture to all of the label commands in the IPEDS insheet file because some labels are incorrectly coded or contain illegal characters"""

import os

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_capture_label(file_path):
    file_name = os.path.basename(file_path)

    capture_prefixed = None
    file_text = None

    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        print("Checking if capture already prefixed to label commands with Python in " + file_name)
        if file_text.find("* capture prefixed to label commands with python") != -1:
            capture_prefixed = True
        else:
            capture_prefixed = False

    if capture_prefixed is True:
        print("Capture already prefixed to label commands with Python in " + file_name)

    elif capture_prefixed is False:
        print("Capture not already prefixed to label commands with Python in " + file_name)
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Prefixing capture to all label commands")
            file_text = file_text.replace("\n" + "label", "\n" + "capture label")
            print("Marking " + file_name + " as edited")
            file_text = "* capture prefixed to label commands with python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
