import os
import subprocess

__author__ = 'Naven'


def create_ipeds_dta(file_path):
    directory = os.path.dirname(file_path)
    file_name = os.path.basename(file_path)
    os.chdir(directory)
    quoted_file_path = '"' + file_path + '"'
    #do_command = ["/Applications/Stata/StataMP.app/Contents/MacOS/Stata-mp", "-e", "do", quoted_file_path]
    do_command = ["/Applications/Stata/StataMP.app/Contents/MacOS/Stata-mp", "-e", "do", file_name]
    print("Running " + file_name + " in Stata")
    subprocess.run(do_command)
