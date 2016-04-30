import re
import os

__author__ = 'Naven'


def ipeds_year(file_path):
    all_years = ["1980"]
    for year in range(1984, 2015, 1):
        all_years.append(str(year))

    file_name = os.path.basename(file_path)
    year = None
    # Search for four digit string, return true if found
    four_digit_search = re.search("([^0-9]+)([0-9]{4})", file_name)
    two_digit_search = re.search("([^0-9]+)([0-9]{2})([^0-9]+)", file_name)
    if four_digit_search:  # If a four digit numerical string is found
        four_digits = four_digit_search.group(2)
        if four_digits in all_years:
            year = four_digits
        else:  # Accounts for four digits that denote two consecutive years
            two_digit_year = four_digits[-2:]
            for four_digit_year in all_years:
                if two_digit_year == four_digit_year[-2:]:
                    year = four_digit_year
                    break
    elif two_digit_search:  # If a two digit numerical string is found
        two_digits = two_digit_search.group(2)
        for four_digit_year in all_years:
                if two_digits == four_digit_year[-2:]:
                    year = four_digit_year
                    break
    return year
