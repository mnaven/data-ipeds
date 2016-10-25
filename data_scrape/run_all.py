#!/usr/bin/env python

"""Runs all of the Python scripts necessary to create dta files from the raw IPEDS csv files"""

import os

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
data_scrape_directory = os.path.join(ipeds_directory, "data_scrape")

# Delete Extras
os.chdir(data_scrape_directory)
exec(compile(open('delete_extras.py', 'rb').read(), 'delete_extras.py', 'exec'))

# Dictionary Sort
os.chdir(data_scrape_directory)
exec(compile(open('dictionary_sort.py', 'rb').read(), 'dictionary_sort.py', 'exec'))

# Do File Sort
os.chdir(data_scrape_directory)
exec(compile(open('do_file_sort.py', 'rb').read(), 'do_file_sort.py', 'exec'))

# Raw Data Sort
os.chdir(data_scrape_directory)
exec(compile(open('raw_data_sort.py', 'rb').read(), 'raw_data_sort.py', 'exec'))

# Change Insheet Directory
os.chdir(data_scrape_directory)
exec(compile(open('change_insheet_directory_zip.py', 'rb').read(), 'change_insheet_directory_zip.py', 'exec'))

# Replace Insheet Data Path
os.chdir(data_scrape_directory)
exec(compile(open('replace_insheet_data_path_zip.py', 'rb').read(), 'replace_insheet_data_path_zip.py', 'exec'))

# Capture Label
os.chdir(data_scrape_directory)
exec(compile(open('capture_label_zip.py', 'rb').read(), 'capture_label_zip.py', 'exec'))

# Unzip Files
os.chdir(data_scrape_directory)
exec(compile(open('unzip_files.py', 'rb').read(), 'unzip_files.py', 'exec'))

# Create DTA
os.chdir(data_scrape_directory)
exec(compile(open('create_dta.py', 'rb').read(), 'create_dta.py', 'exec'))

# Insheet Error Files
os.chdir(data_scrape_directory)
exec(compile(open('insheet_error_files.py', 'rb').read(), 'insheet_error_files.py', 'exec'))

# Delete Extracted Files
os.chdir(data_scrape_directory)
exec(compile(open('delete_extracted_files.py', 'rb').read(), 'delete_extracted_files.py', 'exec'))

# Delete Extras
os.chdir(data_scrape_directory)
exec(compile(open('delete_extras.py', 'rb').read(), 'delete_extras.py', 'exec'))
