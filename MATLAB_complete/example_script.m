% - Load the imaging data
tfStack = load_stack('../MATLAB_exercises/Calcium_imaging_data_int8.tif');

%% - Compute and display the mean image

meanIM = calc_mean(tfStack);

figure;
imagesc(meanIM);
colormap parula;
h = colorbar;
ylabel(h, 'Raw fluorescence', 'FontSize', 32);
axis equal tight;
set(gca, 'FontSize', 32, 'LineWidth', 2);
export_to_pdf(gcf, 'mean_image.pdf');

%% - Show a video of the stack

PlayStack(tfStack);

%% - Use the ROI selection tool to draw a ROI and export the time trace

% - open mean image and add ellipse selection tool to it
vfTrace = get_roi_trace(tfStack);

figure;
plot(vfTrace, 'LineWidth', 3);
xlabel('Time (frames)', 'FontSize', 32);
ylabel('Raw fluorescence', 'FontSize', 32);
axis tight;
set(gca, 'FontSize', 32, 'LineWidth', 2);
export_to_pdf('trace_raw.pdf');

%% - Compute dF/F0

vfTrace_dFF0 = calc_dF_F(vfTrace);

figure;
plot(vfTrace_dFF0, 'LineWidth', 3);
xlabel('Time (frames)', 'FontSize', 32);
ylabel('\Delta F/F_0', 'FontSize', 32);
axis tight;
set(gca, 'FontSize', 32, 'LineWidth', 2);
export_to_pdf('trace_delta_f_f0.pdf');


%% - Load data describing orientation stimuli

load('../MATLAB_exercises/ori_stimuli.mat');


%% - Extract responses for each orientation

mfResponse = meanTraces(vfTrace_dFF0, Orientation);


%% - Plot the response traces

vtTime = (0:20) ./ tFrameRate;

% - Trial-averaged responses
figure;
plot(vtTime, mfResponse', 'LineWidth', 2);
xlabel('Time (s)', 'FontSize', 32);
ylabel('\Delta F/F_0', 'FontSize', 32);
axis tight;
set(gca, 'FontSize', 32, 'LineWidth', 2);
export_to_pdf('trace_dff_all_ori.pdf');

% - Global average response
figure;
plot(vtTime, mean(mfResponse, 1), 'LineWidth', 2);
xlabel('Time (s)', 'FontSize', 32);
ylabel('\Delta F/F_0', 'FontSize', 32);
axis tight;
set(gca, 'FontSize', 32, 'LineWidth', 2);
export_to_pdf('trace_dff_global_mean.pdf');


%% - Compute stimulus trial peak and mean responses, make polar plot

vfMeanResp = makePolarPlot(mfResponse);

% - Determine preferred and orthogonal responses, compute OSI

fOSI = calc_osi(vfMeanResp);

title(sprintf('OSI: %.2f', fOSI'));
export_to_ai(gcf, 'polar_ori.ai');
