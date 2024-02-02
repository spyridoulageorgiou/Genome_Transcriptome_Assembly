#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=trinity
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_2/trinity/output_trinity2_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_2/trinity/error_trinity2_%j.e
#SBATCH --partition=pall

module load UHTS/Assembler/trinityrnaseq/2.5.1

# Define input and output directories and file names
input_dir="/data/users/sgeorgiou/assembly_annotation_course/participant_3/RNAseq/"
output_dir="/data/users/sgeorgiou/assembly_annotation_course/Week_2/trinity"
left_reads="ERR754081_1.fastq.gz"
right_reads="ERR754081_2.fastq.gz"

Trinity --seqType fq --left "$input_dir/$left_reads" --right "$input_dir/$right_reads" --output "$output_dir" --CPU 16 --max_memory 64G --SS_lib_type RF

