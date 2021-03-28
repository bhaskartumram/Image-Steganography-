

%open cover and message image files 
cover = imread('house.jpg'); 
message = imread('map2.jpg'); 


%display on screen the two images 
figure(1), imshow(cover); title('Original Image (Cover Image)'); 
figure(2), imshow(message); title('Image to Hide (Message Image)'); 


%change to double to work with addition below 
%cover=double(cover); 
%message=double(message); 

cover = imresize(cover, [512 512]);
message = imresize(message, [512 512]);


%imbed = no. of bits of message image to embed in cover image 
imbed=2; 


%shift the message image over (8-imbed) bits to right 
messageshift=uint8(bitshift(message,-(8-imbed))); 


%show the message image with only embed bits on screen 
%shifts LSBs to MSBs 
showmess=uint8(messageshift); 
showmess=bitshift(showmess,8-imbed); 
figure(3),imshow(showmess);title('6 Bit Image to Hide'); 


%now zero out imbed bits in cover image 
coverzero = uint8(cover); 
 
for i=1:imbed 
coverzero=bitset(coverzero,i,0); 
end


%now add message image and cover image
stego = imadd(coverzero,messageshift); 
figure(4),imshow(stego);title('Stego image'); 
imwrite(stego,'embedded.bmp');

