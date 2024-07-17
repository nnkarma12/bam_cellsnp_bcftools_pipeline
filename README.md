# bam_cellsnp_bcftools_pipeline
This repository contains a collection of scripts for processing genomic data using BAM subset, cellSNP, and bcftools. The scripts facilitate various steps in the genomic data analysis pipeline, including BAM file subsetting, VCF file generation and indexing, and correlation checks using bcftools.

# Contents
subset_bam_all_samples.sh: Script for subsetting BAM files for all samples.
verify_bam_files.sh: Script for verifying the integrity of BAM files.
samtools_index_bam_files.sh: Script for indexing BAM files using samtools.
run_cellsnp_all_samples.sh: Script for running cellSNP on all samples to generate VCF files.
bcf_tools_process_all_samples.sh: Script for compressing, indexing, and running bcftools gtcheck on VCF files for all samples.

# Usage
Subset BAM Files: Use subset_bam_all_samples.sh to subset BAM files for all samples.
Verify BAM Files: Use verify_bam_files.sh to check the integrity of BAM files.
Index BAM Files: Use samtools_index_bam_files.sh to index the BAM files.
Run cellSNP: Use run_cellsnp_all_samples.sh to generate VCF files from BAM files using cellSNP.
Process VCF Files: Use bcf_tools_process_all_samples.sh to compress, index, and run bcftools gtcheck on the VCF files for all samples.

# Prerequisites
Docker
bcftools
samtools
cellSNP
