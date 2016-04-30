from year_function import ipeds_year
import os
from year_sort_function import sort_ipeds_year

__author__ = 'Naven'


directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"
unsorted_years_folder_path = os.path.join(directory, "unsorted_years")
no_year = list()
for file_name in os.listdir(unsorted_years_folder_path):
    source_file_path = os.path.join(unsorted_years_folder_path, file_name)
    year = ipeds_year(file_name)
    if year is None:
        print("No year found for " + file_name)
        no_year.append(file_name)
    else:
        sort_ipeds_year(source_file_path)
print("The following files could not be sorted into a year folder", no_year)
