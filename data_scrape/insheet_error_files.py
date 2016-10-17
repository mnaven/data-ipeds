import os
from log_contains_error_function import ipeds_log_contains_error

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
error_files = list()
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .log")
        if file_name.endswith(".log"):
            print(file_name + " ends in .log")
            print("Checking for errors in log file " + file_name)
            file_path = os.path.join(directory_path, file_name)
            if ipeds_log_contains_error(file_path):
                print("There is an error in log file " + file_name)
                error_files.append(file_name)
print("The following files encountered an error and could not be insheeted", error_files)
for file_name in error_files:
    print("Error running " + file_name)
