#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=busco
#SBATCH --mail-user=spyridoula.georgiou@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Busco/output_busco_%j.o
#SBATCH --error=/data/users/sgeorgiou/assembly_annotation_course/Week_3/Busco/error_busco_%j.e
#SBATCH --partition=pall



# Load busco
module add UHTS/Analysis/busco/4.1.4

# Define input and output directories
course_dir=/data/users/sgeorgiou/assembly_annotation_course
output_dir=${course_dir}/Week_3/Busco

# Make Augustus config file writable (temporarily copy to working directory)
cp -r /software/SequenceAnalysis/GenePrediction/augustus/3.3.3.1/config augustus_config
export AUGUSTUS_CONFIG_PATH=./augustus_config

assembly=${course_dir}/Week_2/trinity/Trinity.fasta
output_tag=trinity
assembly_type=transcriptome # IMPORTANT TO HAVE TRANSCRIPTOME HERE !

busco --lineage_dataset brassicales_odb10 --cpu 4 -r \ 
-i ${assembly} -o ${output_tag} --mode ${assembly_type} 

# Remove the copied temporary config files
rm -r ./augustus_config
