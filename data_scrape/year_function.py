#!/usr/bin/env python

"""Creates a function that returns the fall academic year from a downloaded IPEDS file"""

import os
import re

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


def ipeds_year(file_path):
    # Latest year for which IPEDS has released data
    latest_data_year = 2015
    range_max = latest_data_year + 1

    # List of all the years for which IPEDS has released data
    all_ipeds_years = ["1980"]
    for year in range(1984, range_max, 1):
        all_ipeds_years.append(str(year))

    year = None

    # Search for four and two digit strings, return true if found
    file_name = os.path.basename(file_path)
    four_digit_search = re.search("([^0-9]+)([0-9]{4})", file_name)
    two_digit_search = re.search("([^0-9]+)([0-9]{2})([^0-9]+)", file_name)

    # If a four digit numerical string is found
    if four_digit_search:
        four_digits = four_digit_search.group(2)

        if four_digits in all_ipeds_years:
            year = four_digits

        # Accounts for four digits that denote two consecutive years
        elif int(four_digits[0:2]) == int(four_digits[-2:]) - 1 or (four_digits[0:2] == "99" and four_digits[-2:]) == "00":
            two_digit_year = four_digits[0:2]
            for four_digit_year in all_ipeds_years:
                if two_digit_year == four_digit_year[-2:]:
                    year = four_digit_year
                    break

    # If a two digit numerical string is found
    elif two_digit_search:
        two_digits = two_digit_search.group(2)
        for four_digit_year in all_ipeds_years:
                if two_digits == four_digit_year[-2:]:
                    year = four_digit_year
                    break

    # List of files that must be manually sorted
    elif file_name.startswith("Pub_studentCount"):
        year = "1999"
    elif file_name.startswith("Pub_FinancialAid"):
        year = "1999"

    return year
