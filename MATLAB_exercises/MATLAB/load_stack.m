function tfStack = load_stack(strFilename)

% tfStack = load_stack(strFilename)
%
% 'strFileName' is a string containg the name of a '.tif' file to load. The
% image stack will be returned in 'tfStack', which is a variable with
% dimensions (x, y, frames).

tfStack = double(TIFFStack(strFilename));