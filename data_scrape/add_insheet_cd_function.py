import os

__author__ = 'Naven'


def add_ipeds_insheet_cd(file_path):
    year_folder_path = os.path.dirname(file_path)
    file_name = os.path.basename(file_path)
    cd_added = None
    file_text = None
    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        if file_text.find("* cd added in python") != -1:
            cd_added = True
        else:
            cd_added = False
    if cd_added is True:
        print("Directory already changed")
    elif cd_added is False:
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Adding cd " + year_folder_path + "to " + file_name)
            file_text = 'cd "' + year_folder_path + '"' + '\n' + file_text
            print("Marking " + file_name + " as edited")
            file_text = "* cd added in python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
