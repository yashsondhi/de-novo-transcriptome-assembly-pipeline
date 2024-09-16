#!/bin/bash 

#SBATCH -J RunAnnotate                                 
#SBATCH -o Annotate_%j.log
#SBATCH -e Annotate_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20gb
#SBATCH --time=24:00:00 

# installs trinotate 
module load trinotate/3.0.1
# Creates a soft link to Trinotate install directory
ln -s ln -s $HPC_TRINOTATE_DIR/ tri

##Move to correct WD
source ../../setup_files/path_set 
cd $PWDHERE/final_assemblies/annotation

bash ./scripts/Annotate.sh -p GENE
