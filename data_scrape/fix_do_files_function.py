import os
import re

__author__ = 'Naven'


def fix_ipeds_do_file(file_path):
    year_folder_path = os.path.dirname(file_path)
    file_name = os.path.basename(file_path)
    file_text = None
    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        print("Deleting file path in " + file_name)
        file_text = re.sub(r'insheet using .*\\', 'insheet using "', file_text)
        print("Adding capture to all label commands")
        file_text = file_text.replace("\n" + "label", "\n" + "capture label")
    with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
        print("Adding cd " + year_folder_path + "to " + file_name + " and saving")
        edited_file.write('cd "' + year_folder_path + '"' + '\n' + file_text)