import os
import re
from delete_extras_function import ipeds_delete_extras

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " is a duplicate, SPSS, or SAS file")
        file_path = os.path.join(directory_path, file_name)
        ipeds_delete_extras(file_path)
