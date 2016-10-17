from year_function import ipeds_year
import os
from year_sort_function import ipeds_year_sort

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
unsorted_years_folder_path = os.path.join(directory, "unsorted_years")
no_year = list()
for file_name in os.listdir(unsorted_years_folder_path):
    source_file_path = os.path.join(unsorted_years_folder_path, file_name)
    year = ipeds_year(file_name)
    if year is None:
        print("No data year found for " + file_name)
        no_year.append(file_name)
    else:
        ipeds_year_sort(source_file_path)
print("The following files could not be sorted into a data year folder", no_year)
