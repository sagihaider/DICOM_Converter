% Conert DICOM images from any of the formats:png,bmp,jpg,png,tiff,gif

% Code by @ Dr Haider Raza
% Lecturer in School of Computing and Electronics Engineering, 
% University of Essex, Colchester, England
% contact: h.raza@essex.ac.uk
% Date: 21/03/2021
% Last updated: 21/03/2021
% This code has been slightly modified version of the code from Rance Tino https://uk.mathworks.com/matlabcentral/profile/authors/8183651

%%
close all;
clc;
clear all

%% Read Current folder
pwd
currentFolder = pwd % Get current path (working directory)
pathin = '/IMG_DICOM/'; % data directory
pathin = fullfile(currentFolder,pathin); % combine path
pathindir = '/IMG_DICOM/*.DCM'; % search specific data type (*.DCM)
pathindir = fullfile(currentFolder,pathindir);% combine path
pathout = '/IMG_PNG/'; % output directory
pathout=fullfile(currentFolder,pathout);

if ~exist(pathout, 'dir')
    mkdir(pathout);
end


Files=dir(pathindir);
for k=1:length(Files)
   FileNames=Files(k).name
   filename = fullfile(pathin, FileNames);
   outfileName = strrep(FileNames,'DCM','PNG');
   outname = fullfile(pathout,outfileName);
   dicom2image(filename,'png',outname)
end

close all;

