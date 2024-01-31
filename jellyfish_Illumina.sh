#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --time=05:00:00
#SBATCH --job-name=kmercount
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/02-kmercount_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/02-kmercount_%j.e
#SBATCH --mem=40G

module load UHTS/Analysis/jellyfish/2.3.0;

output_dir=/data/users/sgeorgiou/assembly_annotation_course/

jellyfish count -C -m 21 -s 5G -t 8 -o $output_dir/reads_Illumina.jf <(zcat /data/users/sgeorgiou/assembly_annotation_course/participant_3/Illumina/*.fastq.gz)



