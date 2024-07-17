#!/bin/bash

BASE_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA"
SAMPLES=("20084a001_02" "20084a002_02" "20084a003_02" "20084a004_02" "20084a005_01" "20084a006_01" "20084a007_01" "20084a008_01" "20084a009_04" "20084a010_04" "20084a011_03" "20084a012_01")

for SAMPLE in "${SAMPLES[@]}"; do
    BAM_FILE="${BASE_DIR}/${SAMPLE}/outs/${SAMPLE}_filt_test.bam"
    echo "Indexing ${BAM_FILE}..."
    docker run --rm -v ${BASE_DIR}:/data quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0 samtools index /data/${SAMPLE}/outs/${SAMPLE}_filt_test.bam
done

echo "Indexing completed for all samples."
