#!/bin/bash 

#SBATCH -J Transdecoder                                 
#SBATCH -o Transdecoder_%j.log
#SBATCH -e Transdecoder_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --cpus-per-task=16
#SBATCH --ntasks-per-node=1
#SBATCH --mem=50gb
#SBATCH --time=24:00:00 

##Move to correct WD
module load transdecoder/5.5.0
source ../../setup_files/path_set 
mkdir transdecoder
cd $PWDHERE/final_assemblies/annotation/transdecoder

TransDecoder.LongOrfs -t ../transcripts.main.fa
TransDecoder.Predict -t ../transcripts.main.fa

cp transcripts.main.fa.transdecoder.pep ../
