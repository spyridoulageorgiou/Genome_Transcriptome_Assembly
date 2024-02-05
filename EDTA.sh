#!/usr/bin/env bash

#SBATCH --cpus-per-task=50
#SBATCH --mem=10GB
#SBATCH --time=8:00:00
#SBATCH --job-name=EDTA
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/output_EDTA_%j.o
#SBATCH --error=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/error_EDTA_%j.e
#SBATCH --partition=pall

COURSEDIR="/data/courses/assembly-annotation-course"
WORKDIR="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5"
DATADIR="/data/users/grochat/genome_assembly_course"
cd $WORKDIR
singularity exec \
--bind $COURSEDIR \
--bind $WORKDIR \
--bind $DATADIR \
$COURSEDIR/containers2/EDTA_v1.9.6.sif \
EDTA.pl \
--genome /data/users/grochat/genome_assembly_course/data/assembly/flye_assembly_polished.fasta #The genome FASTA \
--species others \
--step all \
--cds /data/courses/assembly-annotation-course/CDS_annotation/TAIR10_cds_20110103_representative_gene_model_updated # The coding sequences FASTA \
--anno 1 #perform whole-genome TE annotation after TE library construction \
-t 50 #Number of threads to run this script (default: 4)

