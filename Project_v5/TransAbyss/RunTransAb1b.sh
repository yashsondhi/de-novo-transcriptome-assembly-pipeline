#!/bin/bash 

#SBATCH -J TransAb1b                                    
#SBATCH -o TransAb1b_%j.log
#SBATCH -e TransAb1b_%j.err 
#SBATCH --mail-type=FAIL,END,BEGIN
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=12
#SBATCH --mem=150gb
#SBATCH --time=48:00:00 

#set wd
module load transabyss/2.0.1
module load igraph/python/0.7.1
module load blat
module load transabyss/2.0.1



#set wd
source ../setup_files/path_set 
cd $PWDHERE/TransAbyss

export PATH=$PATH:$PWDHERE/software/TransABySS

#run
reads=$PWDHERE/input_files/reads-norm.fq
OD=`pwd`

transabyss -k 65 --se $reads --outdir $OD --name k65.transabyss.fa --threads 2 -c 12 &
transabyss -k 75 --se $reads --outdir $OD --name k75.transabyss.fa --threads 2 -c 12 &
transabyss -k 85 --se $reads --outdir $OD --name k85.transabyss.fa --threads 2 -c 12 &

wait
