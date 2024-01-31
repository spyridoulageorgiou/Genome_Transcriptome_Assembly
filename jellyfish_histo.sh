#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --time=05:00:00
#SBATCH --job-name=kmercount
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/home/sgeorgiou/assembly_annotation_course/02-kmercount_%j.o
#SBATCH --error=/home/sgeorgiou/assembly_annotation_course/02-kmercount_%j.e
#SBATCH --mem=40G

module load UHTS/Analysis/jellyfish/2.3.0;


jellyfish histo -t 10 reads_Illumina.jf > reads_Illumina.histo
