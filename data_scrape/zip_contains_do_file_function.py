#!/usr/bin/env python

"""Creates a function that checks if a zip file contains a do file"""

import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def zip_contains_do_file(zipped_file_path):
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        return unzipped_file_name.endswith(".do")
