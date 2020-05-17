% Question 4

%Question 4a

vid_obj = VideoReader('DatasetC.mpg');
videoFrames = read(vid_obj);

[row, col, channel, nframe]= size(videoFrames);
for i = 1: nframe - 1
    [XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,i), videoFrames(:,:,:,i+1), 16, 20);
end

%Question 4b
for i = 1: nframe - 1
    [XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,i), videoFrames(:,:,:,i+1), 16, 20);
    predicted_image = ICV_predicted_image(videoFrames(:,:,:,i), 16, XSource, YSource, USource, VSource);
end

%Question 4c
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 4, 16);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 4, XSource, YSource, USource, VSource);
toc
%Elapsed time is 4.023469 seconds. (Time taken for the above code)
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 8, 16);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 8, XSource, YSource, USource, VSource);
toc
%Elapsed time is 1.740996 seconds. (Time taken for the above code)
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 16, 16);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 16, XSource, YSource, USource, VSource);
toc
%Elapsed time is 0.880320 seconds. (Time taken for the above code)

% Question 4d
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 8, 8);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 8, XSource, YSource, USource, VSource);
toc
% Elapsed time is 1.430153 seconds. (Time taken for the above code)
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 8, 16);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 8, XSource, YSource, USource, VSource);
toc
% Elapsed time is 1.781929 seconds. (Time taken for the above code)
tic
[XSource, YSource, USource, VSource] = ICV_motion_field_detection(videoFrames(:,:,:,2), videoFrames(:,:,:,3), 8, 32);
predicted_image = ICV_predicted_image(videoFrames(:,:,:,2), 8, XSource, YSource, USource, VSource);
toc
% Elapsed time is 3.281719 seconds. (Time taken for the above code)

%Question 4e

% against variation of block size
Y1 = [4.023469, 1.740996, 0.880320];
X1 = [4, 8, 16];
plot(X1,Y1);

% against variation of search window
Y2 = [1.430153, 1.781929, 3.281719];
X2 = [8, 16, 32];
plot(X2, Y2);

% =====================================================================================================================
% =====================================================================================================================

% Question 5

vid_obj = VideoReader('DatasetC.mpg');
videoFrames = read(vid_obj);

[row, col, channel, nframe]= size(videoFrames);

% Question 5a
for i = 1: nframe
    diff_image(:,:,1,i) = ICV_frame_difference(videoFrames(:,:,:,1),videoFrames(:,:,:,i),25);
end

% Question 5b
for i = 1: nframe -1
    diff_image(:,:,1,i) = ICV_frame_difference(videoFrames(:,:,:,i),videoFrames(:,:,:,i+1),25);
end
% Question 5c
reference_image = ICV_reference_image(videoFrames);

% Question 5d
  ICV_count_objects(videoFrames);

% =======================================================================================================================
% =======================================================================================================================

% Question 6

%Question 6a

img = imread('face-3.jpg');
[LBP_image, LPB_histogram] = ICV_LBP(img, 100);

%Question 6b
img1 = imread('face-1.jpg');
[LBP_image1, LBP_histograme1] = ICV_LBP(img1, -1);

img2 = imread('car-3.jpg');
[LBP_image2, LBP_histograme2] = ICV_LBP(img2, -1);

% Question 6c
img3 = imread('car-3.jpg');
ICV_LBP_classifier(img3);

% Question 6d
ICV_LBP_classifier(img3,100);

% Question 6e
ICV_LBP_classifier(img3,200);