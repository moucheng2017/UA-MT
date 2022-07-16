#$ -l tmem=12G
#$ -l gpu=true
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=24:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

~/miniconda3/envs/pytorch1.4/bin/python train_LA_meanteacher_certainty_unlabel.py --consistency 1.0 --labels 2 --batch_size 4 --max_iterations 6000