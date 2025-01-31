import os
import argparse
import torch
from networks.vnet_mismatch import VNetMisMatch
from test_util_mismatch import test_all_case

parser = argparse.ArgumentParser()
parser.add_argument('--root_path', type=str, default='../data/2018LA_Seg_Training Set/', help='Name of Experiment')
parser.add_argument('--model', type=str,  default='Mismatch_unlabel', help='model_name')
parser.add_argument('--gpu', type=str,  default='0', help='GPU to use')
#
parser.add_argument('--labels', type=int,  default=2, help='no of labelled data points')
parser.add_argument('--threshold', type=float,  default=0.0, help='confidence threshold for masking')
parser.add_argument('--consistency', type=float,  default=0.1, help='consistency')

FLAGS = parser.parse_args()

model_config = FLAGS.model + '_c' + str(FLAGS.consistency) + '_l' + str(FLAGS.labels) + '_t' + str(FLAGS.threshold) + "/"


os.environ['CUDA_VISIBLE_DEVICES'] = FLAGS.gpu
snapshot_path = "../model_mismatch_mask/"+model_config+"/"
test_save_path = "../model_mismatch_mask/prediction/"+model_config+"_post/"
if not os.path.exists(test_save_path):
    os.makedirs(test_save_path)

num_classes = 2

with open(FLAGS.root_path + '/../test.list', 'r') as f:
    image_list = f.readlines()
image_list = [FLAGS.root_path +item.replace('\n', '')+"/mri_norm2.h5" for item in image_list]


def test_calculate_metric(epoch_num):
    net = VNetMisMatch(n_channels=1, n_classes=num_classes, n_filters=8, normalization='batchnorm', has_dropout=False).cuda()
    save_mode_path = os.path.join(snapshot_path, 'iter_' + str(epoch_num) + '.pth')
    net.load_state_dict(torch.load(save_mode_path))
    print("init weight from {}".format(save_mode_path))
    net.eval()

    avg_metric = test_all_case(net, image_list, num_classes=num_classes,
                               patch_size=(112, 112, 80), stride_xy=18, stride_z=4,
                               save_result=True, test_save_path=test_save_path)

    return avg_metric


if __name__ == '__main__':
    metric = test_calculate_metric(5000)
    print(metric)