import os
import zipfile
import re

__author__ = 'Naven'


def fix_ipeds_zipped_do_file(zipped_file_path):
    year_folder_path = os.path.dirname(zipped_file_path)
    zipped_file_name = os.path.basename(zipped_file_path)
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        unzipped_file_path = os.path.join(year_folder_path, unzipped_file_name)
        print("Unzipping " + zipped_file_name)
        zipped_file.extractall(year_folder_path)
        unzipped_file_text = None
        with open(unzipped_file_path, 'r', encoding='iso-8859-1') as original_unzipped_file:
            unzipped_file_text = original_unzipped_file.read()
            print("Deleting file path in " + unzipped_file_name)
            unzipped_file_text = re.sub(r'insheet using .*\\', 'insheet using "', unzipped_file_text)
            print("Adding capture to all label commands")
            unzipped_file_text = unzipped_file_text.replace("\n" + "label", "\n" + "capture label")
        with open(unzipped_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_file:
            print("Adding cd " + year_folder_path + "to " + unzipped_file_name + " and saving")
            edited_unzipped_file.write('cd "' + year_folder_path + '"' + '\n' + unzipped_file_text)
    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
        print("Zipping " + unzipped_file_name)
        zipped_file.write(unzipped_file_path, unzipped_file_name)
    print("Deleting " + unzipped_file_name)
    os.remove(unzipped_file_path)
