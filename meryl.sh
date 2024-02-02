#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH --job-name=meryl
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/rschwob/01_assembly_annotation_course/Week_3/output_meryl_%j.o
#SBATCH --error=/data/users/rschwob/01_assembly_annotation_course/Week_3/error_meryl_%j.e
#SBATCH --partition=pall

# Load the module
module add UHTS/Assembler/canu/2.1.1

# Define input (illumina) and output directories
course_dir=/data/users/sgeorgiou/assembly_annotation_course
illumina_dir=${course_dir}/participant_3/Illumina
output_dir=${course_dir}/Week_3/Meryl

# Define the directory for temporary storage
temp_dir=/data/users/sgeorgiou/temp

# Create the temporary directory
mkdir -p $temp_dir

# Create meryl db (first for each read into the temporary directory, then merge them and save in the course directory)
meryl k=19 count output $temp_dir/read_1.meryl ${illumina_dir}/*1.fastq.gz
meryl k=19 count output $temp_dir/read_2.meryl ${illumina_dir}/*2.fastq.gz
meryl union-sum output ${output_dir}/illumina.meryl $temp_dir/read*.meryl

