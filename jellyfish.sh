#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --time=05:00:00
#SBATCH --job-name=kmercount
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/home/sgeorgiou/02-kmercount_%j.o
#SBATCH --error=/home/sgeorgiou/02-kmercount_%j.e
#SBATCH --mem=40G

module load UHTS/Analysis/jellyfish/2.3.0;

output_dir=/home/sgeorgiou/assembly_annotation_course/

output_dir=/home/sgeorgiou/assembly_annotation_course/

jellyfish count -C -m 21 -s 5G -t 8 -o $output_dir/reads_pacbio.jf <(zcat /home/sgeorgiou/assembly_annotation_course/participant_3/pacbio/*.fastq.gz)

jellyfish count -C -m 21 -s 5G -t 8 -o $output_dir/reads_RNAseq.jf <(zcat /home/sgeorgiou/assembly_annotation_course/participant_3/RNAseq/*.fastq.gz)

jellyfish count -C -m 21 -s 5G -t 8 -o $output_dir/reads_Illumina.jf <(zcat /home/sgeorgiou/assembly_annotation_course/participant_3/Illumina/*.fastq.gz)


