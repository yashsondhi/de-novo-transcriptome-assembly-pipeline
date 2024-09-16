#!/bin/bash 

#SBATCH -J RunSOAP1b                                   
#SBATCH -o SOAP1b_%j.log
#SBATCH -e SOAP1b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=2
#SBATCH --mem=200gb
#SBATCH --time=24:00:00 

module load soapdenovo-trans/1.03

##Move to correct WD
source ../setup_files/path_set
cd $PWDHERE/SOAP/

##load modules
export PATH=$PATH:$PWDHERE/software/SOAPdenovo

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 65 -o output65 &
SOAPdenovo-Trans-127mer all -s config_file -K 75 -o output75 &
SOAPdenovo-Trans-127mer all -s config_file -K 85 -o output85 &

wait
