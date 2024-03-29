function varargout = robotGUI(varargin)
% ROBOTGUI M-file for robotGUI.fig
%      ROBOTGUI, by itself, creates a new ROBOTGUI or raises the existing
%      singleton*.
%
%      H = ROBOTGUI returns the handle to a new ROBOTGUI or the handle to
%      the existing singleton*.
%
%      ROBOTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTGUI.M with the given input arguments.
%
%      ROBOTGUI('Property','Value',...) creates a new ROBOTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robotGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robotGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robotGUI

% Last Modified by GUIDE v2.5 27-Nov-2009 12:27:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robotGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @robotGUI_OutputFcn, ...
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


% --- Executes just before robotGUI is made visible.
function robotGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robotGUI (see VARARGIN)

% Choose default command line output for robotGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes robotGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create robotic object, plot it, create an environment
<<<<<<< .mine
a = Ex.exploreObject('Some Name');
keyboard
set(gcf,'CurrentAxes',handles.axes1);
plot(rand(5));
%plot(a.robot.r,a.robot.Q); 

camlight; 
keyboard
=======










global a;
global b;
a=Ex.robObject('Some Name');
b=Ex.workspaceObject('Some Name',a);
robotsize=[-0.45,-0.45,0;...
0.45,0.45,0.89];
min_workspace=[-1.6200   -1.6200   -0.0300];
max_workspace=[1.5900    1.5900    2.4900];
>>>>>>> .r119

            %h=figure;
            %display('why are these boxes defined differently i.e. IncludedRegion has a comma between sets while ExcludedRegion has a ;');
obj.OccupancyMap=Context.OccupancyMap('VoxelSize',0.03,...
   'IncludedRegion',[min_workspace , max_workspace],...
   'ExcludedRegion',[robotsize(1,:) ; robotsize(2,:)]);
%just set some surrounding voxels to be Unoccupied
b.OccupancyMap.SetEllipsoidUnoccupied([1,1,1],eye(4));

temp2=b.OccupancyMap.UnoccupiedInsideBox(min_workspace, max_workspace);
axes(handles.axes1); 
plot3(temp2(temp2(:,3)<.7,1),temp2(temp2(:,3)<.7,2),temp2(temp2(:,3)<.7,3),'.b');
handles.h1 = plot(a.r,a.Q,'axis',gcf);camlight;
hold on;
plot3(robotsize(1,1),robotsize(1,2),robotsize(1,3),'r*');
plot3(robotsize(2,1),robotsize(2,2),robotsize(2,3),'r*');
axis equal;view(3);   
set(handles.joint1,'String',a.Q(1));
set(handles.joint2,'String',a.Q(2));
set(handles.joint3,'String',a.Q(3));
set(handles.joint4,'String',a.Q(4));
set(handles.joint5,'String',a.Q(5));
set(handles.joint6,'String',a.Q(6));
rotate3d;            
%set(gcf,'CurrentAxes',handles.axes1);
%plot(a.robot.r,a.robot.Q); 
%guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = robotGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function joint1_Callback(hObject, eventdata, handles)
% hObject    handle to joint1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint1 as text
%        str2double(get(hObject,'String')) returns contents of joint1 as a double


% --- Executes during object creation, after setting all properties.
function joint1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function joint2_Callback(hObject, eventdata, handles)
% hObject    handle to joint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint2 as text
%        str2double(get(hObject,'String')) returns contents of joint2 as a double


% --- Executes during object creation, after setting all properties.
function joint2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function joint3_Callback(hObject, eventdata, handles)
% hObject    handle to joint3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint3 as text
%        str2double(get(hObject,'String')) returns contents of joint3 as a double


% --- Executes during object creation, after setting all properties.
function joint3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to joint4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint4 as text
%        str2double(get(hObject,'String')) returns contents of joint4 as a double


% --- Executes during object creation, after setting all properties.
function joint4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function joint5_Callback(hObject, eventdata, handles)
% hObject    handle to joint5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint5 as text
%        str2double(get(hObject,'String')) returns contents of joint5 as a double


% --- Executes during object creation, after setting all properties.
function joint5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function joint6_Callback(hObject, eventdata, handles)
% hObject    handle to joint6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint6 as text
%        str2double(get(hObject,'String')) returns contents of joint6 as a double


% --- Executes during object creation, after setting all properties.
function joint6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to joint6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in moveRobotButton.
function moveRobotButton_Callback(hObject, eventdata, handles)
% hObject    handle to moveRobotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global b;
newQ(1) = str2double(get(handles.joint1,'string'));
newQ(2) = str2double(get(handles.joint2,'string'));
newQ(3) = str2double(get(handles.joint3,'string'));
newQ(4) = str2double(get(handles.joint4,'string'));
newQ(5) = str2double(get(handles.joint5,'string'));
newQ(6) = str2double(get(handles.joint6,'string'));
a.movetonewQ(newQ,b)
try delete(handle.h1);end
axes(handles.axes1); 
handle.h1 = plot(a.r,newQ,'axis',gcf);

% --- Executes on button press in Simulate.
function Simulate_Callback(hObject, eventdata, handles)
% hObject    handle to Simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global b;
newQ(1) = str2double(get(handles.joint1,'string'));
newQ(2) = str2double(get(handles.joint2,'string'));
newQ(3) = str2double(get(handles.joint3,'string'));
newQ(4) = str2double(get(handles.joint4,'string'));
newQ(5) = str2double(get(handles.joint5,'string'));
newQ(6) = str2double(get(handles.joint6,'string'));
a.manual_update_Q(newQ);
try delete(handle.h1);end
axes(handles.axes1); 
handles.h1 = plot(a.r,newQ,'axis',gcf);



% --- Executes on button press in scanCamCapture.
function scanCamCapture_Callback(hObject, eventdata, handles)
global data;
h = actxserver('EyeInHand.ScannerCommand');
if(h.Status)
    error('Scanner is not responding');
end
h.Type = 'TiltingRangeScan';
h.Mode = 'RangeOnly';
h.TiltSpeed = 2.0;
h.Start(30);
filePrefix = ['C:\data\', datestr(now, 30), '_'];
h.TraceTo(filePrefix);

data.currentImage = vid_aq();
try out = imaqfind;stop(out);delete(out);end
imshow(data.currentImage,'parent',handles.axes1);
       
% hObject    handle to scanCamCapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function joint4_Callback(hObject, eventdata, handles)
% hObject    handle to joint4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of joint4 as text
%        str2double(get(hObject,'String')) returns contents of joint4 as a double


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in updateConfig.
function updateConfig_Callback(hObject, eventdata, handles)
% hObject    handle to updateConfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function sweepAngle_Callback(hObject, eventdata, handles)
% hObject    handle to sweepAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sweepAngle as text
%        str2double(get(hObject,'String')) returns contents of sweepAngle as a double


% --- Executes during object creation, after setting all properties.
function sweepAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweepAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
