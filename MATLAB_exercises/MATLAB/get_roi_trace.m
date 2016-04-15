function vfTrace = get_roi_trace(tfStack)

% vfTrace = get_roi_trace(tfStack)
%
% 'tfStack' is a variable with dimensions (x, y, frames). A window will
% appear for you to draw an ellipse ROI. The pixels within the ellipse will
% be averaged, and the time trace for that ROI will be returned in
% 'vfTrace'.

disp('Draw an ellipse, then double-click to extract the trace');

imtool(mean(tfStack, 3), [0 5]);
h = imellipse(imgca());
maskPos = wait(h);
if ~isempty(maskPos)
    mbROIMask = createMask(h);
else
    disp('Hey, you have to select a ROI!')
    mbROIMask = [];
end
close(imgcf());

% - extract ROI trace
tfStackStretch = reshape(tfStack, 256*256, []);
mfROIPixels = tfStackStretch(reshape(mbROIMask, 256*256, []), :);

vfTrace = mean(mfROIPixels);
