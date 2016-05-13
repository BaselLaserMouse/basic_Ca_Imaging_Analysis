function tfStack = load_stack(fileName)
% Load a TIFF stack
%
% tfStack = load_stack(fileName)
%
% Purpose
% Loads a TIFF stack into MATLAB. Here, a TIFF stack is a series of TIFF
% images that corresponds to a time-series of images. 
%
%
% Inputs
% 'fileName' - a string containing the name of a '.tif' file to load. The
%              image stack will be returned in the output variable
%             'tfStack', which has dimensions (x, y, frames).


tfStack = double(TIFFStack(fileName));