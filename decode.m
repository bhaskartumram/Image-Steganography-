%read embedded image
finimg=imread('embedded.bmp');
imshow(finimg);

%Shift LSBs of embedded image to MSB position
showfinimg=bitshift(finimg,6);

figure(5),imshow(showfinimg);title('After Retrieval');

imwrite(showfinimg,'extract.bmp');
