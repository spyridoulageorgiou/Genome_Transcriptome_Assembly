#!/usr/bin/env bash       

#SBATCH --cpus-per-task=50
#SBATCH --mem=10GB
#SBATCH --time=8:00:00
#SBATCH --job-name=TE
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/output_TE_%j.o
#SBATCH --error=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/error_TE_%j.e
#SBATCH --partition=pall
module load UHTS/Analysis/SeqKit/0.13.2

COURSEDIR="/data/courses/assembly-annotation-course"
input_copia="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/Copia_sequences.fasta"
input_gypsy="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/Gypsy_sequences.fasta"
WORKDIR="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5/EDTA_V1.9.6_new"
OUTDIR="/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_5"

cd $WORKDIR
singularity exec \
--bind $COURSEDIR \
--bind $WORKDIR \
--bind $OUTDIR \
$COURSEDIR/containers2/TEsorter_1.3.0.sif \
TEsorter $input_copia -db rexdb-plant

cd $WORKDIR
singularity exec \
--bind $COURSEDIR \
--bind $WORKDIR \
--bind $OUTDIR \
$COURSEDIR/containers2/TEsorter_1.3.0.sif \
TEsorter $input_gypsy -db rexdb-plant
