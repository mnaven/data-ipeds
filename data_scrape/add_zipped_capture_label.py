import os
from zip_contains_do_file_function import zip_contains_do_file
from add_zipped_capture_label_function import add_ipeds_zipped_capture_label

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .zip")
        if file_name.endswith(".zip"):
            print(file_name + " ends in .zip")
            print("Checking if " + file_name + " contains a do file")
            file_path = os.path.join(directory_path, file_name)
            if zip_contains_do_file(file_path):
                print(file_name + " contains a do file")
                print("Adding capture to all the label commands in " + file_name)
                add_ipeds_zipped_capture_label(file_path)
