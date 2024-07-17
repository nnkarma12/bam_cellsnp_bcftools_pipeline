#!/bin/bash

BASE_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA"
OUT_BASE_DIR="${BASE_DIR}/cellSNP_output"
VCF_REF="/mnt/md0/S10503/PPMI_Genotypes/ppmi.july2018.chr12.vcf.gz"
CELL_SNP_BIN="/mnt/md0/S10503/cellsnp-lite/cellsnp-lite"
SAMPLES=("20084a001_02" "20084a002_02" "20084a003_02" "20084a004_02" "20084a005_01" "20084a006_01" "20084a007_01" "20084a008_01" "20084a009_04" "20084a010_04" "20084a011_03" "20084a012_01")

# Iterate over each sample
for SAMPLE in "${SAMPLES[@]}"; do
    BAM_FILE="${BASE_DIR}/${SAMPLE}/outs/${SAMPLE}_filt_test.bam"
    OUT_DIR="${OUT_BASE_DIR}/${SAMPLE}"

    # Create the output directory if it doesn't exist
    mkdir -p ${OUT_DIR}

    echo "Running CellSNP-lite for ${SAMPLE}..."
    ${CELL_SNP_BIN} -s ${BAM_FILE} -I ${SAMPLE} -O ${OUT_DIR} -R ${VCF_REF} -p 10 --cellTAG None --UMItag UB --genotype
    echo "CellSNP-lite processing completed for ${SAMPLE}."
done

echo "CellSNP-lite processing completed for all samples."
