#$ -l tmem=12G
#$ -l gpu=true,gpu_type=(p100|v100)
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=96:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

for alpha in {0.001,0.01,0.1,1.0,2.0,5.0,10.0}
do
~/miniconda3/envs/pytorch1.4/bin/python train_LA_mismatch_unlabel_mask.py --consistency $alpha --labels 4 --batch_size 4 --threshold 0.0 --max_iterations 6000 --seed 1337
done