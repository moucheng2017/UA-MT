#$ -l tmem=12G
#$ -l gpu=true,gpu_type=(rtx6000|rtx8000)
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=24:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

~/miniconda3/envs/pytorch1.4/bin/python train_LA_mismatch_unlabel_mask.py --consistency 2.0 --labels 2 --batch_size 4 --threshold 0.0 --max_iterations 6000