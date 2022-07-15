#$ -l tmem=12G
#$ -l gpu=true,gpu_type=(titanxp|titanx)
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=4:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

~/miniconda3/envs/pytorch1.4/bin/python test_LA.py