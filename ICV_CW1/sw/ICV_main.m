% Question 1
% 
% Q 1(a) Rotation by theta = 30, 60, 120 and -50 degrees clockwise respectively
image_cw1 = imread('name_cw1.png');
rot_30_img = ICV_rotate(image_cw1, -30);
rot_60_img = ICV_rotate(image_cw1, -60);
rot_120_img = ICV_rotate(image_cw1, -120);
rot_50_cc_img = ICV_rotate(image_cw1, 50);

% Q 1(a) Skew horizontally by theta = 10, 40 and 60 degrees respectively
skew_10_img = ICV_skew(image_cw1, -10);
skew_40_img = ICV_skew(image_cw1, -40);
skew_60_img = ICV_skew(image_cw1, -60);

% Q 1 (b)
rot_20_img = ICV_rotate(image_cw1, -20);
final_img_1 = ICV_skew(rot_20_img,-50);

skew_50_img = ICV_skew(image_cw1, -50);
final_img_2 = ICV_rotate(skew_50_img, -20);

% Question 2

image= imread('face-1.jpg');
kernel_A = [1,2,1;2,4,2;1,2,1];
kernel_B = [0,1,0;1,-4,1;0,1,0];

kernel_A_5 = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
kernel_B_5 = [0 0 1 0 0; 0 0 1 0 0; 1 1 -8 1 1; 0 0 1 0 0;0 0 1 0 0];

kernel_A_7 = [0 0 1 2 1 0 0; 0 3 13 22 13 3 0; 1 13 59 97 59 13 1; 2 22 97 159 97 22 2; 1 13 59 97 59 13 1; 0 3 13 22 13 3 0; 0 0 1 2 1 0 0];
kernel_B_7 = [0 0 0 1 0 0 0;0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 1 1 1 -12 1 1 1; 0 0 0 1 0 0 0;0 0 0 1 0 0 0;0 0 0 1 0 0 0];

img_kernel_1 = ICV_convulation(image,[1,1,1;1,1,1;1,1,1]);

img_kernel_A = ICV_convulation(image,kernel_A);

img_kernel_B = ICV_convulation(image,kernel_B);

img_kernel_AA = ICV_convulation(img_kernel_A,kernel_A);

img_kernel_AB = ICV_convulation(img_kernel_A,kernel_B);

img_kernel_BA = ICV_convulation(img_kernel_B,kernel_A);

img_kernel_A5 = ICV_convulation(image,kernel_A_5);

img_kernel_B5 = ICV_convulation(image,kernel_B_5);

img_kernel_A5A5 = ICV_convulation(img_kernel_A5,kernel_A_5);

img_kernel_A5B5 = ICV_convulation(img_kernel_A5,kernel_B_5);

img_kernel_B5A5 = ICV_convulation(img_kernel_B5,kernel_A_5);

img_kernel_A7 = ICV_convulation(image,kernel_A_7);

img_kernel_B7 = ICV_convulation(image,kernel_B_7);

img_kernel_A7A7 = ICV_convulation(img_kernel_A7,kernel_A_7);

img_kernel_A7B7 = ICV_convulation(img_kernel_A7,kernel_B_7);

img_kernel_B7A7 = ICV_convulation(img_kernel_B7,kernel_A_7);

% Question 3

vid_obj = VideoReader('DatasetB.avi');
videoFrames = read(vid_obj);
vid_frame= videoFrames(:,:,:,300);

imwrite(vid_frame, 'img.png');
ICV_histogram(vid_frame);

vid_frame1 = videoFrames(:,:,:,1);
vid_frame2 = videoFrames(:,:,:,2);

img_intersection1 = ICV_hist_intersection(vid_frame1, vid_frame2, true);
img_intersection2 = ICV_hist_intersection(vid_frame1, vid_frame2, true);