function makePolarPlot2(data)
% function makePolarPlot(data)
%
% Make a polar plot
% Also calculate the orientation selectivity and print this in the plot title

[grandMu,orientations] = meanTraces(data);


%baseline points: the points (indexes) to use as baseline values
b = 1:14;

%response point: the points to average as part of the response
r = 15:21;


%Get the baseline and response values for each stimulus
B=mean(grandMu(b,:),1);
R=mean(grandMu(r,:),1);

%evoked response
E=R-B;

%convert orientations in degrees to radians
theta = orientations * (pi/180);

%copy last value to the first to complete the plot 
E(end+1)=E(1);
theta(end+1)=theta(1);


%Make the polar plot
%can optionally add an offset to E to help make plot clearer:
zeroOffset=0.5;

figure
p=polar(theta,E+zeroOffset);
set(p,'LineWidth',2)

%add a line to show where zero is
zX = (1:1:360) * (pi/180);
zY = zeros(size(zX))+zeroOffset;

hold on 
pz=polar(zX,zY);
set(pz,'Color','r','LineWidth',2)
hold off





%Now determine the orientation selectivity
[maxValue,maxInd]=max(E); 

%Get the two orthogonal orientations
maxOrientation = orientations(maxInd);

orthogonalOrientations = [maxOrientation+90,maxOrientation-90];

%correct values > 360
f=find(orthogonalOrientations>360);
orthogonalOrientations(f) = orthogonalOrientations(f)-360;

%pull out the df/f associated with these and average them
orthoValue = mean(E([find(orientations==orthogonalOrientations(1)), find(orientations==orthogonalOrientations(2))]));



%so the OSI is:
OSI = (maxValue - orthoValue) / (maxValue+orthoValue);

title(sprintf('OSI = %0.3f',OSI))