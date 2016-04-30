import os
from zip_contains_do_file_function import zip_contains_do_file
from replace_zipped_insheet_file_path_function import replace_ipeds_zipped_insheet_file_path

__author__ = 'Naven'


directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .zip")
        if file_name.endswith(".zip"):
            file_path = os.path.join(directory_path, file_name)
            if zip_contains_do_file(file_path):
                replace_ipeds_zipped_insheet_file_path(file_path)
