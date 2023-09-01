%we need deploytool to make .exe
function varargout = picture(varargin)
% PICTURE MATLAB code for picture.fig
%      PICTURE, by itself, creates a new PICTURE or raises the existing
%      singleton*.
%
%      H = PICTURE returns the handle to a new PICTURE or the handle to
%      the existing singleton*.
%
%      PICTURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PICTURE.M with the given input arguments.
%
%      PICTURE('Property','Value',...) creates a new PICTURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before picture_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to picture_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help picture

% Last Modified by GUIDE v2.5 14-Aug-2023 19:46:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @picture_OpeningFcn, ...
                   'gui_OutputFcn',  @picture_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before picture is made visible.
function picture_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to picture (see VARARGIN)

% Choose default command line output for picture
handles.output = hObject;
% Update handles structure
%this is for background picture:
guidata(hObject, handles);
ah=axes('unit','normalized','position',[0 0 1 1]);
bg=imread("saved images\ImageLogo.png");
imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
%this is default mode:
global encrystate
global colorstate
global encry
global color
global closesavef
closesavef=0;
encrystate=0;
colorstate=0;
encry=1;
color=1;
set(handles.encyradio,'value',0);
set(handles.colorradio,'value',0);
set(handles.allradio,'value',0);
set(handles.normalradio,'value',1);
set(handles.spec,'visible','off');
set(handles.salt,'visible','off');
set(handles.poss,'visible','off');
set(handles.gaus,'visible','off');
set(handles.text3,'visible','off');
set(handles.colorselect,'visible','off');
set(handles.saveb,'visible','off');
%default picture:
global pice %encypted pic
global picc %colored pic
global pic
global emes %encyption message
global cmes %color message
pic=imread("saved images\default.png");
[pice,emes]=encrypt(pic,encry);
[picc,cmes]=select_color(pic,color);



% UIWAIT makes picture wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = picture_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%D:\work\paid course\beta matlab\codes\assigment 2\photos
    [file,path]=uigetfile();
    global pic %orignal pic
    global pice %encypted pic
    global picc %colored pic
    global encry
    global color
    global emes %encyption message
    global cmes %color message
    picp=strcat(path,file);
    pic=imread(picp);
    %defult mode
    [pice,emes]=encrypt(pic,encry);
    [picc,cmes]=select_color(pic,color);


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global encrystate
global colorstate
global pic %orignal pic
global pice %encypted pic
global picc %colored pic
global emes %encyption message
global cmes %color message
if encrystate==0&&colorstate==0
    figure();
    imshow(pic);
    title("Selected Image");
elseif encrystate==1&&colorstate==0
    figure(); 
    subplot(1,2,1);
    imshow(pic);
    xlabel("Orignal");
    subplot(1,2,2);
    imshow(pice);
    xlabel(emes);
elseif encrystate==0&&colorstate==1
    figure();
    subplot(1,2,1);
    imshow(pic);
    xlabel("Orignal");
    subplot(1,2,2);
    imshow(picc);
    xlabel(cmes); 
elseif encrystate==1&&colorstate==1
    figure();
    subplot(1,3,2);
    imshow(pic);
    xlabel("Orignal");
    subplot(1,3,1);
    imshow(pice);
    xlabel(emes);
    subplot(1,3,3);
    imshow(picc);
    xlabel(cmes);
end


% --- Executes on button press in gaus.
function gaus_Callback(hObject, eventdata, handles)
% hObject    handle to gaus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pice
global pic
global emes %encyption message
global encry
encry=1;
[pice,emes]=encrypt(pic,encry);
% --- Executes on button press in poss.
function poss_Callback(hObject, eventdata, handles)
% hObject    handle to poss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pice
global pic
global emes %encyption message
global encry
encry=2;
[pice,emes]=encrypt(pic,encry);
% --- Executes on button press in salt.
function salt_Callback(hObject, eventdata, handles)
% hObject    handle to salt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pice
global pic
global emes %encyption message
global encry
encry=3;
[pice,emes]=encrypt(pic,encry);
% --- Executes on button press in spec.
function spec_Callback(hObject, eventdata, handles)
% hObject    handle to spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pice
global pic
global emes %encyption message
global encry
encry=4;
[pice,emes]=encrypt(pic,encry);


