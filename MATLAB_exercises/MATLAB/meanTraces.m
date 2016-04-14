function [grandMu,u] = meanTraces(data)
% function [grandMu,orientations] = meanTraces(data)
%
% Produce two plots showing:
% 1) 16 overlaid average traces (one from each orientation) from the three reps of each stimulus.  
% 2) a single grand average.
%
% outputs:
% 1. A matrix of df/f time course (rows) and stimuli (cols)
% 2. the orientations of the stimuli (degrees) for each column


%Get df/f from matrix (just ot be neater)
dff = %YOUR CODE HERE


%the number of repeats of each stimulus. We will need this to make the plot
numReps= %YOUR CODE HERE

clf %Clear the current axes


%First plot: averages of each orientation
subplot( %COMPLETE THIS LINE TO MAKE THE FIRST SUBPLOT OF A 1x2
         %ARRAY OF SUBPLOTS

%Get the unique orientations and convert to column vector
u=unique(XXX)';  %REPLACE XXX WITH THE CORRECT THING TO GET THE ORIENTATIONS

hold all  %to overlay all lines on the same graph

grandMu=[]; %we will fill this matric to eventually create a grand average for the second plot

n=1; %counter to make the colours work
for ii=u
	f=find(); %FILL IN THE FIND COMMAND TO
                  %IDENTIFY ALL INDEXES IN data(:,1)
                  %WHICH ARE OF THIS ORIENTATION 

	thisOrientation= ; %COMPLETE TO GET ONLY THESE dff VALUES AND
                                %ASSIGN TO A VARIABLE CALLED thisOrientation

	%The temporary variable we made has all three repeats chained together as a single
	%vector. We need to average them, however. The easiest way of doing this is to build
	%a matrix where each repeat is a different colunn
	thisOrientation = reshape(thisOrientation,length(thisOrientation)/numReps,numReps);

	%now we can average across columns
	thisOrientation = %YOUR CODE HERE TO CALCULATE THE AVERAGE
                          %ACROSS COLUMNS (use the mean command)


	plot %COMPLETE THIS LINE TO PLOT THIS ORIENTATION
	grandMu = [grandMu,XXX]; %YOUR CODE IN XXX TO concatenate 
	n=n+1;

end

%Make the plot prettier
box on
ylabel('df/f')
xlabel('#frame')
xlim([1,21]) %keep x axis tight around data range
yl = ylim; %get the y axis limits




%Second plot: grand average
subplot %COMPLETE THE SUBPLOT COMMAND
plot(mean(XXX),'-ok') %COMPLETE THE MEAN COMMAND TO PLOT THE GRAND AVERAGE
xlabel('#frame')
xlim([1,21])
ylim(yl) %make the mean y axis the same as the other plot. 
