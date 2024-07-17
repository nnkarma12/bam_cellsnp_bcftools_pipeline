#!/bin/bash

BAM_SUBSET="/mnt/md0/S10503/BAM_Subset/subset-bam_linux"
BASE_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA"
COUNTS_ONLY_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA/CountsOnly"
# Updated list of samples to exclude already processed ones
SAMPLES=("20084a007_01" "20084a008_01" "20084a009_04" "20084a010_04")

for SAMPLE in "${SAMPLES[@]}"; do
    BAM_FILE="${BASE_DIR}/${SAMPLE}/outs/possorted_genome_bam.bam"
    BARCODE_FILE="${COUNTS_ONLY_DIR}/${SAMPLE}/filtered_feature_bc_matrix/barcodes.tsv"
    OUTPUT_FILE="${BASE_DIR}/${SAMPLE}/outs/${SAMPLE}_filt_test.bam"
    
    $BAM_SUBSET -b $BAM_FILE -c $BARCODE_FILE -o $OUTPUT_FILE --cores 40
done
