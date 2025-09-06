#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=catcar@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=demultiplex_part1            #optional: job name
#SBATCH --output=demultiplex_part1_%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=demultiplex_part1_%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=5:00:00                          #adding time!

mamba activate QAA

/usr/bin/time -v ./demultiplex_part1_script.py -f "/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630300_1/SRR25630300_1.fastq.gz" -l 150 -o SRR25630300_1

/usr/bin/time -v ./demultiplex_part1_script.py -f "/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630300_2/SRR25630300_2.fastq.gz" -l 150 -o SRR25630300_2

/usr/bin/time -v ./demultiplex_part1_script.py -f "/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630378_1/SRR25630378_1.fastq.gz" -l 150 -o SRR25630378_1

/usr/bin/time -v ./demultiplex_part1_script.py -f "/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630378_2/SRR25630378_2.fastq.gz" -l 150 -o SRR25630378_2

