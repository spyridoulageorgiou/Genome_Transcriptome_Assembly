#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=nucmer
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_4/output_nucmer_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_4/error_nucmer_%j.e
#SBATCH --partition=pall


# load module
module add UHTS/Analysis/mummer/4.0.0beta1

#reference
reference_genome=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

flye=/data/users/sgeorgiou/assembly_annotation_course/Week_2/assembly.fasta
canu=/data/users/sgeorgiou/assembly_annotation_course/Week_2/canu/pacbio_canu_3.contigs.fasta

nucmer -p output_flye --breaklen 1000 --mincluster 1000 ${reference_genome} ${flye}

nucmer -p output_canu --breaklen 1000 --mincluster 1000 ${reference_genome} ${canu}

nucmer -p output_comp --breaklen 1000 --mincluster 1000 ${flye} ${canu}

