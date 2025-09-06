#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                #optional: number of cpus, default is 1
#SBATCH --mem=38GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=catcar@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=picard                  #optional: job name
#SBATCH --output=picard_%j.out              #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=picard_%j.err           #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=2:00:00

mamba activate QAA

/usr/bin/time -v picard MarkDuplicates \
INPUT=/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/SRR25630300/SRR25630300_alignreads_Aligned_sorted.out.bam \
OUTPUT=SRR25630300_markdup.bam \
METRICS_FILE=SRR25630300_markdup_metrics.txt \
REMOVE_DUPLICATES=TRUE \
VALIDATION_STRINGENCY=LENIENT


/usr/bin/time -v picard MarkDuplicates \
INPUT=/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/SRR25630378/SRR25630378_alignreads_Aligned_sorted.out.bam \
OUTPUT=SRR25630378_markdup.bam \
METRICS_FILE=SRR25630378_markdup_metrics.txt \
REMOVE_DUPLICATES=TRUE \
VALIDATION_STRINGENCY=LENIENT