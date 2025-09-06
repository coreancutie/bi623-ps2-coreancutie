#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                #optional: number of cpus, default is 1
#SBATCH --mem=38GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=catcar@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=STAR_reads                  #optional: job name
#SBATCH --output=STAR_reads_%j.out              #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=STAR_reads_%j.err           #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=2:00:00

mamba activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part2/SRR25630300_1/SRR25630300_1_paired.fastq.gz \
/projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part2/SRR25630300_2/SRR25630300_2_paired.fastq.gz \
--genomeDir /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/campylomormyrus_database \
--outFileNamePrefix SRR25630300_alignreads_


# /usr/bin/time -v STAR \
# --runThreadN 8 \
# --runMode alignReads \
# --outFilterMultimapNmax 3 \
# --outSAMunmapped Within KeepPairs \
# --alignIntronMax 1000000 \
# --alignMatesGapMax 1000000 \
# --readFilesCommand zcat \
# --readFilesIn /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part2/SRR25630378_1/SRR25630378_1_paired.fastq.gz \
# /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part2/SRR25630378_2/SRR25630378_2_paired.fastq.gz \
# --genomeDir /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/campylomormyrus_database \
# --outFileNamePrefix SRR25630378_alignreads_

