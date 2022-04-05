#!/bin/bash
#SBATCH --qos=regular
#SBATCH --constraint=haswell
#SBATCH --nodes=100
#SBATCH --ntasks=1000
#SBATCH --cpus-per-task=1
#SBATCH -J FilteringTemp2
#SBATCH -o out/filt_temp2.out
#SBATCH -e out/filt_temp2.err
#SBATCH --time=04:00:00
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=anto.lonappan@sissa.it


source /global/homes/l/lonappan/.bashrc
conda activate PC2
cd /global/u2/l/lonappan/workspace/s4bird/s4bird

export ini=lbcs4_2.ini


mpirun -np $SLURM_NTASKS python quest.py $ini -ivt
