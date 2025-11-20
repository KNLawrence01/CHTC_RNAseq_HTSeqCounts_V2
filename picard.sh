#!/bin/bash
results_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results
DupReports_staging_prefix=/staging/groups/pepperell_group/Mtb_RNAseq/HTSeqCounts/Results/MultiQC/DUP

cp $results_staging_prefix/$1.sort.bam.gz ./

gunzip -c $1.sort.bam.gz > $1.sort.bam

# Run Picard MarkDuplicates
picard -Xmx12g MarkDuplicates -I $1.sort.bam -O $1.dup.bam -M $1.dup.metrics -REMOVE_DUPLICATES false -ASSUME_SORTED true -VALIDATION_STRINGENCY SILENT

# Compress and move
gzip $1.dup.bam

mv $1.dup.bam.gz $DupReports_staging_prefix/
mv $1.dup.metrics $DupReports_staging_prefix/

# Clean-up
rm $1.sort.bam
