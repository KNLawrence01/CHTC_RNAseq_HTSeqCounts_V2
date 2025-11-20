#!/bin/bash
staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/fastq
results_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results

cp $staging_prefix/$1_R1_001.fastq.gz $staging_prefix/$1_R2_001.fastq.gz $staging_prefix/adapters.fa ./

# fastqc
#fastqc $1_R1_001.fastq.gz $1_R2_001.fastq.gz -t 4
# trimmomatic
#trimmomatic PE $1_R1_001.fastq.gz $1_R2_001.fastq.gz -baseout $1.fq.gz -threads 4 ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50

#fastp
fastp -i $1_R1_001.fastq.gz -I $1_R2_001.fastq.gz -o $1_1P.fq.gz -O $1_2P.fq.gz --thread 4 --adapter_fasta adapters.fa -h $1_fastp.html

mv $1_1P.fq.gz $results_staging_prefix/
mv $1_2P.fq.gz $results_staging_prefix/
