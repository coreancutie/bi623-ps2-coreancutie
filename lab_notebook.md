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

Activating the enviroment
    mamba activate QAA

## Installing Packages

### sra-tools

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

# **September 3, 2025**

## Running fastqc

    /usr/bin/time -v fastqc SRR25630300_1.fastq.gz 
    Command being timed: "fastqc SRR25630300_1.fastq.gz"
        User time (seconds): 248.48
        System time (seconds): 12.22
        Percent of CPU this job got: 100%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 4:20.58
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 638780
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 75449
        Voluntary context switches: 34824
        Involuntary context switches: 211
        Swaps: 0
        File system inputs: 0
        File system outputs: 3760
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

    /usr/bin/time -v fastqc SRR25630300_2.fastq.gz 
    Command being timed: "fastqc SRR25630300_2.fastq.gz"
        User time (seconds): 253.84
        System time (seconds): 13.45
        Percent of CPU this job got: 99%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 4:27.31
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 638960
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 71190
        Voluntary context switches: 34362
        Involuntary context switches: 267
        Swaps: 0
        File system inputs: 0
        File system outputs: 3752
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

    /usr/bin/time -v fastqc SRR25630378_1.fastq.gz 
    Command being timed: "fastqc SRR25630378_1.fastq.gz"
        User time (seconds): 32.04
        System time (seconds): 1.73
        Percent of CPU this job got: 101%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:33.18
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 634000
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 52753
        Voluntary context switches: 15824
        Involuntary context switches: 53
        Swaps: 0
        File system inputs: 0
        File system outputs: 2424
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

    /usr/bin/time -v fastqc SRR25630378_2.fastq.gz 
    Command being timed: "fastqc SRR25630378_2.fastq.gz"
        User time (seconds): 31.40
        System time (seconds): 1.70
        Percent of CPU this job got: 105%
        Elapsed (wall clock) time (h:mm:ss or m:ss): 0:31.24
        Average shared text size (kbytes): 0
        Average unshared data size (kbytes): 0
        Average stack size (kbytes): 0
        Average total size (kbytes): 0
        Maximum resident set size (kbytes): 658968
        Average resident set size (kbytes): 0
        Major (requiring I/O) page faults: 0
        Minor (reclaiming a frame) page faults: 61715
        Voluntary context switches: 16889
        Involuntary context switches: 32
        Swaps: 0
        File system inputs: 0
        File system outputs: 2376
        Socket messages sent: 0
        Socket messages received: 0
        Signals delivered: 0
        Page size (bytes): 4096
        Exit status: 0

The files created were:

    SRR25630300_1_fastqc.html
    SRR25630300_1_fastqc.zip

    SRR25630300_2_fastqc.html
    SRR25630300_2_fastqc.zip

Unzip the files

    unzip SRR25630300_1_fastqc.zip --> SRR25630300_1_fastqc/
    unzip SRR25630300_2_fastqc.zip --> SRR25630300_2_fastqc/

    unzip SRR25630378_1_fastqc.zip --> SRR25630378_1_fastqc/
    unzip SRR25630378_2_fastqc.zip --> SRR25630378_2_fastqc/

## Looking at fastqc graphs

Comment on whether or not they are consistent with the quality score plots.

    -per-base quality score distributions for R1 and R2 reads
    All of the scores look really good! All in the 30's and gradually get worse towards the end as expected due to degredation. 

    -per-base N content for R1 and R2 reads
    Looks AMAZING! The N content is so small it looks like its 0 the entire way through. No warrnings (N > 5%) or errors (N > 20%) given :)

## Running demultiplexing part 1 script

Coppied the script into this directory and called it demultiplex_part1_script.py I added an output parameter so the name of the output images could be named beforehand

To run the script I made the bash script called demultiplex_part1_script.sh (its the same base code as in Bi621)

### Installs for demultiplex script

    mamba install numpy
    mamba install gzip
    mamba install matplotlib

### Running demultiplexing script

I am running all 4 in one script so I gave myself 5 hours (hopefully it works)

    sbatch ./demultiplex_part1_script.sh 

