#!/usr/bin/env python

#need this import to use argparse variables
import argparse
def get_args():
	'''this has 1 arguement: sam file'''
	parser = argparse.ArgumentParser(description="Getting")
	parser.add_argument("-f", help="SAM Filename", type=str, required=True)
	parser.add_argument("-o", help="output filename", type=str, required=True)
	return parser.parse_args()

#calling the function (so in the terminal it runs)
args=get_args()

#reassiging args.sam filename as f
f:str = args.f

#reassiging args.output filename as o
o:str = args.o

#initalizing mapped and unmappedcounter
mapped_count:int = 0
unmapped_count:int = 0

#opening the file :)
with open(f, "r") as fh:
	#looping through each line in the file
    for line in fh:
        #stripping and splitting the line!
        line = line.strip("\n").split("\t")
        #if the first column and first character is not @ (not a header line)
        if "@" != line[0][0]:
			#getting the flag which is the second column
            flag:str = line[1]
            #changing from string to int because & be like that
            flag_int:int = int(flag)
            #making sure this is false (it's NOT a secondarly alignment (it's the primary alignment))
            if((flag_int & 256) != 256):
                #this only takes numbers!!! checks if mapped is true
                if((flag_int & 4) != 4):
                    #it's mapped so increment the count
                    mapped_count += 1
                #it's unmapped!
                else:
                    #increment the count
                    unmapped_count += 1

#openeing a file for writing
with open(o, "w") as fw:
    #writing the mapped count and unmapped count to the file
    fw.write(f"The number of reads that are properly mapped to the reference genome are: {mapped_count}\n")
    fw.write(F"The number of reads that are not properly mapped to the reference genome are: {unmapped_count}")