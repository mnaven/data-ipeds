import os
import zipfile

__author__ = 'Naven'


def add_ipeds_zipped_insheet_cd(zipped_file_path):
    year_folder_path = os.path.dirname(zipped_file_path)
    zipped_file_name = os.path.basename(zipped_file_path)
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        unzipped_file_path = os.path.join(year_folder_path, unzipped_file_name)
        print("Unzipping " + zipped_file_name)
        zipped_file.extractall(year_folder_path)
        cd_added = None
        unzipped_file_text = None
        with open(unzipped_file_path, 'r', encoding='iso-8859-1') as original_unzipped_file:
            unzipped_file_text = original_unzipped_file.read()
            if unzipped_file_text.find("* directory changed in python") != -1:
                cd_added = True
            else:
                cd_added = False
        if cd_added is True:
            print("Directory already changed in python")
        elif cd_added is False:
            with open(unzipped_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_file:
                print("Adding cd " + year_folder_path + " to " + unzipped_file_name)
                unzipped_file_text = 'cd "' + year_folder_path + '"' + '\n' + unzipped_file_text
                print("Marking " + unzipped_file_name + " as edited")
                unzipped_file_text = "* directory changed in python" + "\n" + unzipped_file_text
                print("Saving " + unzipped_file_name)
                edited_unzipped_file.write(unzipped_file_text)
    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
        print("Zipping " + unzipped_file_name)
        zipped_file.write(unzipped_file_path, unzipped_file_name)
    print("Deleting " + unzipped_file_name)
    os.remove(unzipped_file_path)
