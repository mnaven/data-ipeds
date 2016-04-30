import zipfile

__author__ = 'Naven'


def zip_contains_do_file(zipped_file_path):
    with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
        unzipped_file_name = zipped_file.namelist()[0]
        return unzipped_file_name.endswith(".do")
