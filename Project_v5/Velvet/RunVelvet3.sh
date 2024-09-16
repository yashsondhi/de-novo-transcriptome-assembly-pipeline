#!/bin/bash 

#SBATCH -J RunVelvet3                                  
#SBATCH -o Velvet3_%j.log
#SBATCH -e Velvet3_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=3
#SBATCH --mem=200gb
#SBATCH --time=12:00:00 
##Move to correct WD

module load velvet/1.2.10
module load oases/0.2.08


##Move to correct WD
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
oases oases.35 &
oases oases.45 &
oases oases.55 &

wait
