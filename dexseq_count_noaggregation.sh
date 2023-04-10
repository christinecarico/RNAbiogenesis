#!/bin/bash

#SBATCH --job-name=noaggregation_dexseq_count_DRT8
#SBATCH --output=noaggregation_dexseq_count_DRT8.out
#SBATCH --error=noaggregation_dexseq_count_DRT8.err
#SBATCH --partition=short
#SBATCH --time=08:00:00
#SBATCH --mem-per-cpu=10000
#SBATCH --cpus-per-task=6
#SBATCH --mail-user=caricoc@uab.edu
#SBATCH --mail-type=ALL

# This loads the Anaconda environment
echo "Loading Anaconda3/2021.11"
module load Anaconda3/2021.11
echo "Anaconda3/2021.11 loaded"
echo "Activating base environment"
source activate 
echo "Base environment activated"
echo "Activating DEXSeq environment"
conda activate DEXSeq
echo "DEXSeq env activated"

echo "Counting exon bins for DRT8 with gff file with no gene aggregation"
python /data/user/caricoc/.conda/pkgs/bioconductor-dexseq-1.44.0-r42hdfd78af_0/lib/R/library/DEXSeq/python_scripts/dexseq_count.py -p yes -r pos -s no -f bam ../../FlattenedEnsemblFile_noaggregation.gff Aligned.sortedByCoord.out.bam DRT8_dexseqcount_noaggregation.txt
echo "Done counting exon bins for DRT8 with gff file with no gene aggregation"
