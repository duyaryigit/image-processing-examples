'''
a) Consider a color image and add salt and pepper noise. Apply averaging filter; ideal
lowpass filter; Gaussian lowpass filter; median filter to the noisy image and interpret the
obtained results by means of filter performances.

b) Consider a gray scale image and add salt and pepper noise. Apply averaging filter; ideal
lowpass filter; Gaussian lowpass filter; Median filter to the noisy image and interpret the
obtained results by means of filter performances.
'''
% a)

I = imread(‘dogo.jpg’);

A = imnoise(I,’Salt & pepper’,0.1);
 igüre,imshow(A);title(‘IMAGE WITH SALT AND PEPPER NOISE’);
 igüre,imshow(I);title(‘ORIGINAL RGB IMAGE’);
%DEFINE THE WINDOW SIZE MXN
M=3;
N=3;

%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA=padarray(A,[floor(M/2),floor(N/2)]);

B = zeros([size(A,1) size(A,2)]);
med_indx = round((M*N)/2); %MEDIAN INDEX
for i = 1:size(modifyA,1)-(M-1)
    for j = 1:size(modifyA,2)-(N-1)


        temp = modifyA(i:i+(M-1),j:j+(N-1),:);
        %RED,GREEN AND BLUE CHANNELS ARE TRAVERSED SEPARATELY
        for k = 1:3

          tmp = temp(:,:,k);
          B(i,j,k) = median(tmp(:));

        end


    end
end

Iblur1 = imgaussfilt(I,10);

%CONVERT THE IMAGE TO UINT8 FORMAT.
B = uint8(B);
 igüre,imshow(B);
title(‘IMAGE AFTER MEDIAN FILTERING’);

 igüre
imshow(Iblur1)
title(‘GAUSSIAN LOW PASS FILTER’)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b)

img=imread('gandalf.jpg'); % read an image 'gandalf.jpg'
subplot(2,2,1) %plot at 1st position of 22 grid
imshow(img) %display the image
title('Original-image') % add title to original image

img2=rgb2gray(img); %convert the image to gray image
noisy_img = imnoise(img2,'salt & pepper',0.02); %add sal & pepper noise
subplot(2,2,2) %plot at 2nd position of 22 grid
imshow(noisy_img) % show the noisy image
title('Noisy Gandalf image') % add title 'noisy-image' to noisy image

filtered_img=medfilt2(noisy_img,[5 5]); %apply median filter on noisy_img having 55 mask
subplot(2,2,3) %plot at 3rd position of 22 grid
imshow(filtered_img) % show the median filtered image
title('Median filtered Gandalf image') % add title to median filtered image

gauss_filter=fspecial('gaussian',[7 7],0.6); % create a gaussian filter having 77 mask size and sigma 0.6
gauss_filtered_img=imfilter(noisy_img,gauss_filter); %apply gaussian filter on noisy image
subplot(2,2,4) %plot at 4th position of 22 grid
imshow(gauss_filtered_img) %display the gaussain filtered image
title('Gaussian filtered Gandalf image'); % add title to Gaussian filtered image
