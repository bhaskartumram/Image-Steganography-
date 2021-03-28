aa=VideoReader('Create_Video.avi');   %message video
%cnt=aa.NumberOfFrames;

filename=('targetframe.jpg'); %frame names generation for message video
    
    img = 50;
    c=read(aa,img);
    imwrite(c,filename);
    
    imshow(c);
    
    %shift the message image over (8-imbed) bits to right 
    %imgshift=uint8(c); 
    showmess=bitshift(c,2); 
    figure(3),imshow(showmess);title('6 Bit message Image'); 





    %Shift LSBs of embedded image to MSB position
    %showfinimg=bitshift(finimg,6);

   % figure(5),imshow(showfinimg);title('After Retrieval');
