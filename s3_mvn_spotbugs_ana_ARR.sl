#!/bin/bash -e
#SBATCH --job-name=CkSylArrayJob             # job name (shows up in the queue)
#SBATCH --output s3_logs.txt
#SBATCH --open-mode append                # append output into one file
#SBATCH --time=03:00:00                 # Walltime (HH:MM:SS)
#SBATCH --mem=8GB                     # Memory
#SBATCH --array=0-576                     # Array jobs

module load Maven/3.6.0
module load Python/3.9.5-gimkl-2020a
module load Java/17


srun python s3_mvn_spotbugs_ana_ARR.py -idx "${SLURM_ARRAY_TASK_ID}" -t 577 -crd ../my_codesnippet_analysis/SpotBugs1 -ucrd -pd mvn_apps -upd -ncf spotbugserrorcodesnippets_java -lf spotbugs_logs.txt
