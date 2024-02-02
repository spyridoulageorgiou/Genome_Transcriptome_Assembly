#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=pilon_polishing
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end,error
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Pilon/output_pilon_polishing_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Pilon/error_pilon_polishing_%j.e
#SBATCH --partition=pall

# Load the Pilon module
module add UHTS/Analysis/pilon/1.22
module load UHTS/Analysis/samtools/1.10;

# Paths to your assemblies and Illumina alignments
canu_assembly="/data/users/sgeorgiou/assembly_annotation_course/Week_2/canu/pacbio_canu_3.contigs.fasta"
illumina_alignment_canu="/data/users/sgeorgiou/assembly_annotation_course/Week_3/Bowtie/canu_alignment.bam"

# Output directories for Pilon polishing
pilon_output_canu="/data/users/sgeorgiou/assembly_annotation_course/Week_3/Pilon"

# Indexing
#'samtools sort $illumina_alignment_canu -o $illumina_alignment_canu".sorted.bam"
samtools index $illumina_alignment_canu".sorted.bam"

# Run Pilon for Canu assembly
java -Xmx45g -jar /mnt/software/UHTS/Analysis/pilon/1.22/bin/pilon-1.22.jar \
    --genome "$canu_assembly" \
    --bam "$illumina_alignment_canu.sorted.bam" \
    --outdir "$pilon_output_canu" \
    --output "canu_polished"

