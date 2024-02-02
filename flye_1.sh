#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=flye
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end,error
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_2/output_fastqc_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_2/error_fastqc_%j.e
#SBATCH --partition=pall


#Load fastqc module
module load UHTS/Assembler/flye/2.8.3

#Create data directory variables
WORKDIR=/data/users/sgeorgiou/assembly_annotation_course
DATA=${WORKDIR}/participant_3/pacbio
RESULTS=${WORKDIR}/Week_2

#Set working directory
cd ${WORKDIR}

flye --pacbio-raw ${DATA}/ERR3415830.fastq.gz ${DATA}/ERR3415831.fastq.gz --out-dir ${RESULTS} --threads 16




