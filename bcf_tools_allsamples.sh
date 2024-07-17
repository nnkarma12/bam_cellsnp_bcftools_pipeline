# Variables
BASE_DIR="/mnt/md0/Nasser/20084I_0552_Mo_snRNA/cellSNP_output"
BCFTOOLS="/mnt/md0/S10503/bcftools/bcftools"
REF_VCF="/mnt/md0/S10503/PPMI_Genotypes/ppmi.july2018.chr12.vcf.gz"

# Iterate over each sample directory
for SAMPLE_DIR in ${BASE_DIR}/*; do
    if [ -d "${SAMPLE_DIR}" ]; then
        SAMPLE=$(basename ${SAMPLE_DIR})
        VCF_FILE="${SAMPLE_DIR}/cellSNP.cells.vcf"
        COMPRESSED_VCF_FILE="${SAMPLE_DIR}/cellSNP.cells.vcf.gz"
        OUTPUT_FILE="${SAMPLE_DIR}/gtcheck.txt"
        DISCORDANCE_FILE="${SAMPLE_DIR}/discordance.txt"

        echo "Processing sample ${SAMPLE}..."

        # Compress the VCF file
        echo "Compressing ${VCF_FILE}..."
        ${BCFTOOLS} view ${VCF_FILE} -Oz -o ${COMPRESSED_VCF_FILE}

        # Index the compressed VCF file
        echo "Indexing ${COMPRESSED_VCF_FILE}..."
        ${BCFTOOLS} tabix ${COMPRESSED_VCF_FILE}

        # Run correlation check with bcftools gtcheck
        echo "Running bcftools gtcheck for ${COMPRESSED_VCF_FILE}..."
        ${BCFTOOLS} gtcheck -g ${REF_VCF} ${COMPRESSED_VCF_FILE} > ${OUTPUT_FILE}

        # Extract correlation information
        echo "Extracting correlation information for ${OUTPUT_FILE}..."
        grep -F -f ${PPMI_ID_FILE} ${OUTPUT_FILE} > ${DISCORDANCE_FILE}

        echo "Finished processing sample ${SAMPLE}."
    fi
done

echo "Processing completed for all samples."
