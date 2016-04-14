function [grandMu,u] = meanTraces(data)
% function [grandMu,orientations] = meanTraces(data)`
%
% Produce two plots showing:
% 1) 16 overlaid average traces (one from each orientation) from the three reps of each stimulus.  
% 2) a single grand average.
%
% outputs:
% 1. A matrix of df/f time course (rows) and stimuli (cols)
% 2. the orientations of the stimuli (degrees) for each column

%dff = calc_dF_F(data); %Get the df/f using function we have already made
dff = data(:,2);
numReps=3; %the number of repeats of each stimulus. We will need this to make the plot

clf


%First plot: averages of each orientation
subplot(1,2,1)
u=unique(data(:,1))'; %Get the unique orientations and convert to column vector

myColours = lines(length(u)); %generate some colours so we can plot each line distinctly
hold on %to overlay all lines on the same graph

grandMu=[]; %we will fill this matric to eventually create a grand average for the second plot

n=1; %counter to make the colours work
for ii=u
	f=find(data(:,1)==ii); %indexes containing this orientation
	thisOrientation=dff(f); %make a temporary variable

	%The temporary variable we made has all three repeats chained together as a single
	%vector. We need to average them, however. The easiest way of doing this is to build
	%a matrix where each repeat is a different colunn
	thisOrientation = reshape(thisOrientation,length(thisOrientation)/numReps,numReps);

	%now we can average across columns
	thisOrientation = mean(thisOrientation,2);


	plot(thisOrientation, '-', 'color', myColours(n,:))
	grandMu = [grandMu,thisOrientation]; %concatenate 
	n=n+1;

end
hold off %switch off overlay
box on
ylabel('df/f')
xlabel('#frame')
xlim([1,21]) %keep x axis tight around data range
yl = ylim; %get the y axis limits

%Second plot: grand average
subplot(1,2,2)
plot(mean(grandMu,2),'-ok','MarkerFaceColor',[1,1,1]*0.5)
xlabel('#frame')
xlim([1,21])
ylim(yl) %make the mean y axis the same as the other plot. 