#$ -l tmem=12G
#$ -l gpu=true
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=48:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

for label_no in {1, 2, 4, 8}
do
~/miniconda3/envs/pytorch1.4/bin/python train_LA.py --labels $label_no --batch_size 4 --max_iterations 6000
done
