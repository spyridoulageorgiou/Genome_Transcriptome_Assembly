#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem=64G
#SBATCH --time=01:00:00
#SBATCH --job-name=canu
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end,error
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_2/output_canu_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_2/error_canu_%j.e
#SBATCH --partition=pall


#Load fastqc module
module load UHTS/Assembler/canu/2.1.1

file_path="/data/users/sgeorgiou/assembly_annotation_course/participant_3/pacbio"
out_dir="/data/users/sgeorgiou/assembly_annotation_course/Week_2/canu"

# Genome size
canu -p pacbio_canu_3 -d $out_dir genomeSize=135m -pacbio $file_path/*.fastq.gz maxThreads=16 maxMemory=64 gridEngineResourceOption="--time=48:00:00 --cpus-per-task=THREADS --mem-per-cpu=MEMORY"
