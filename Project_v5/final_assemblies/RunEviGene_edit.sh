#!/bin/bash 

#SBATCH -J RunEviGene                                 
#SBATCH -o EviGene_%j.log
#SBATCH -e EviGene_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=yashsondhi@gmail.com
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=200gb
#SBATCH --time=72:00:00 
#SBATCH --output=RunEviGene2.log   # Standard output and error log

# Modified script to run evigenes with newer version of evigenes and on the uf slurm cluster

module load evigene/20200520
#module load evigene/gnu/2013.07.27
module load ncbi_blast/2.8.1 
module load exonerate/2.2.0
module load cdhit/4.6.8
module load perl/5.20.0

cd /home/yashsondhi/yashsondhi/rnaseq/de-novo_trans/dry_rub_Project_Carbonate_v5/final_assemblies

/apps/evigene/20200520/evigene/scripts/prot/tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

/apps/evigene/20200520/evigene/scripts/prot/trclass2mainalt.pl -trclass *trclass

mv *mainalt.tab annotation/
cat okayset1st/combined.okay.tr okayset1st/combined.okalt.tr > annotation/transcripts.fa
cat okayset1st/combined.okay.aa okayset1st/combined.okalt.aa > annotation/transcripts.aa
