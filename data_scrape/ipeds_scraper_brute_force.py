import requests
import re
import zipfile
import os

directory = "/Users/Naven/Google Drive/data/ipeds/raw_data"

all_years = ["1980"]
for year in range(1984, 2015, 1):
    all_years.append(str(year))

for year in all_years:
    print("Year " + year)
    two_digit_year = year[-2:]
    school_year = str(int(two_digit_year) - 1) + two_digit_year

    hd_data_url = "https://nces.ed.gov/ipeds/datacenter/data/HD" + year + "_Data_Stata.zip"
    hd_import_url = "https://nces.ed.gov/ipeds/datacenter/data/HD" + year + "_Stata.zip"
    hd_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/HD" + year + "_Dict.zip"

    ic_data_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_Data_Stata.zip"
    ic_import_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_Stata.zip"
    ic_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_Dict.zip"

    ic_ay_data_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_AY_Data_Stata.zip"
    ic_ay_import_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_AY_Stata.zip"
    ic_ay_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_AY_Dict.zip"

    ic_py_data_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_PY_Data_Stata.zip"
    ic_py_import_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_PY_Stata.zip"
    ic_py_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/IC" + year + "_PY_Dict.zip"

    flags_data_url = "https://nces.ed.gov/ipeds/datacenter/data/FLAGS" + year + "_Data_Stata.zip"
    flags_import_url = "https://nces.ed.gov/ipeds/datacenter/data/FLAGS" + year + "_Stata.zip"
    flags_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/FLAGS" + year + "_Dict.zip"

    effy_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EFFY" + year + "_Data_Stata.zip"
    effy_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EFFY" + year + "_Stata.zip"
    effy_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EFFY" + year + "_Dict.zip"

    efia_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EFIA" + year + "_Data_Stata.zip"
    efia_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EFIA" + year + "_Stata.zip"
    efia_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EFIA" + year + "_Dict.zip"

    ef_a_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_A_Data_Stata.zip"
    ef_a_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_A_Stata.zip"
    ef_a_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_A_Dict.zip"

    ef_c_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "C_Data_Stata.zip"
    ef_c_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "C_Stata.zip"
    ef_c_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "C_Dict.zip"

    ef_d_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "D_Data_Stata.zip"
    ef_d_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "D_Stata.zip"
    ef_d_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "D_Dict.zip"

    ef_a_dist_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "A_DIST_Data_Stata.zip"
    ef_a_dist_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "A_DIST_Stata.zip"
    ef_a_dist_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "A_DIST_Dict.zip"

    ef_b_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "B_Data_Stata.zip"
    ef_b_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "B_Stata.zip"
    ef_b_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "B_Dict.zip"

    c_a_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_A_Data_Stata.zip"
    c_a_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_A_Stata.zip"
    c_a_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_A_Dict.zip"

    c_b_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_B_Data_Stata.zip"
    c_b_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_B_Stata.zip"
    c_b_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_B_Dict.zip"

    c_c_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_C_Data_Stata.zip"
    c_c_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_C_Stata.zip"
    c_c_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_C_Dict.zip"

    c_dep_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "DEP_Data_Stata.zip"
    c_dep_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "DEP_Stata.zip"
    c_dep_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "DEP_Dict.zip"

    sal_is_data_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_IS_Data_Stata.zip"
    sal_is_import_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_IS_Stata.zip"
    sal_is_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_IS_Dict.zip"

    sal_nis_data_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_NIS_Data_Stata.zip"
    sal_nis_import_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_NIS_Stata.zip"
    sal_nis_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_NIS_Dict.zip"

    s_oc_data_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_OC_Data_Stata.zip"
    s_oc_import_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_OC_Stata.zip"
    s_oc_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_OC_Dict.zip"

    s_sis_data_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_SIS_Data_Stata.zip"
    s_sis_import_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_SIS_Stata.zip"
    s_sis_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_SIS_Dict.zip"

    s_is_data_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_IS_Data_Stata.zip"
    s_is_import_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_IS_Stata.zip"
    s_is_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_IS_Dict.zip"

    s_nh_data_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_NH_Data_Stata.zip"
    s_nh_import_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_NH_Stata.zip"
    s_nh_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/S" + year + "_NH_Dict.zip"

    eap_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EAP" + year + "_Data_Stata.zip"
    eap_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EAP" + year + "_Stata.zip"
    eap_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EAP" + year + "_Dict.zip"

    f_f1a_data_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F1A_Data_Stata.zip"
    f_f1a_import_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F1A_Stata.zip"
    f_f1a_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F1A_Dict.zip"

    f_f2_data_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F2_Data_Stata.zip"
    f_f2_import_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F2_Stata.zip"
    f_f2_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F2_Dict.zip"

    f_f3_data_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F3_Data_Stata.zip"
    f_f3_import_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F3_Stata.zip"
    f_f3_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + school_year + "_F3_Dict.zip"

    sfa_data_url = "https://nces.ed.gov/ipeds/datacenter/data/SFA" + school_year + "_Data_Stata.zip"
    sfa_import_url = "https://nces.ed.gov/ipeds/datacenter/data/SFA" + school_year + "_Stata.zip"
    sfa_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/SFA" + school_year + "_Dict.zip"

    gr_data_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_Data_Stata.zip"
    gr_import_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_Stata.zip"
    gr_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_Dict.zip"

    gr_l2_data_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_l2_Data_Stata.zip"
    gr_l2_import_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_l2_Stata.zip"
    gr_l2_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/GR" + year + "_l2_Dict.zip"

    gr200_data_url = "https://nces.ed.gov/ipeds/datacenter/data/GR200_" + two_digit_year + "_Data_Stata.zip"
    gr200_import_url = "https://nces.ed.gov/ipeds/datacenter/data/GR200_" + two_digit_year + "_Stata.zip"
    gr200_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/GR200_" + two_digit_year + "_Dict.zip"

    ef_acp_data_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_ACP_Data_Stata.zip"
    ef_acp_import_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_ACP_Stata.zip"
    ef_acp_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/EF" + year + "_ACP_Dict.zip"

    c_subba_cip_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_CIP_Data_Stata.zip"
    c_subba_cip_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_CIP_Stata.zip"
    c_subba_cip_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_CIP_Dict.zip"

    c_subba_2dig_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_2DIG_Data_Stata.zip"
    c_subba_2dig_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_2DIG_Stata.zip"
    c_subba_2dig_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "SUBBA_2DIG_Dict.zip"

    c_4ormore_cip_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_CIP_Data_Stata.zip"
    c_4ormore_cip_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_CIP_Stata.zip"
    c_4ormore_cip_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_CIP_Dict.zip"

    c_4ormore_2dig_data_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_2DIG_Data_Stata.zip"
    c_4ormore_2dig_import_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_2DIG_Stata.zip"
    c_4ormore_2dig_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/C" + year + "_4ORMORE_2DIG_Dict.zip"

    sal_a_data_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_A_Data_Stata.zip"
    sal_a_import_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_A_Stata.zip"
    sal_a_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_A_Dict.zip"

    sal_b_data_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_B_Data_Stata.zip"
    sal_b_import_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_B_Stata.zip"
    sal_b_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/SAL" + year + "_B_Dict.zip"

    f_data_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + year + "_Data_Stata.zip"
    f_import_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + year + "_Stata.zip"
    f_dictionary_url = "https://nces.ed.gov/ipeds/datacenter/data/F" + year + "_Dict.zip"

    url_list = list()

    for var in dir():
        if var.endswith("url"):
            url = eval(var)
            print("Appending " + var)
            url_list.append(url)

    for url in url_list:
        zipped_file_name = re.sub('.*/', '', url)
        zipped_file_path = directory + year + "/" + zipped_file_name
        print("Requesting " + url)
        url_request = requests.get(url)
        if url_request.status_code == 404:
            print("404 Error")

        else:
            with open(zipped_file_path, "wb") as zipped_file:
                print("Saving " + zipped_file_name)
                zipped_file.write(url_request.content)

            with zipfile.ZipFile(zipped_file_path, 'r') as zipped_file:
                unzipped_file_name = zipped_file.namelist()[0]
                unzipped_file_path = directory + year + "/" + unzipped_file_name
                if unzipped_file_name.endswith('.do',):
                    print("Unzipping file " + zipped_file_name)
                    zipped_file.extractall(directory + year)
                    unzipped_file_text = None
                    with open(unzipped_file_path, 'r') as unzipped_file:
                        unzipped_file_text = unzipped_file.read()
                        print("Replacing file path in " + unzipped_file_name + " with " + directory + year + '/')
                        unzipped_file_text = re.sub(r'insheet using .*\\', 'insheet using ' + '"' + directory + year + '/', unzipped_file_text)
                    with open(unzipped_file_path, 'w') as unzipped_file:
                        print("Saving file " + unzipped_file_name)
                        unzipped_file.write(unzipped_file_text)
                    with zipfile.ZipFile(zipped_file_path, 'w', zipfile.ZIP_DEFLATED) as zipped_file:
                        print("Zipping file " + unzipped_file_name)
                        zipped_file.write(unzipped_file_path,unzipped_file_name)
                    print("Deleting " + unzipped_file_name)
                    os.remove(unzipped_file_path)
