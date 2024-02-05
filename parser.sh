#!/usr/bin/env bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=5G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=Parser
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/output_parser_%j.o
#SBATCH --error=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/error_parser_%j.e
#SBATCH --partition=pall


Genome_out="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Sha_flye_polished.fasta.mod.EDTA.anno/Sha_flye_polished.fasta.mod.out"
PERL_SCRIPT="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/parseRM.pl"

#Phylogenetics_doer 
perl $PERL_SCRIPT -i "/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Sha_flye_polished.fasta.mod.EDTA.anno/Sha_flye_polished.fasta.mod.out" -l 50,1 -v
