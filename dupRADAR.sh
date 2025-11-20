#!/bin/bash
staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts
BAMs_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results/BAMs
DupReports_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results/MultiQC/DUP

cp $BAMs_staging_prefix/$1.dup.bam.gz $staging_prefix/$2 ./

gunzip -c $1.dup.bam.gz > $1.dup.bam

BAM="${1}.dup.bam"
GTF=$2
OUT="${1}_output.csv"

Rscript --vanilla dupRADAR.R "$BAM" "$GTF" "$OUT"


