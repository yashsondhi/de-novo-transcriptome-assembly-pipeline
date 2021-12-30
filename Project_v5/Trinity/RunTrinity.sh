#!/bin/bash 

#SBATCH -J RunTrinity                                   
#SBATCH -o Trinity_%j.log
#SBATCH -e Trinity_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=220gb
#SBATCH --time=4-0:0:00 

source ../setup_files/path_set
cd $PWDHERE/Trinity

export PATH=$PATH:$PWDHERE/software/Trinity
module load trinity/2.12.0


export reads=$PWDHERE/input_files/reads-norm.fq

Trinity --max_memory 200G --seqType fq  --single $reads --CPU 16 --full_cleanup --output $TMPDIR/trinity_out_dir 

cp $TMPDIR/trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
