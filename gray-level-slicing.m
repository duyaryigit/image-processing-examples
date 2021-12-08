'''
Explain the gray-level slicing process and apply its two methods to a gray scale image that
you have selected and display the output images for both of them.
'''


x=imread('legolas.jpg'); % Image read
y=x; % First gray level slicing
[w h]=size(x);
for i=1:w
 for j=1:h
 if x(i,j)>=100 && x(i,j)<=200 y(i,j)=255;
 else y(i,j)=0;
 end
 end
end
figure, imshow(x);
figure, imshow(y);

x=imread('legolas.jpg');
y=x; % Second gray level slicing
[w h]=size(x);
for i=1:w
 for j=1:h
 if x(i,j)>=100 && x(i,j)<=200 y(i,j)=255;
 else y(i,j)=x(i,j);
 end
 end
end
figure, imshow(x);
figure, imshow(y);
