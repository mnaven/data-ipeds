#!/usr/bin/env python

"""Creates a dta file from an unzipped IPEDS csv file"""

import os
import sys
import glob
import re
from create_dta_function import ipeds_create_dta

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = "/Users/Naven/Documents/Research/data/ipeds"
do_files_directory = os.path.join(ipeds_directory, "do_files")

operating_system = None
os_platform = sys.platform

if os_platform == "darwin":
    operating_system = "Mac"
    stata_directory = os.path.join(os.sep, "Applications", "Stata")

    if os.path.exists(os.path.join(stata_directory, "StataMP.app")):
        stata_flavor = "MP"
        stata_console_executable_path = os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "stata-mp")
        stata_gui_executable_path = os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "StataMP")

    elif os.path.exists(os.path.join(stata_directory, "StataSE.app")):
        stata_flavor = "SE"
        stata_console_executable_path = os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "stata-se")
        stata_gui_executable_path = os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "StataSE")

    elif os.path.exists(os.path.join(stata_directory, "Stata.app")):
        stata_flavor = "IC"
        stata_gui_executable_path = os.path.join(stata_directory, "Stata.app", "Contents", "MacOS", "Stata")

    elif os.path.exists(os.path.join(stata_directory, "smStata.app")):
        stata_flavor = "Small"
        stata_gui_executable_path = os.path.join(stata_directory, "smStata.app", "Contents", "MacOS", "smStata")

    else:
        stata_not_installed = True


elif os_platform == "win32" or os_platform == "cygwin":
    operating_system = "Windows"

    if glob.glob(os.path.join("C:", os.sep, "Program Files", "Stata*")):
        stata_directory_list = glob.glob(os.path.join("C:", os.sep, "Program Files", "Stata*"))
        stata_versions = list()
        for stata_version_directory in stata_directory_list:
            stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
            stata_version = stata_version_search.group(1)
            stata_versions.append(stata_version)
        latest_stata_version = max(stata_versions)
        stata_directory = os.path.join("C:", os.sep, "Program Files", "Stata" + latest_stata_version)

        if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
            stata_flavor = "MP"
            stata_gui_executable_path = os.path.join(stata_directory, "StataMP.exe")

        elif os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
            stata_flavor = "SE"
            stata_gui_executable_path = os.path.join(stata_directory, "StataSE.exe")

        elif os.path.exists(os.path.join(stata_directory, "Stata.exe")):
            stata_flavor = "IC"
            stata_gui_executable_path = os.path.join(stata_directory, "Stata.exe")

        elif os.path.exists(os.path.join(stata_directory, "smStata.exe")):
            stata_flavor = "Small"
            stata_gui_executable_path = os.path.join(stata_directory, "smStata.exe")

    elif glob.glob(os.path.join("C:", os.sep, "Program Files (x86)", "Stata*")):
        stata_directory_list = glob.glob(os.path.join("C:", os.sep, "Program Files (x86)", "Stata*"))
        stata_versions = list()
        for stata_version_directory in stata_directory_list:
            stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
            stata_version = stata_version_search.group(1)
            stata_versions.append(stata_version)
        latest_stata_version = max(stata_versions)
        stata_directory = os.path.join("C:", os.sep, "Program Files (x86)",  "Stata" + latest_stata_version)

        if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
            stata_flavor = "MP"
            stata_gui_executable_path = os.path.join(stata_directory, "StataMP.exe")

        elif os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
            stata_flavor = "SE"
            stata_gui_executable_path = os.path.join(stata_directory, "StataSE.exe")

        elif os.path.exists(os.path.join(stata_directory, "Stata.exe")):
            stata_flavor = "IC"
            stata_gui_executable_path = os.path.join(stata_directory, "Stata.exe")

        elif os.path.exists(os.path.join(stata_directory, "smStata.exe")):
            stata_flavor = "Small"
            stata_gui_executable_path = os.path.join(stata_directory, "smStata.exe")

    else:
        stata_not_installed = True


elif os_platform.startswith("linux"):
    operating_system = "Linux"
    stata_directory_list = glob.glob(os.path.join(os.sep, "usr", "local", "stata*"))
    stata_versions = list()
    for stata_version_directory in stata_directory_list:
        stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
        stata_version = stata_version_search.group(1)
        stata_versions.append(stata_version)
    latest_stata_version = max(stata_versions)
    stata_directory = os.path.join(os.sep, "usr", "local", "stata" + latest_stata_version)

    if os.path.exists(os.path.join(stata_directory, "stata-mp")):
        stata_flavor = "MP"
        stata_console_executable_path = os.path.join(stata_directory, "stata-mp")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata-mp")

    elif os.path.exists(os.path.join(stata_directory, "stata-se")):
        stata_flavor = "SE"
        stata_console_executable_path = os.path.join(stata_directory, "stata-se")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata-se")

    elif os.path.exists(os.path.join(stata_directory, "stata")):
        stata_flavor = "IC"
        stata_console_executable_path = os.path.join(stata_directory, "stata")
        stata_gui_executable_path = os.path.join(stata_directory, "xstata")

    else:
        stata_not_installed = True


if operating_system == "Mac" or operating_system=="Windows" or operating_system == "Linux":
    # Go through all the files and folders contained in the directory, now including the unzipped files
    for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
        for file_name in file_names_list:
            print("Checking if " + file_name + " is a do file")
            if file_name.endswith(".do"):
                print(file_name + " is a do file")
                print("Creating a dta file with Stata using the do file " + file_name)
                do_file_path = os.path.join(directory_path, file_name)
                if stata_console_executable_path is not None:
                    ipeds_create_dta(do_file_path, stata_console_executable_path)
                else:
                    ipeds_create_dta(do_file_path, stata_gui_executable_path)

else:
    print("Unknown operating system. Please manually change the stata_gui_executable_path variable in the create_dta.py file to the Stata executable file path enclosed in double quotes")

    stata_console_executable_path = ""  # PASTE THE STATA (CONSOLE) EXECUTABLE FILE PATH BETWEEN THE DOUBLE QUOTES IF USING AN UNKNOWN OPERATING SYSTEM
    stata_gui_executable_path = ""  # PASTE THE STATA (GUI) EXECUTABLE FILE PATH BETWEEN THE DOUBLE QUOTES IF USING AN UNKNOWN OPERATING SYSTEM

    # Go through all the files and folders contained in the directory, now including the unzipped files
    for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
        for file_name in file_names_list:
            print("Checking if " + file_name + " is a do file")
            if file_name.endswith(".do"):
                print(file_name + " is a do file")
                print("Creating a dta file with Stata using the do file " + file_name)
                do_file_path = os.path.join(directory_path, file_name)
                if stata_console_executable_path is not None:
                    ipeds_create_dta(do_file_path, stata_console_executable_path)
                else:
                    ipeds_create_dta(do_file_path, stata_gui_executable_path)
