#!/usr/bin/env bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=5G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=MAKER
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/MAKER/output_genome_annotation_%j.o
#SBATCH --error=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/MAKER/error_genome_annotation_%j.e
#SBATCH --partition=pall

COURSEDIR=/data/courses/assembly-annotation-course
WORKDIR=/data/users/sgeorgiou/eukaryote_genomes/Sha_group/Week_6/MAKER/

export SLURM_EXPORT_ENV=ALL
export LIBDIR=/software/SequenceAnalysis/Repeat/RepeatMasker/4.0.7/Libraries
export REPEATMASKER_DIR=/software/SequenceAnalysis/Repeat/RepeatMasker/4.0.7/RepeatMasker

module load SequenceAnalysis/GenePrediction/maker/2.31.9

singularity exec --bind $SCRATCH:/TMP --bind $COURSEDIR --bind $WORKDIR $WORKDIR/containers2/MAKER_3.01.03.sif \
    /software/SequenceAnalysis/GenePrediction/maker/2.31.9/bin/maker -mpi --ignore_nfs_tmp -TMP /TMP maker_opts.ctl maker_bopts.ctl maker_exe.ctl

