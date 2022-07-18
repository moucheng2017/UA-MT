#$ -l tmem=12G
#$ -l gpu=true,gpu_type=!(gtx1080ti|rtx2080ti)
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=24:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

for alpha in {0.001, 0.01, 0.1, 5.0, 10.0}
do
~/miniconda3/envs/pytorch1.4/bin/python train_LA_mismatch_unlabel_mask.py --consistency alpha --labels 2 --batch_size 4 --threshold 0.0 --max_iterations 6000
done