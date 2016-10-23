#!/usr/bin/env python

"""Creates a function that deletes duplicate, SPSS, and SAS files downloaded from IPEDS"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_delete_extras(file_path):
    file_name = os.path.basename(file_path)

    if re.search(r"\([0-9]+?\)", file_name) is not None:
        print(file_name + " is a duplicate")
        print("Deleting " + file_name)
        os.remove(file_path)

    elif os.path.splitext(file_name)[0].endswith("SPS"):
        print(file_name + " is a SPSS file")
        print("Deleting " + file_name)
        os.remove(file_path)

    elif os.path.splitext(file_name)[0].endswith("SAS"):
        print(file_name + " is a SAS file")
        print("Deleting " + file_name)
        os.remove(file_path)

    else:
        print(file_name + " is not a duplicate, SPSS, or SAS file")