% --- Executes on button press in encyradio.
function encyradio_Callback(hObject, eventdata, handles)
% hObject    handle to encyradio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of encyradio
global encrystate
global colorstate
encrystate=1;
colorstate=0;
set(handles.encyradio,'value',1);
set(handles.allradio,'value',0);
set(handles.colorradio,'value',0);
set(handles.normalradio,'value',0);
set(handles.spec,'visible','on');
set(handles.salt,'visible','on');
set(handles.poss,'visible','on');
set(handles.gaus,'visible','on');
set(handles.text3,'visible','on');
set(handles.colorselect,'visible','off');
set(handles.saveb,'visible','on');

% --- Executes on button press in allradio.
function allradio_Callback(hObject, eventdata, handles)
% hObject    handle to allradio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of allradio
set(handles.encyradio,'value',0);
set(handles.colorradio,'value',0);
set(handles.allradio,'value',1);
set(handles.normalradio,'value',0);
global encrystate
global colorstate
encrystate=1;
colorstate=1;
set(handles.spec,'visible','on');
set(handles.salt,'visible','on');
set(handles.poss,'visible','on');
set(handles.gaus,'visible','on');
set(handles.text3,'visible','on');
set(handles.colorselect,'visible','on');
set(handles.saveb,'visible','off');


% --- Executes on button press in colorradio.
function colorradio_Callback(hObject, eventdata, handles)
% hObject    handle to colorradio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of colorradio
global encrystate
global colorstate
encrystate=0;
colorstate=1;
set(handles.encyradio,'value',0);
set(handles.colorradio,'value',1);
set(handles.allradio,'value',0);
set(handles.normalradio,'value',0);
set(handles.spec,'visible','off');
set(handles.salt,'visible','off');
set(handles.poss,'visible','off');
set(handles.gaus,'visible','off');
set(handles.text3,'visible','off');
set(handles.colorselect,'visible','on');
set(handles.saveb,'visible','on');


% --- Executes on selection change in colorselect.
function colorselect_Callback(hObject, eventdata, handles)
% hObject    handle to colorselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns colorselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colorselect
global pic %orignal pic
global picc %colored pic
global cmes %color message
global color
color=get(hObject,'Value')-1; %because the first one is color in the menu
[picc,cmes]=select_color(pic,color);

% --- Executes during object creation, after setting all properties.
function colorselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colorselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in normalradio.
function normalradio_Callback(hObject, eventdata, handles)
% hObject    handle to normalradio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of normalradio
global encrystate
global colorstate
encrystate=0;
colorstate=0;
set(handles.encyradio,'value',0);
set(handles.colorradio,'value',0);
set(handles.allradio,'value',0);
set(handles.normalradio,'value',1);
set(handles.spec,'visible','off');
set(handles.salt,'visible','off');
set(handles.poss,'visible','off');
set(handles.gaus,'visible','off');
set(handles.text3,'visible','off');
set(handles.colorselect,'visible','off');
set(handles.saveb,'visible','off');


% --- Executes on button press in saveb.
function saveb_Callback(hObject, eventdata, handles)
% hObject    handle to saveb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global encrystate
global pice
global picc %colored pic
global savedfile
global closesavef
pics=pice; %the saved image
msgbox("Choose the path to save the image","Attention");
pause(3);
path=uigetdir();
savefigure=openfig("saveimage.fig");
while closesavef==0
    %to delay
    pause(0.5);
end
close(savefigure);
savedfilep=path+"\"+savedfile; %file path
if encrystate==1
    imwrite(pice,savedfilep);
else
    imwrite(picc,savedfilep);
    pics=picc;
end
msgbox("The image is saved","Message");
pause(3);
figure();
imshow(pics);
 xlabel("The saved image");
 
 
