# **September 2, 2025**


## Getting files

2 RNA-seq files data from NCBI SRA, dumping into FASTQ files, and zipping those files.

    cat /projects/bgmp/shared/Bi623/PS2/QAA_data_Assignments.txt

    SRR25630300     Catie

    prefetch SRR25630300
    fasterq-dump SRR25630300

    SRR25630378     Catie
    
    prefetch SRR25630378
    fasterq-dump SRR25630378

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

