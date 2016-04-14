function makePolarPlot(data)
% function makePolarPlot(data)
%
% Make a polar plot
% Also calculate the orientation selectivity and print this in the plot title
%
%
% Inputs
% data - the output of the importTrace command  

  
[grandMu,orientations] = meanTraces(XXX); %COMPLETE TO EXTRACT DATA
                                          %FROM meanTraces.m


%baseline points: the points (indexes) to use as baseline values
b = 1:14;

%response point: the points to average as part of the response
r = %DO AS ABOVE TO SPECIFY THE RESPONSE PERIOD


%Get the baseline and response values for each stimulus
B=mean(grandMu(b,:),1);
R= %COMPLETE THE LINE

%evoked response
E=R-B; %For extra neatness we will calculate the difference in df/f
       %for this trial.


%convert orientations in degrees to radians since this is what is
%needed for the polar plot.
theta = orientations * (pi/180);

%copy last value to the first to complete the plot 
E(end+1)=E(1);
theta %COMPLETE THE LINE FOR theta


%Make the polar plot
clf
%USE THE polar COMMAND TO MAKE A POLAR PLOT




%Now determine the orientation selectivity
%USE THE MAX COMMAND TO GET THE INDEX OF THE MAXIMUM RESPONSE POINT

%Get the two orthogonal orientations
maxOrientation = orientations(maxInd); 

orthogonalOrientations = [maxOrientation+90, %COMPLETE THE LINE

%YOU WILL NOE NEED TO CORRECT FOR ANY VALUES > 360
f=find(orthogonalOrientations %COMPLETE THE LINE
orthogonalOrientations(f) = orthogonalOrientations(f)- %COMPLETE THE LINE


%pull out the df/f associated with these and average them
orthoValue = mean(E([find(orientations==orthogonalOrientations(1)), %COMPLETE THE LINE



%so the OSI is:
OSI = %COMPLETE THE LINE

title(sprintf('OSI = %0.3f', %COMPLETE THE LINE
