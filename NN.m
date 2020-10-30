% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by NFTOOL
%
% This script assumes these variables are defined:
%
%   houseInputs - input data.
%   houseTargets - target data.
 
inputs = Input;
targets = Target;
 
% Create a Fitting Network
%one hidden layer
% hiddenLayerSize = 5;
% hiddenLayerSize = 10;
% hiddenLayerSize = 15;
 hiddenLayerSize = 20;

% Two hidden layers
% hiddenLayerSize = [5,5];
% hiddenLayerSize = [10,10];
% hiddenLayerSize = [15,15];
% hiddenLayerSize = [20,20];

% Three hidden layers
% hiddenLayerSize = [5,5,5];
% hiddenLayerSize = [10,10,10];
% hiddenLayerSize = [15,15,15];
% hiddenLayerSize = [20,20,20];

% Good neural network
% hiddenLayerSize = [10,8,15];

% net = fitnet(hiddenLayerSize, 'trainbr');
% net = fitnet(hiddenLayerSize, 'traingdm');
% net = fitnet(hiddenLayerSize, 'traingda');
% net = fitnet(hiddenLayerSize, 'traincgb');
% net = fitnet(hiddenLayerSize, 'trainbfg');
 net = fitnet(hiddenLayerSize, 'trainlm');

% Set up Division of Data for Training, Validation, Testing
 net.divideParam.trainRatio = 70/100;
 net.divideParam.valRatio = 15/100;
 net.divideParam.testRatio = 15/100;

% Manually Set up Division of Data for Training, Validation, Testing
% net.divideFcn= 'divideind'; % divide the data manually
% [trainInd,valInd,testInd] = divideind(Input,1:36,37:42,43:48);
% net.divideParam.trainInd= 1:36; % training data indices 
% net.divideParam.valInd= 37:42; % validation data indices 
% net.divideParam.testInd= 43:48;  % testing data indices 
% net.divideParam.trainInd= trainInd; % training data indices 
% net.divideParam.valInd= valInd; % validation data indices 
% net.divideParam.testInd= testInd;  % testing data indices 


% Train the Network
[net,tr] = train(net,inputs,targets);
%[net,tr] = train(net,inputs,targets);
 
% Test the Network
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs);
 
% View the Network
% view(net)
 
% Plots
% Uncomment these lines to enable various plots.
%  figure, plotperform(tr)
%  figure, plottrainstate(tr)
%  figure, plotfit(targets,outputs)
%  figure, plotregression(targets,outputs)
%  figure, ploterrhist(errors)