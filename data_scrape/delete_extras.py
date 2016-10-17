import os
import re

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .zip")
        if file_name.endswith(".zip"):
            print(file_name + " is a zip file")
            print("Checking if " + file_name + " is a duplicate, SPSS, or SAS file")
            if re.search(r"\([0-9]+?\)", file_name) is not None:
                print(file_name + " is a duplicate")
                print("Deleting " + file_name)
                file_path = os.path.join(directory_path, file_name)
                os.remove(file_path)
            if os.path.splitext(file_name)[0].endswith("SPS"):
                print(file_name + " is a SPSS file")
                print("Deleting " + file_name)
                file_path = os.path.join(directory_path, file_name)
                os.remove(file_path)
            if os.path.splitext(file_name)[0].endswith("SAS"):
                print(file_name + " is a SAS file")
                print("Deleting " + file_name)
                file_path = os.path.join(directory_path, file_name)
                os.remove(file_path)
