% Pure Pursuit Model Initialization
%
% Copyright 2020 The MathWorks, Inc.

%% add Image to the path
addpath(genpath('Images'));

%% load the scene data file generated from Driving Scenario Designer
load('USCity.mat');

%% define reference points
refPose = data.ActorSpecifications(1,67).Waypoints;
xRef = refPose(:,1);
yRef = -refPose(:,2);

%% define reference time for plotting 
Ts = 45.8; % simulation time
s = size(xRef);
tRef = (linspace(0,Ts,s(1)))'; % this time variable is used in the "2D Visualization" block for plotting the reference points.

%% define parameters used in the models
L = 3; % bicycle length
ld = 4; % lookahead distance
X_o = refPose(1,1); % initial vehicle position
Y_o = -refPose(1,2); % initial vehicle position 
psi_o = 0; % initial yaw angle

%% define data for velocity lookup table
lookUpt = readmatrix('velocityDistribution.xlsx');
xlt = lookUpt(2:27,1);
ylt = lookUpt(1,2:32);
vel = lookUpt(2:27,2:32);

LQR_Coeff_US_city;