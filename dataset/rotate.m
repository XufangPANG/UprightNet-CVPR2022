clear all; close all; clc;
%% input original shapes
partition = 'test';
points = readNPY(strcat('points_',partition,'.npy'));

%% get rotation euler angles
sphere = importdata('angle56.txt');
euler = acos(sphere);
euler = [euler;-euler];

%% rotate one shape 100 times
% rotation_times = 100;
% 
% rotation = zeros(rotation_times, 2048, 3);
% rotm = zeros(rotation_times, 3, 3);
% 
% s = 1;
% original = squeeze(points(s,:,:));
% randidx = randperm(size(euler,1));
% eul = euler(randidx(1:rotation_times),:);
% eul = eul + rand(size(eul)) .*  asin(0.15); % interference
% for r = 1:rotation_times
%     mat = eul2rotm(eul(r,:));
%     rotation(r, :, :) = original * mat;
%     rotm(r, :, :) = mat;
% end

%% rotate all shapes 100 times
rotation_times = 100;
shapes_num = size(points,1);

rotation = zeros(shapes_num * rotation_times, 2048, 3);
rotm = zeros(shapes_num * rotation_times, 3, 3);

for s = 1:shapes_num
    original = squeeze(points(s,:,:));
    randidx = randperm(size(euler,1));
    eul = euler(randidx(1:rotation_times),:);
    eul = eul + rand(size(eul)) .*  asin(0.15); %
    for r = 1:rotation_times
        mat = eul2rotm(eul(r,:));
        rotation((s-1)*100+r, :, :) = original * mat;
        rotm((s-1)*100+r, :, :) = mat;
    end
end

%% save
writeNPY(rotation,strcat('rotation_',partition,'.npy'));
writeNPY(rotm,strcat('rotm_',partition,'.npy'));
