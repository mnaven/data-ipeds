import os

__author__ = 'Naven'


directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
# Go through all the files and folders contained in the directory, now including the created dta files
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        file_path = os.path.join(directory_path, file_name)
        # Check to see if the file came from a zipped file
        print("Checking if " + file_name + " ends in .do, .csv, or .html")
        if file_name.endswith(".do") or file_name.endswith(".csv") or file_name.endswith(".html"):
            # Delete files that were unzipped because the dta file has now been created
            print("Deleting " + file_name)
            os.remove(file_path)
