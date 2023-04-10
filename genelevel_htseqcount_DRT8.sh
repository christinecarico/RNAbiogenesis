#!/bin/bash

#SBATCH --job-name=gene_DRT8_htseqcount
#SBATCH --output=gene_DRT8_htseqcount.out
#SBATCH --error=gene_DRT8_htseqcount.err
#SBATCH --partition=short
#SBATCH --time=06:00:00
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
echo "Activating RNAseq3 environment"
conda activate RNAseq3
echo "RNAseq3 environment activated"


echo "Starting gene level htseq quantification of DRT8"

htseq-count -f bam -r pos -s no -t exon -i gene_id --additional-attr=gene_name -m union -d , -c DRT8_gene_Ensemblhtseqcount.csv ./Aligned.sortedByCoord.out.bam ../../Homo_sapiens.GRCh38.108.gtf     

echo "Done with gene level htseq quantification of DRT8"
