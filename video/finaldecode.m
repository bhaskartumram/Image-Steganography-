

f = VideoReader('Create_Video.avi');

for img = 1:f.NumberOfFrames;
    filename = strcat('extract',num2str(img),'.bmp');
    b = read(f,img);
    imwrite(b, filename);
finimg = imread(filename);
%imshow(finimg);

%Shift LSBs of embedded image to MSB position
showfinimg=bitshift(finimg,6);

%figure(5),imshow(showfinimg);title('After Retrieval');


end