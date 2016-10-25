#!/usr/bin/env python

"""Creates a function that creates a dta file from an unzipped IPEDS csv file"""

import os
import sys
import glob
import re
import subprocess

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_create_dta(do_file_path, stata_executable_path=None):
    do_files_year_folder_path = os.path.dirname(do_file_path)
    log_files_year_folder_path = str.replace(do_files_year_folder_path, "do_files", "log_files")
    if not os.path.exists(log_files_year_folder_path):
        print("Creating folder " + log_files_year_folder_path)
        os.makedirs(log_files_year_folder_path)
    do_file_name = os.path.basename(do_file_path)

    os_platform = sys.platform

    if os_platform == "darwin":
        print("Operating System is Mac")
        operating_system = "Mac"

    elif os_platform == "win32" or os_platform == "cygwin":
        print("Operating System is Windows")
        operating_system = "Windows"

    elif os_platform.startswith("linux"):
        print("Operating System is Linux")
        operating_system = "Linux"

    else:
        print("Operating System not supported")
        operating_system = "unsupported"

    # If the Stata executable path is not specified, look in the default Stata installation location
    if stata_executable_path is None:
        stata_installed = False
        stata_console_executable_path = None
        stata_gui_executable_path = None
        do_command = None

        if operating_system == "Mac":
            stata_directory = os.path.join(os.sep, "Applications", "Stata")

            # Stata MP
            if os.path.exists(os.path.join(stata_directory, "StataMP.app")):
                print("StataMP located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "stata-mp")):
                    stata_console_executable_path = os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "stata-mp")
                if os.path.exists(os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "StataMP")):
                    stata_gui_executable_path = os.path.join(stata_directory, "StataMP.app", "Contents", "MacOS", "StataMP")

            # Stata SE
            elif os.path.exists(os.path.join(stata_directory, "StataSE.app")):
                print("StataSE located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "stata-se")):
                    stata_console_executable_path = os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "stata-se")
                if os.path.exists(os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "StataSE")):
                    stata_gui_executable_path = os.path.join(stata_directory, "StataSE.app", "Contents", "MacOS", "StataSE")

            # Stata IC
            elif os.path.exists(os.path.join(stata_directory, "Stata.app")):
                print("StataIC located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "Stata.app", "Contents", "MacOS", "Stata")):
                    stata_gui_executable_path = os.path.join(stata_directory, "Stata.app", "Contents", "MacOS", "Stata")
    
            # Small Stata
            elif os.path.exists(os.path.join(stata_directory, "smStata.app")):
                print("Small Stata located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "smStata.app", "Contents", "MacOS", "smStata")):
                    stata_gui_executable_path = os.path.join(stata_directory, "smStata.app", "Contents", "MacOS", "smStata")

            else:
                print("Stata not installed in default Mac location")

            if stata_console_executable_path is not None:
                stata_executable_path = stata_console_executable_path

            else:
                stata_executable_path = stata_gui_executable_path
    
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, "-e", "do", do_file_path]
    
            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, "-e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", quoted_do_file_path]

        # Windows
        elif operating_system == "Windows":
    
            if glob.glob(os.path.join("C:", os.sep, "Program Files", "Stata*")):
                stata_directory_list = glob.glob(os.path.join("C:", os.sep, "Program Files", "Stata*"))
                stata_versions = list()
                for stata_version_directory in stata_directory_list:
                    stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
                    stata_version = stata_version_search.group(1)
                    stata_versions.append(stata_version)
                latest_stata_version = max(stata_versions)
                stata_directory = os.path.join("C:", os.sep, "Program Files", "Stata" + latest_stata_version)

                # Stata MP
                if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
                    print("StataMP located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "StataMP.exe")

                # Stata SE
                elif os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
                    print("StataSE located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "StataSE.exe")

                # Stata IC
                elif os.path.exists(os.path.join(stata_directory, "Stata.exe")):
                    print("StataIC located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "Stata.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "Stata.exe")

                # Small Stata
                elif os.path.exists(os.path.join(stata_directory, "smStata.exe")):
                    print("Small Stata located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "smStata.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "smStata.exe")
    
            elif glob.glob(os.path.join("C:", os.sep, "Program Files (x86)", "Stata*")):
                stata_directory_list = glob.glob(os.path.join("C:", os.sep, "Program Files (x86)", "Stata*"))
                stata_versions = list()
                for stata_version_directory in stata_directory_list:
                    stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
                    stata_version = stata_version_search.group(1)
                    stata_versions.append(stata_version)
                latest_stata_version = max(stata_versions)
                stata_directory = os.path.join("C:", os.sep, "Program Files (x86)", "Stata" + latest_stata_version)
    
                # Stata MP
                if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
                    print("StataMP located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "StataMP.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "StataMP.exe")

                # Stata SE
                elif os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
                    print("StataSE located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "StataSE.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "StataSE.exe")

                # Stata IC
                elif os.path.exists(os.path.join(stata_directory, "Stata.exe")):
                    print("StataIC located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "Stata.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "Stata.exe")

                # Small Stata
                elif os.path.exists(os.path.join(stata_directory, "smStata.exe")):
                    print("Small Stata located")
                    stata_installed = True
                    if os.path.exists(os.path.join(stata_directory, "smStata.exe")):
                        stata_gui_executable_path = os.path.join(stata_directory, "smStata.exe")
    
            else:
                print("Stata not installed in default Windows location")

            stata_executable_path = stata_gui_executable_path
    
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, r"/e", "do", do_file_path]
    
            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, r"/e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, r"/e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, r"/e", "do", quoted_do_file_path]

        # Linux
        elif operating_system == "Linux":
            stata_directory_list = glob.glob(os.path.join(os.sep, "usr", "local", "stata*"))
            stata_versions = list()
            for stata_version_directory in stata_directory_list:
                stata_version_search = re.search("Stata([0-9]+)", stata_version_directory)
                stata_version = stata_version_search.group(1)
                stata_versions.append(stata_version)
            latest_stata_version = max(stata_versions)
            stata_directory = os.path.join(os.sep, "usr", "local", "stata" + latest_stata_version)

            # Stata MP
            if os.path.exists(os.path.join(stata_directory, "stata-mp")):
                print("StataMP located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "stata-mp")):
                    stata_console_executable_path = os.path.join(stata_directory, "stata-mp")
                if os.path.exists(os.path.join(stata_directory, "xstata-mp")):
                    stata_gui_executable_path = os.path.join(stata_directory, "xstata-mp")

            # Stata SE
            elif os.path.exists(os.path.join(stata_directory, "stata-se")):
                print("StataSE located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "stata-se")):
                    stata_console_executable_path = os.path.join(stata_directory, "stata-se")
                if os.path.exists(os.path.join(stata_directory, "xstata-se")):
                    stata_gui_executable_path = os.path.join(stata_directory, "xstata-se")

            # Stata IC
            elif os.path.exists(os.path.join(stata_directory, "stata")):
                print("StataIC located")
                stata_installed = True
                if os.path.exists(os.path.join(stata_directory, "stata")):
                    stata_console_executable_path = os.path.join(stata_directory, "stata")
                if os.path.exists(os.path.join(stata_directory, "xstata")):
                    stata_gui_executable_path = os.path.join(stata_directory, "xstata")
    
            else:
                print("Stata not installed in default Unix location")

            if stata_console_executable_path is not None:
                stata_executable_path = stata_console_executable_path
            else:
                stata_executable_path = stata_gui_executable_path
    
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, "-e", "do", do_file_path]

            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, "-e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", quoted_do_file_path]

    else:
        stata_installed = True
        do_command = None

        if operating_system == "Mac":
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, "-e", "do", do_file_path]

            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, "-e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", quoted_do_file_path]

        elif operating_system == "Windows":
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, r"/e", "do", do_file_path]

            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, r"/e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, r"/e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, r"/e", "do", quoted_do_file_path]

        elif operating_system == "Linux":
            if " " not in stata_executable_path and " " not in do_file_path:
                do_command = [stata_executable_path, "-e", "do", do_file_path]

            elif " " in do_file_path:
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [stata_executable_path, "-e", "do", quoted_do_file_path]

            elif " " in stata_executable_path:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", do_file_path]

            else:
                quoted_stata_executable_path = '"' + stata_executable_path + '"'
                quoted_do_file_path = '"' + do_file_path + '"'
                do_command = [quoted_stata_executable_path, "-e", "do", quoted_do_file_path]

    if stata_installed and do_command:
        print("Changing directory to " + log_files_year_folder_path)
        os.chdir(log_files_year_folder_path)
        print("Running " + do_file_name + " in Stata")
        subprocess.run(do_command)
