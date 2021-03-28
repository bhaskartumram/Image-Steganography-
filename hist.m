
 
img1=imread('extract.bmp');
img2=rgb2gray(img1);
subplot(2,2,1);
imshow(img1);
title('extracted message image');
grayImg=mat2gray(img2);
subplot(2,2,2);
imhist(grayImg);
title('Extracted Message image histogram');

