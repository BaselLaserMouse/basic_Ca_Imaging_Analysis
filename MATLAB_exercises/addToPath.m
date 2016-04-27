function addToPath
% Add all non-hidden directories in the current directory to the MATLAB path
%
% function addToPath
%
% PURPOSE
% Add directories to the path for the current MATLAB session.
% 
% INPUTS
% none
%
% OUTPUTS
% none
%
% 
% Rob Campbell - Basel 2016


d=dir(pwd);

for ii=1:length(d)

	%Skip unwanted stuff
	if ~d(ii).isdir || strcmp(d(ii).name(1),'.')
		continue
	end

	%Attempt to add to path
	thisDir = fullfile(pwd,d(ii).name);
	pathBefore=addpath(thisDir); %won't add duplicates

	%Report that the directory was added if path has grown in length
	if length(pathBefore)<length(path)
		fprintf('Added %s to the MATLAB path\n', thisDir)
	end

end %for ii=1:length(d)
