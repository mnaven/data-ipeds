import os
import re

__author__ = 'Naven'


def ipeds_log_contains_error(file_path):
    file_name = os.path.basename(file_path)
    with open(file_path, 'r', encoding='iso-8859-1') as log_file:
        log_file_text = log_file.read()
        error_code_search = re.search("r\([0-9]{1,4}\);", log_file_text)
        if error_code_search:
            if error_code_search.group() == "r(602);":
                print(file_name + " has already created a .dta file")
                return False
            else:
                print("There is an error in log file " + file_name)
                return True
        else:
            print("No errors in log file " + file_name)
            return False
