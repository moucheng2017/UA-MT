#$ -l tmem=12G
#$ -l gpu=true
#$ -S /bin/bash
#$ -j y
#$ -l h_rt=48:00:00
#$ -wd /SAN/medic/PerceptronHead/codes/UA-MT/code

for alpha in {0.001,0.01,0.1,1.0,2.0,5.0,10.0}
do
~/miniconda3/envs/pytorch1.4/bin/python train_LA_meanteacher_certainty_unlabel.py --consistency $alpha --labels 1 --batch_size 4 --max_iterations 6000
done
