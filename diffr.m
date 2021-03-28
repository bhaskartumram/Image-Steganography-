A = imread('lena.PNG');
B = imread('embedded.bmp');
B = imresize(B,[512 512]);

imshowpair(A,B,'diff')