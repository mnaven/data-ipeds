import os
import re

__author__ = 'Naven'


directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .zip")
        if file_name.endswith(".zip"):
            print("Checking if " + file_name + " is a duplicate, SPSS, or SAS file")
            if re.search(r"\([0-9]\)", file_name) is not None or file_name.endswith("SPS.zip") or file_name.endswith("SAS.zip"):
                file_path = os.path.join(directory_path, file_name)
                print("Deleting " + file_name)
                os.remove(file_path)
