README for downloading raw data from IPEDS

1. Download all files using DownThemAll! into the unsorted_years folder

2. delete_extras.py
    - Deletes any files that are duplicates, SPSS, or SAS files.

3. dictionary_sort.py
    - Sorts all dictionary files to the codebook folder.

3. year_sort.py
    - Sorts all of the downloaded files from the unsorted years folder into years that correspond to the year of the data.
    - IC files from 1995-1997 must be manually resorted
    - Pub_studentCount and Pub_FinancialAid must be manually sorted to 1999

4. add_zipped_insheet_cd.py
    - Adds a line of code to each do file that changes the directory from the default IPEDS directory to the local IPEDS data directory.

5. replace_zipped_insheet_file_path.py
    - Changes the file path used for insheeting the IPEDS data to match the local IPEDS data file path.

6. add_zipped_capture_label.py
    - Prefixes capture to all of the label commands because some labels are incorrectly coded or contain illegal characters.

7. unzip_files.py
    - Unzips all of the downloaded files.

8. create_dta.py
    - Creates a dta file from the unzipped csv files.

9. insheet_error_files.py
    - Creates a list of do files that encountered an error when attempting to create a dta file from a csv file.

10. Manually fix and insheet the files that could not be done automatically
    - EFFY2011, EFFY2012, EFIA2013, HD2013, IC2013, FLAGS2013, HD2014 file doesn't have a save
    - EF2008CP has no variable names

11. delete_extracted_files.py
    - Delete do, csv, and html files after the dta files have been created.

12. delete_extras.py
    - Deletes any files that are duplicates, SPSS, or SAS files.
