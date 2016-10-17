import os
from add_insheet_cd_function import add_ipeds_insheet_cd

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .do")
        if file_name.endswith(".do"):
            print(file_name + " ends in .do")
            print("Changing the directory in " + file_name)
            file_path = os.path.join(directory_path, file_name)
            add_ipeds_insheet_cd(file_path)
