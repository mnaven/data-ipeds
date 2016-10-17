import os
from create_dta_function import create_ipeds_dta

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
# Go through all the files and folders contained in the directory, now including the unzipped files
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        file_path = os.path.join(directory_path, file_name)
        # Make sure the file is a do file before running it in stata
        print("Checking if " + file_name + " ends in .do")
        if file_name.endswith(".do"):
            print(file_name + " ends in .do")
            print("Creating a dta file using the do file " + file_name)
            # Run the do file in stata in order to create a dta file from the csv file
            create_ipeds_dta(file_path)
