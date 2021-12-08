'''
Prove that HSI color space can have more advantadges than RGB and CMY color spaces
by using an example application by means of an image that you have selected.
'''

x=imread('dog.jpg');
figure,imshow(x),title('RGB dog Image');

% Convert to HSI
hsv_x = rgb2hsv(x);
figure,imshow(hsv_x),title('HSI version of dog Image');

%Change the Hue
h_x = hsv_x(:,:,1);
h_x_new = mod(h_x*1.5,1);  %to make sure range

%Regenerate HSV Image
new_hsv_x = cat(3,h_x_new,hsv_x(:,:,2),hsv_x(:,:,3));

% Convert HSV back to RGB
new_x = hsv2rgb(new_hsv_x);

% Modified hue image
figure,imshow(new_x);title('CMY version of dog Image')
