aa=VideoReader('target.mp4');   %message video
cnt=aa.NumberOfFrames;
%N=24;
%writerObj.FrameRate = N;
  %writerObj = VideoWriter('Newembedded.avi');
  %open(writerObj);
for img=1:aa.NumberOfFrames;
 
    filename=strcat('targetframe',num2str(img),'.jpg'); %frame names generation for message video
  
    c=read(aa,img);
    imwrite(c,filename);


 a=VideoReader('test.mp4');   %cover video
        
    filename1=strcat('frame',num2str(img),'.jpg');  %frame name generation for cover video

    b=read(a,img);
    imwrite(b,filename1);
   
    %open cover and message image/frame files 
    index=1;
    
 
    
 
   % disp(fname)
    cover = imread(filename1); 
    

   % disp(flname)
    message = imread(filename); 
    
    %resize both images to 256*256 framesize
    cover = imresize(cover, [512 512]);
    message = imresize(message, [512 512]);

    %imbed = no. of bits of message image to embed in cover image 
    imbed=2; 


    %shift the message image over (8-imbed) bits to right 
    messageshift=uint8(bitshift(message,-(8-imbed))); 

    %shifts LSBs to MSBs 
    showmess=uint8(messageshift); 
    showmess=bitshift(showmess,8-imbed); 

    %now zero out imbed bits in cover image 
    coverzero =uint8(cover); 
 
    for i=1:imbed 
        coverzero=bitset(coverzero,i,0); 
    end


    %now add message image and cover image
    stego = imadd(coverzero,messageshift);
    
    
    saveName = strcat('embedded',num2str(img),'.bmp');
  
    imwrite(stego,saveName);
    


    end
    
    

%close(writerObj);
