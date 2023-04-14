clear all; close all; clc;
%% input point clouds
partition = 'test';
points = readNPY(strcat('rotation_',partition,'.npy'));

%% add gaussian noise
mu = 0;
sigma = 0.024;
shapes_num = size(points,1);

points_with_noise = zeros(size(points));

for s = 1:shapes_num
    xyz = squeeze(points(s,:,:));
    points_with_noise(s,:,:) = xyz + normrnd(mu,sigma,size(xyz));
end

%% save
writeNPY(points_with_noise,strcat('rotation_',partition,'_noise.npy'));