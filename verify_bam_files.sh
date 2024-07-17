#!/bin/bash

BASE_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA"
# List of samples to check, excluding 20084a006_01 and 20084a004_02
SAMPLES=("20084a001_02" "20084a002_02" "20084a003_02" "20084a005_01" "20084a007_01" "20084a008_01" "20084a009_04" "20084a010_04" "20084a011_03" "20084a012_01")

SAMTOOLS_IMAGE="quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0"

for SAMPLE in "${SAMPLES[@]}"; do
    BAM_FILE="${BASE_DIR}/${SAMPLE}/outs/${SAMPLE}_filt_test.bam"
    echo "Verifying ${BAM_FILE}..."
    docker run --rm -v ${BASE_DIR}:/data $SAMTOOLS_IMAGE samtools quickcheck /data/${SAMPLE}/outs/${SAMPLE}_filt_test.bam
    if [ $? -eq 0 ]; then
        echo "${BAM_FILE} is OK."
    else
        echo "${BAM_FILE} is corrupted or truncated."
    fi
done

echo "Verification completed for all specified samples."
