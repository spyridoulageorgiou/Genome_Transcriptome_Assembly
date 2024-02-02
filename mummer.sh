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
export PATH=/software/bin:$PATH

#reference
reference_genome=/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

flye=/data/users/sgeorgiou/assembly_annotation_course/Week_2/assembly.fasta
canu=/data/users/sgeorgiou/assembly_annotation_course/Week_2/canu/pacbio_canu_3.contigs.fasta

flye_delta=/data/users/sgeorgiou/assembly_annotation_course/Week_4/output_flye.delta
canu_delta=/data/users/sgeorgiou/assembly_annotation_course/Week_4/output_canu.delta


mummerplot -filter -l -R ${reference_genome} -Q ${flye} --large --png -p out_flye --layout --fat ${flye_delta}

mummerplot -filter -l -R ${reference_genome} -Q ${canu} --large --png -p out_flye --layout --fat ${canu_delta}


