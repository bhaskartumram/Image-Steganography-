 %Create Video with Image Sequence
clear all
clc
%Make the Below path as the Current Folder
cd('C:\Users\bhaskar_tumram\Desktop\hide images\New folder');

%Obtain all the bitmap format files in the current folder
Files = dir('*.bmp');


%Find the total number of bitmap files in the Current Folder
NumFiles= size(Files,1);

%source = uint8(zeros([600 1000 3 NumFiles*5]));



%To write Video File
VideoObj = VideoWriter('Create_Video.avi');
%Number of Frames per Second
VideoObj.FrameRate =125; 
%Define the Video Quality [ 0 to 100 ]
VideoObj.Quality   = 80;  


count=1;

for i = 1 : NumFiles
  
   %Read the Images in the Current Folder one by one using For Loop
   I = imread(Files(i).name);
  
   %The Size of the Images are made same
   ResizeImg = imresize(I,[600 1000]);
  
   %Each Image is copied 5 times so that in a second 1 image can be viewed
   for j = 1 : 5
     source(:,:,:,count)=ResizeImg;
     count = count + 1;
   end
 
end

%Open the File 'Create_Video.avi'
open(VideoObj);


%Write the Images into the File 'Create_Video.avi'
writeVideo(VideoObj, source);


%Close the file 'Create_Video.avi'
close(VideoObj);