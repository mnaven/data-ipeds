#!/usr/bin/env python

"""Creates a function that prefixes capture to all of the label commands in a IPEDS insheet file because some labels are incorrectly coded or contain illegal characters"""

import os

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_capture_label(do_file_path):
    do_file_name = os.path.basename(do_file_path)

    capture_prefixed = None
    do_file_text = None

    with open(do_file_path, 'r', encoding='iso-8859-1') as original_do_file:
        do_file_text = original_do_file.read()
        print("Checking if capture already prefixed to label commands with Python in " + do_file_name)
        if do_file_text.find("* capture prefixed to label commands with python") != -1:
            capture_prefixed = True
        else:
            capture_prefixed = False

    if capture_prefixed:
        print("Capture already prefixed to label commands with Python in " + do_file_name)

    elif not capture_prefixed:
        print("Capture not already prefixed to label commands with Python in " + do_file_name)
        with open(do_file_path, 'w', encoding='iso-8859-1') as edited_do_file:
            print("Prefixing capture to all label commands")
            do_file_text = do_file_text.replace("\n" + "label", "\n" + "capture label")
            print("Marking " + do_file_name + " as edited")
            do_file_text = "* capture prefixed to label commands with python" + "\n" + do_file_text
            print("Saving " + do_file_name)
            edited_do_file.write(do_file_text)
