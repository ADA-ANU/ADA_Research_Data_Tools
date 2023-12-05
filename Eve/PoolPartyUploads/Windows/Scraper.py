import csv
import pandas as pd
import sys
import os

input_file = sys.argv[1]

def create_directory(directory_path):
    if not os.path.exists(directory_path):
        try:
            os.makedirs(directory_path)
            print(f"Directory '{directory_path}' created successfully.")
        except OSError as e:
            print(f"Error creating directory '{directory_path}': {e}")
    else:
        print(f"Directory '{directory_path}' already exists.")

def read_in(input_file):
    df = pd.read_csv(input_file,encoding='utf-8',sep=' ')
    return df['Name'],df['Label'],df['Codes']

# Function to split the last column by "|"
def split_cell(cell):
    split_values = cell.split('|')
    return split_values

def write_ind_csv(Names,Labels,Codess):
    #    create_directory("poolparty_files")
    with open(f"output.csv", mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["scheme","concept"])
        for i in range(len(Names)):
            Name,Label,Codes = Names[i],Labels[i],Codess[i]
            Codes = split_cell(Codes)
            writer.writerow([Label," "])
            for code in Codes:
                writer.writerow([" ",code])

def write_all(input_file):
    Names,Labels,Codess = read_in(input_file)
    write_ind_csv(Names,Labels,Codess)

def main():
    write_all(input_file)

main()
