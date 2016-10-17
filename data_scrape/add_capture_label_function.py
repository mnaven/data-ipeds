import os

__author__ = 'Naven'


def add_ipeds_capture_label(file_path):
    file_name = os.path.basename(file_path)
    capture_added = None
    file_text = None
    with open(file_path, 'r', encoding='iso-8859-1') as original_file:
        file_text = original_file.read()
        if file_text.find("* capture label added in python") != -1:
            capture_added = True
        else:
            capture_added = False
    if capture_added is True:
        print("Capture label already added in python")
    elif capture_added is False:
        with open(file_path, 'w', encoding='iso-8859-1') as edited_file:
            print("Adding capture to all label commands")
            file_text = file_text.replace("\n" + "label", "\n" + "capture label")
            print("Marking " + file_name + " as edited")
            file_text = "* capture label added in python" + "\n" + file_text
            print("Saving " + file_name)
            edited_file.write(file_text)
