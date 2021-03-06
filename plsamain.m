
clear variables;
%% Assignment 5 - Image Retrieval 
Z = 6; % Number of Topics
iter = 100 ; % Number of EM iterations
qlevels =  csvread('colors.csv');
currentFolder = pwd;
folderpath = [currentFolder '/mirflickr1000/*.jpg'];
imagepath = [currentFolder '/mirflickr1000/'];
type = 'hist';

%% Task 2 - Image Features 
% V = allImageFeatures(qlevels); %Uncomment to extract features from new
% set of Images
% V = cell2mat(V);  %Uncomment to extract features from new
% set of Images
% Loading already obtained matrix
load('Vnew.mat');


%% Task 3 - PLSA 


[Pd_z ,Pw_z, Pz, Lt] = plsaFit(V,Z,iter);
% save('Task_3_Data.mat', 'Pd_z','Pw_z', 'Lt', 'Pz' );
plot(Lt);

C = bsxfun(@times, Pd_z', Pz);
Pz_d = bsxfun(@rdivide, C , sum(C,1));

%% Task 4 - Analyse the Learned Topic Model
viewTopics(Pw_z, Pz_d);

%%
showSimilarImages(Pz_d, [44, 59, 109], 5);
% showSimilarImages(Pz_d, [40, 302, 779], 5);

h = get(0,'children');
for i=1:length(h)
  saveas(h(i), ['figure' num2str(i)], 'png');
end












