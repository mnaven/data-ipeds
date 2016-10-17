from year_function import ipeds_year
import os

__author__ = 'Naven'


def ipeds_year_sort(file_path):
    unsorted_years_folder_path = os.path.dirname(file_path)
    raw_data_directory = os.path.join(unsorted_years_folder_path, os.path.pardir)
    file_name = os.path.basename(file_path)
    year = ipeds_year(file_name)
    if year is None:
        print("No data year found for " + file_name)
    else:
        print("The data year for " + file_name + " is " + year)
        year_folder_path = os.path.join(raw_data_directory, year)
        if not os.path.exists(year_folder_path):
            print("Creating folder " + year_folder_path)
            os.makedirs(year_folder_path)
        destination_file_path = os.path.join(year_folder_path, file_name)
        print("Renaming " + file_path + " as " + destination_file_path)
        os.rename(file_path, destination_file_path)
