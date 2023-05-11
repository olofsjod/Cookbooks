#!/bin/bash -l

# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A snic2022-22-666

# The name of the script
#SBATCH -J SIM_MEEP_Inoue2020_1

#SBATCH --mem=256GB

# The partition
# https://www.pdc.kth.se/support/documents/run_jobs/job_scheduling.html
#SBATCH -p long

# 10 hours wall-clock time will be given to this job
#SBATCH -t 72:00:00

# Number of nodes
#SBATCH --nodes=10

# Number of MPI processes per node
#SBATCH --ntasks-per-node=128

# Email
#SBATCH --mail-type=ALL

module load PDC/21.11

# Activate conda
CONDA_PATH="/cfs/klemming/projects/snic/snic2022-22-666/miniconda3/bin/conda"
eval "$($CONDA_PATH shell.bash hook)"
conda activate pmp

# See the discussions on https://www.kth.se/blogs/pdc/2018/08/getting-started-with-slurm/
# Parallel program should be started with srun on Beskow. Not sure if this also applies to Dardel.

# About parameters in srun: https://www.pdc.kth.se/support/documents/run_jobs/job_scripts_dardel.html
# "It is advisable to use parameter flags in the #SBATCH tags rather than as parameters in srun, to increase clarity of your scripts."

srun python power_calc_inoue2020.py --run-simulation 40 36
