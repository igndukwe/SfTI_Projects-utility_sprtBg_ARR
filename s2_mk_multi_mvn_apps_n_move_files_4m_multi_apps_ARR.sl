#!/bin/bash -e
#SBATCH --job-name=CkSylArrayJob             # job name (shows up in the queue)
#SBATCH --output s2_logs.txt
#SBATCH --open-mode append                # append output into one file
#SBATCH --time=00:10:00                 # Walltime (HH:MM:SS)
#SBATCH --mem=8GB                     # Memory
#SBATCH --array=0-576                     # Array jobs

module load Maven/3.6.0
module load Python/3.9.5-gimkl-2020a
module load Java/17


srun python s2_mk_multi_mvn_apps_n_move_files_4m_multi_apps_ARR.py -idx "${SLURM_ARRAY_TASK_ID}" -n 577 -s ../my_codesnippet_analysis/CheckStyle1/mvn_apps -ucs -crd ../my_codesnippet_analysis/SpotBugs1 -ucrd -pd mvn_apps -upd -libs checks_lib -rvaf -ctarf -ctsf -upxf
