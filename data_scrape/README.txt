README for downloading raw data from IPEDS

1. Download all files using DownThemAll! into the IPEDS downloads folder

2. delete_extras.py
    - Deletes duplicate, SPSS, and SAS files downloaded from IPEDS.

3. dictionary_sort.py
    - Sorts all of the downloaded dictionary files to the codebooks folder.

4. do_file_sort.py
    - Sorts all of the downloaded do files to the do files folder.

5. raw_data_sort.py
    - Sorts all of the downloaded data files to the raw data folder.
    - IC files from 1995-1997 must be manually resorted
    - Pub_studentCount and Pub_FinancialAid must be manually sorted to 1999

6. change_insheet_directory_zip.py
    - Adds a line of code to the IPEDS insheet file changing the directory to the raw data folder.

7. replace_insheet_data_path_zip.py
    - Changes the insheet data file path to match the local data file path in an IPEDS insheet file.

8. capture_label_zipped.py
    - Prefixes capture to all of the label commands because some labels are incorrectly coded or contain illegal characters.

9. unzip_files.py
    - Unzips all of the downloaded IPEDS files.

10. create_dta.py
    - Creates a dta file from the unzipped csv files.

11. insheet_error_files.py
    - Creates a list of do files that encountered an error when attempting to create a dta file from a csv file.

11. Manually fix and insheet the files that could not be done automatically
    - EFFY2011, EFFY2012, EFIA2013, HD2013, IC2013, FLAGS2013, HD2014 file doesn't have a save
    - EF2008CP has no variable names

12. delete_extracted_files.py
    - Delete all IPEDS do, csv, and html files after the dta files have been created.

13. delete_extras.py
    - Deletes any files that are duplicates, SPSS, or SAS files.
