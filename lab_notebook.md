# **September 2, 2025**


## Getting files

Here is where I got the SRA of the RNA-seq data 

    cat /projects/bgmp/shared/Bi623/PS2/QAA_data_Assignments.txt

RNA-seq files is SRR25630300 and SRR25630378

    SRR25630300
    SRR25630378

I prefetched them (.sra file) data from NCBI SRA

    prefetch SRR25630300
    prefetch SRR25630378

I turned them into fastq files (dumping into FASTQ files)

    fasterq-dump SRR25630300
    fasterq-dump SRR25630378

I zipped the files (each command took almost an hour....)

    gzip SRR25630300_1.fastq SRR25630300_2.fastq  --> SRR25630300_1.fastq.gz SRR25630300_2.fastq.gz
    gzip SRR25630378_1.fastq SRR25630378_2.fastq  --> SRR25630378_1.fastq.gz SRR25630378_2.fastq.gz
 


## Making Conda Enviroment

    conda create --QAA

This popped up.... I just hit yes and continued 
    
    WARNING: A conda environment already exists at '/gpfs/home/catcar/miniforge3/envs/QAA'

    Remove existing environment?
    This will remove ALL directories contained within this specified prefix directory, including any other conda environments.

     (y/[n])? y 

## Installing Packages

## sra-tools

    mamba install sra-tools

### FastQC

    mamba install fastqc

    fastqc --version
    FastQC v0.12.1

### cutadapt

    mamba install cutadapt

    cutadapt --version
    5.1

### Trimmomatic

    mamba install trimmomatic

    trimmomatic -version
    0.40

