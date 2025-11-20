#!/bin/bash
BAMs_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results/BAMs
cp $BAMs_staging_prefix/$1.bam.gz ./

# samtools sort
gunzip -c $1.bam.gz > $1.bam
samtools sort -O bam -T $1.sort $1.bam -o $1.sort.bam

# samtools index
samtools index $1.sort.bam

# compress
gzip $1.sort.bam
gzip $1.sort.bam.bai

# move files
mv $1.sort.bam.gz $BAMs_staging_prefix/
mv $1.sort.bam.bai.gz $BAMs_staging_predix/

# clean-up old files
rm $BAMs_staging_prefix/$1.bam.gz
