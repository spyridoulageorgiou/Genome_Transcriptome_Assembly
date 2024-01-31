#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/home/sgeorgiou/assembly_annotation_course/output_fastqc_%j.o
#SBATCH --error=/home/sgeorgiou/assembly_annotation_course/error_fastqc_%j.e
#SBATCH --partition=pall

module load UHTS/Quality_control/fastqc/0.11.9;

fastqc -o /home/sgeorgiou/assembly_annotation_course /home/sgeorgiou/assembly_annotation_course/participant_3/Illumina/*.fastq.gz


