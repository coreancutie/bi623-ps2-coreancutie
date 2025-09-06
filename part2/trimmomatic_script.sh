#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=catcar@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=trimmomatic            #optional: job name
#SBATCH --output=trimmomatic%j.out       #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=trimmomatic%j.err        #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=5:00:00                   #adding time!

mamba activate QAA

/usr/bin/time -v trimmomatic PE \
/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630300_1_out.fastq \
/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630300_2_out.fastq \
SRR25630300_1_paired.fastq.gz \
SRR25630300_1_unpaired.fastq.gz \
SRR25630300_2_paired.fastq.gz \
SRR25630300_2_unpaired.fastq.gz \
HEADCROP:8 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:15 \
MINLEN:35

/usr/bin/time -v trimmomatic PE \
/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630378_1_out.fastq \
/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/SRR25630378_2_out.fastq \
SRR25630378_1_paired.fastq.gz \
SRR25630378_1_unpaired.fastq.gz \
SRR25630378_2_paired.fastq.gz \
SRR25630378_2_unpaired.fastq.gz \
HEADCROP:8 \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:15 \
MINLEN:35

