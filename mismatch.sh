#$ -l tmem=32G
#$ -l gpu=true,gpu_type=(rtx6000|rtx8000)
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=24:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

~/miniconda3/envs/pytorch1.4/bin/python train_LA_meanteacher_certainty_unlabel_mismatch.py