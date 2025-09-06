#!/usr/bin/env python

#need this import to use argparse variables
import argparse

def get_args():
	'''this has 1 arguement: file'''
	parser = argparse.ArgumentParser(description="Getting")
	parser.add_argument("-f1", help="Input Filename R1", type=str, required=True)
	parser.add_argument("-f2", help="Input Filename R2", type=str, required=True)
	parser.add_argument("-o", help="Output Filename", type=str, required=True)
	return parser.parse_args()

#calling the function (so in the terminal it runs)
args=get_args()

#reassiging args.f1 as f1
f1:str = args.f1

#reassiging args.f2 as f2
f2:str = args.f2

#reassiging args.output filename as o
o:str = args.o

def make_distribution_dict(f) -> dict:
    '''takes in a file with sequence length distributions and returns a dictionary with those values'''
    
    #making a dictionary for x and y values for R2
    dictionary:dict = {}

    #opening the file 
    with open(f, "r") as file:
        #reading each line in the file
        for line in file:
            #stripping the newline and splitting by the space (tab?)
            line = line.strip('\n').split()
            #adding the sequence lengths as the key and 
            dictionary[int(line[1])] = int(line[0])
            
    return dictionary


#making a dictionary for x and y values for R1
R1_dic:dict = make_distribution_dict(f2)

#making a dictionary for x and y values for R2
R2_dic:dict = make_distribution_dict(f2)


#plotting the distibutions!
import matplotlib.pyplot as plt

#making figure size
plt.figure(figsize=(12, 5))

#extract lengths and frequency from the dictionary
R1_lengths = list(R1_dic.keys())
R1_frequency = list(R1_dic.values())

#extract lengths and frequency from the dictionary
R2_lengths = list(R2_dic.keys())
R2_frequency = list(R2_dic.values())

# Create the bar plot
plt.bar(R1_lengths, R1_frequency, label='Read 1', color='blue')
plt.bar(R2_lengths, R2_frequency, label='Read 2', color='red', alpha=0.5)

#shows the lables to the colors
plt.legend()

#adding lables
plt.xlabel("Length of Sequences")
plt.ylabel("Frequency of Length")
plt.title(f"Plot of Sequence length distribution from {o} FASTQ file")

#saving the figure
plt.savefig(f"{o}.png")