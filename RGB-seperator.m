'''
Determine a simple RGB image that you have selected.
a) Display the original image that you have selected.
b) Display the separate images for each color planes (each color plane image separately for
a RGB image)
'''

clc
clear all

a=imread('kurt.jpg'); % Image read
b=a;
subplot(2,2,1)
imshow(a);
title('RGB original image'); % Original RGB output image

a(:,:,2)=0;
a(:,:,3)=0;
subplot(2,2,2)
imshow(a);
title('Red image'); % Red output image.

a=b;
a(:,:,1)=0;
a(:,:,3)=0;
subplot(2,2,3)
imshow(a);
title('Green image'); % Green output image.

a=b;
a(:,:,1)=0;
a(:,:,2)=0;
subplot(2,2,4)
imshow(a);
title('Blue image'); % Blue output image.
