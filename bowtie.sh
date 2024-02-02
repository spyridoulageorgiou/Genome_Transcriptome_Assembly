#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=illumina_alignment
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end,error
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Bowtie/output_illumina_alignment_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Bowtie/error_illumina_alignment_%j.e
#SBATCH --partition=pall

# Load Bowtie2 module
module add UHTS/Aligner/bowtie2/2.3.4.1

# Paths to your assemblies
flye_path="/data/users/sgeorgiou/assembly_annotation_course/Week_2/assembly.fasta"
canu_path="/data/users/sgeorgiou/assembly_annotation_course/Week_2/canu/pacbio_canu_3.contigs.fasta"

# Paths to Illumina reads
illumina_dir="/data/users/sgeorgiou/assembly_annotation_course/participant_3/Illumina"
left_reads="ERR3624575_1.fastq.gz"
right_reads="ERR3624575_2.fastq.gz"

# Create an index of your assemblies using bowtie2-build
bowtie2-build $flye_path flye_index
bowtie2-build $canu_path canu_index

# Run bowtie2 for flye assembly
bowtie2 --sensitive-local -x flye_index -1 "$illumina_dir/$left_reads" -2 "$illumina_dir/$right_reads" -S flye_alignment.sam

# Convert SAM to BAM using samtools
samtools view -b -o flye_alignment.bam flye_alignment.sam

# Run bowtie2 for canu assembly
bowtie2 --sensitive-local -x canu_index -1 "$illumina_dir/$left_reads" -2 "$illumina_dir/$right_reads" -S canu_alignment.sam

# Convert SAM to BAM using samtools
samtools view -b -o canu_alignment.bam canu_alignment.sam

# Clean up intermediate SAM files
rm flye_alignment.sam canu_alignment.sam

