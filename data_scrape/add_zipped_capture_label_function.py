import os
import zipfile

__author__ = 'Naven'


def add_ipeds_zipped_capture_label(zipped_file_path):
    year_folder_path = os.path.dirname(zipped_file_path)
    zipped_file_name = os.path.basename(zipped_file_path)
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        unzipped_file_path = os.path.join(year_folder_path, unzipped_file_name)
        print("Unzipping " + zipped_file_name)
        zipped_file.extractall(year_folder_path)
        capture_added = None
        unzipped_file_text = None
        with open(unzipped_file_path, 'r', encoding='iso-8859-1') as original_unzipped_file:
            unzipped_file_text = original_unzipped_file.read()
            if unzipped_file_text.find("* capture added in python") != -1:
                capture_added = True
            else:
                capture_added = False
        if capture_added is True:
            print("Capture already added")
        elif capture_added is False:
            with open(unzipped_file_path, 'w', encoding='iso-8859-1') as edited_unzipped_file:
                print("Adding capture to all label commands")
                unzipped_file_text = unzipped_file_text.replace("\n" + "label", "\n" + "capture label")
                print("Marking " + unzipped_file_name + " as edited")
                unzipped_file_text = "* capture added in python" + "\n" + unzipped_file_text
                print("Saving " + unzipped_file_name)
                edited_unzipped_file.write(unzipped_file_text)
    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
        print("Zipping " + unzipped_file_name)
        zipped_file.write(unzipped_file_path, unzipped_file_name)
    print("Deleting " + unzipped_file_name)
    os.remove(unzipped_file_path)
