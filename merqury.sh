#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=10:00:00
#SBATCH --job-name=merqury
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Merqury/output_merqury_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Merqury/error_merqury_%j.e
#SBATCH --partition=pall

# Define input and output directories
course_dir=/data/users/sgeorgiou/assembly_annotation_course
meryl_dir=${course_dir}/Week_3/Meryl/illumina.meryl
output_parent_dir=${course_dir}/Week_3/Merqury

# Define input file and options
# NOTE: CHOOSE THE ONE TO USE (OUT-COMMENT THE OTHERS)

# assembly=${course_dir}/Week_3/Pilon/flye_polished.fasta
# output_tag=flye_merqury

# assembly=${course_dir}/Week_3/Pilon/canu_polished.fasta
# output_tag=canu_merqury

# assembly=${course_dir}/Week_2/assembly.fasta
# output_tag=flye_original

assembly=${course_dir}/Week_2/canu/pacbio_canu_3.contigs.fasta
output_tag=canu_original

# Run merqury
output_dir=${output_parent_dir}/${output_tag}
mkdir ${output_dir}
cd ${output_dir}
apptainer exec \
--bind ${course_dir} \
/software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
merqury.sh ${meryl_dir} ${assembly} ${output_tag}
