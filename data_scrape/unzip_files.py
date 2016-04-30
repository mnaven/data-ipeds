import os
import zipfile

__author__ = 'Naven'


directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
# Go through all the files and folders contained in the directory
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        file_path = os.path.join(directory_path, file_name)
        # Make sure the file is a zip file before unzipping
        print("Checking if " + file_name + " ends in .zip")
        if file_name.endswith(".zip"):
            # Unzip the zipped file
            with zipfile.ZipFile(file_path, 'r') as zipped_file:
                print("Unzipping " + file_name + " to " + directory_path)
                zipped_file.extractall(directory_path)
