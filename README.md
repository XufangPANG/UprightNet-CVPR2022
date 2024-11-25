# UprightNet-CVPR2022
Upright-Net: Learning Upright Orientation for 3D Point Cloud (CVPR2022) Code and Data

This repo contains the dataset and model for the paper Upright-Net: Learning Upright Orientation for 3D Point Cloud by Xufang PANG Feng LI et al.  

* The source code has been released on Gitlab, see the link  (https://gitlab.com/open-source7452523/uprightnet)  

Dataset - UprightNet15 

1. We use 15 classes in dataset ModelNet40, which includes 1110 training 3D models and 370 testing models. 
shapename.txt includes the class name of 15 categories. 

2. points_train.npy / points_test.npy are original data used in our project, with the size of 1110*2048*3 for training models and  370*2048*3 for testing models, each 3D model includes 2048 three-dimensional points.

3. labels_train.npy / labels_test.npy are corresponding labels for training and testing datasets with data sizes of 1110*1 and 370*1, which are encoded with values between 0 and 14 mapping to the 15 class names listed in shapename.txt, for example, 0 = 'bed'. 

4. pid_train.npy / pid_test.npy are binary labels for supporting points on 3D models, with the size of 1110*2048/370*2048。

5. angle56.txt includes 56 points uniformly distributed points sampled on a unit half sphere. By flipping the sign of sampled points,  112 uniformly sampled points on a unit sphere can be obtained. 

Code 

1. The folder utils include code that is used for reading .pny files in MATLAB, which you can download from link https://github.com/kwikteam/npy-matlab

2. rotate.m 
This file provides code to rotate point clouds and generates its corresponding rotation matrix, for example, input file points_test.npy, and output rotation_test.npy where each model is rotated 100 times to gain rotated point cloud coordinates (37000*2048*3) and rotm_test.npy with their corresponding transformation matrix.  

3. noise.m
This file provides code for adding gaussian noise with parameters mu and sigma, for example, input rotation_test.npy, it output rotation_test_noise.npy, with the size of 37000*2048*3. 

 
