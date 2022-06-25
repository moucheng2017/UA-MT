#$ -l tmem=16G
#$ -l gpu=true
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=24:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/SatsumaSeg/exps_airway

~/miniconda3/envs/pytorch1.4/bin/python train_LA_meanteacher_certainty_unlabel_mismatch.py