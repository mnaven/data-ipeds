import os

__author__ = 'Naven'


# Delete Extras
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('delete_extras.py', 'rb').read(), 'delete_extras.py', 'exec'))

# Year Sort
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('year_sort.py', 'rb').read(), 'year_sort.py', 'exec'))

# Add Zipped Insheet CD
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('add_zipped_insheet_cd.py', 'rb').read(), 'add_zipped_insheet_cd.py', 'exec'))

# Replace Zipped Insheet File Path
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('replace_zipped_insheet_file_path.py', 'rb').read(), 'replace_zipped_insheet_file_path.py', 'exec'))

# Add Zipped Capture Label
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('add_zipped_capture_label.py', 'rb').read(), 'add_zipped_capture_label.py', 'exec'))

# Unzip Files
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('unzip_files.py', 'rb').read(), 'unzip_files.py', 'exec'))

# Create DTA
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('create_dta.py', 'rb').read(), 'create_dta.py', 'exec'))

# Insheet Error Files
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('insheet_error_files.py', 'rb').read(), 'insheet_error_files.py', 'exec'))

# Delete Extracted Files
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('delete_extracted_files.py', 'rb').read(), 'delete_extracted_files.py', 'exec'))

# Delete Extras
os.chdir("/Users/Naven/Documents/Research/data/ipeds/data_scrape")
exec(compile(open('delete_extras.py', 'rb').read(), 'delete_extras.py', 'exec'))

