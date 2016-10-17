import zipfile
import re
import os

__author__ = 'Naven'


def replace_ipeds_zipped_insheet_file_path(zipped_file_path):
    year_folder_path = os.path.dirname(zipped_file_path)
    zipped_file_name = os.path.basename(zipped_file_path)
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        unzipped_file_path = os.path.join(year_folder_path, unzipped_file_name)
        print("Unzipping " + zipped_file_name)
        zipped_file.extractall(year_folder_path)
        path_replaced = None
        unzipped_file_text = None
        with open(unzipped_file_path, 'r', encoding='iso-8859-1') as original_unzipped_file:
            unzipped_file_text = original_unzipped_file.read()
            if unzipped_file_text.find("* insheet file path replaced in python") != -1:
                path_replaced = True
            else:
                path_replaced = False
        if path_replaced is True:
            print("Insheet file path already replaced in python")
        elif path_replaced is False:
            with open(unzipped_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_file:
                print("Deleting original insheet file path in " + unzipped_file_name)
                unzipped_file_text = re.sub(r'insheet using .*\\', 'insheet using "', unzipped_file_text)
                print("Marking " + unzipped_file_name + " as edited")
                unzipped_file_text = "* insheet file path replaced in python" + "\n" + unzipped_file_text
                print("Saving " + unzipped_file_name)
                edited_unzipped_file.write(unzipped_file_text)
    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
        print("Zipping " + unzipped_file_name)
        zipped_file.write(unzipped_file_path, unzipped_file_name)
    print("Deleting " + unzipped_file_name)
    os.remove(unzipped_file_path)
