#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH --job-name=quast
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_3/QUAST/output_quast_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_3/QUAST/error_quast_%j.e
#SBATCH --partition=pall

# Load quast
module add UHTS/Quality_control/quast/4.6.0

# Define input and output directories
course_dir=/data/users/sgeorgiou/assembly_annotation_course
output_dir=${course_dir}/Week_3/QUAST

# Link and define reference genome
ref_genome=${course_dir}/Week_3/QUAST/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
ref_features=${course_dir}/Week_3/QUAST/TAIR10_GFF3_genes.gff

# Define input file(s) and label(s)

# WITH POLISHED ASSEMBLIES
assembly2=${course_dir}/Week_3/Pilon/flye_polished.fasta
output_tag2=flye_polished

assembly4=${course_dir}/Week_3/Pilon/canu_polished.fasta
output_tag4=canu_polished

# WITH ORIGINAL ASSEMBLIES (OPTIONAL)
assembly1=${course_dir}/Week_2/assembly.fasta
output_tag1=flye_original

assembly3=${course_dir}/Week_2/canu/pacbio_canu_3.contigs.fasta
output_tag3=canu_original

python /software/UHTS/Quality_control/quast/4.6.0/bin/quast.py \
--est-ref-size 130000000 \
-e -m 3000 -i 500 -x 7000 -t 8 \
-l ${output_tag1},${output_tag2},${output_tag3},${output_tag4} ${assembly1} ${assembly2} ${assembly3} ${assembly4}
