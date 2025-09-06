#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp                  #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                #optional: number of cpus, default is 1
#SBATCH --mem=38GB                        #optional: amount of memory, default is 4GB per cpu
#SBATCH --mail-user=catcar@uoregon.edu     #optional: if you'd like email
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --job-name=star_database           #optional: job name
#SBATCH --output=star_database_%j.out      #optional: file to store stdout from job, %j adds the assigned jobID
#SBATCH --error=star_database_%j.err       #optional: file to store stderr from job, %j adds the assigned jobID
#SBATCH --time=1:00:00

mamba activate QAA

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/campylomormyrus \
--genomeFastaFiles /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/campylomormyrus.fasta \
--sjdbGTFfile /projects/bgmp/catcar/bioinfo/Bi623/PS/bi623-ps2-coreancutie/part3/campylomormyrus.gtf