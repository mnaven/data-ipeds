import os
import re

__author__ = 'Naven'


def replace_ipeds_insheet_file_path(file_path):
    file_name = os.path.basename(file_path)
    path_replaced = None
    file_text = None
    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        if file_text.find("* path replaced in python") != -1:
            path_replaced = True
        else:
            path_replaced = False
    if path_replaced is True:
        print("Insheet file path already replaced")
    elif path_replaced is False:
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Deleting file path in " + file_name)
            file_text = re.sub(r'insheet using .*\\', 'insheet using "', file_text)
            print("Marking " + file_name + " as edited")
            file_text = "* path replaced in python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
