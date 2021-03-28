function varargout = gui3(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [vararg out{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before gui3 is made visible.
function gui3_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for gui3
handles.output = hObject;
ss=ones(300,400);
axes(handles.axes1);
imshow(ss);
axes(handles.axes2);
imshow(ss);
axes(handles.axes3);
imshow(ss);
axes(handles.axes4);
imshow(ss);
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = gui3_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clc;

[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Select cover image');
I = imread([pathname,filename]);
I = imresize(I,[512,512]);
I2 = imresize(I,[300,400]);
axes(handles.axes1);
imshow(I2);title('Cover Image');
ss=ones(300,400);
axes(handles.axes2);
imshow(ss);
axes(handles.axes3);
imshow(ss);
axes(handles.axes4);
imshow(ss);
handles.ImgData1=I;
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
clc;

[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Select messgage image');
I3 = imread([pathname,filename]);
I4 = imresize(I3,[512,512]);
I5 = imresize(I4,[300,400]);
axes(handles.axes2);
imshow(I5);title('message Image');
handles.ImgData2=I4;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clc;

I6 = handles.ImgData2;
%now processing on messgae image, BITSHIFT
%imbed = no. of bits of message image to embed in cover image 
imbed=2; 

%shift the message image over (8-imbed) bits to right 
messageshift=uint8(bitshift(I6,-(8-imbed))); 

%shifts LSBs to MSBs 
showmess=uint8(messageshift); 
showmess=bitshift(showmess,8-imbed);

I7 = imresize(showmess,[300,400]);
axes(handles.axes3);
imshow(I7);title('message Image');
handles.ImgData4=messageshift;
%handles.ImgData4=showmess;
guidata(hObject,handles);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imbed=2;
I8 = handles.ImgData1;
I9 = handles.ImgData4;
coverzero = uint8(I8);

for i=1:imbed 
coverzero=bitset(coverzero,i,0); 
end

%now add message image and cover image
stego = imadd(coverzero,I9);

stego = imresize(stego,[300,400]);
axes(handles.axes4);
imshow(stego);title('message Image');


handles.ImgData5 = stego;
guidata(hObject,handles);
%imwrite(stego,'embedded.bmp');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
I10 = handles.ImgData5;
imwrite(I10,'embedded.bmp');
