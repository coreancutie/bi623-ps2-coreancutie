# **September 2, 2025**

## Making Conda Enviroment

    conda create --QAA

This popped up.... I just hit yes and continued 
    
    WARNING: A conda environment already exists at '/gpfs/home/catcar/miniforge3/envs/QAA'

    Remove existing environment?
    This will remove ALL directories contained within this specified prefix directory, including any other conda environments.

     (y/[n])? y 

## Installing Packages

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

