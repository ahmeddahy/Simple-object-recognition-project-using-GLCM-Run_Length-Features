function varargout = Object_Recognition(varargin)
% OBJECT_RECOGNITION MATLAB code for Object_Recognition.fig
%      OBJECT_RECOGNITION, by itself, creates a new OBJECT_RECOGNITION or raises the existing
%      singleton*.
%
%      H = OBJECT_RECOGNITION returns the handle to a new OBJECT_RECOGNITION or the handle to
%      the existing singleton*.
%
%      OBJECT_RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJECT_RECOGNITION.M with the given input arguments.
%
%      OBJECT_RECOGNITION('Property','Value',...) creates a new OBJECT_RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Object_Recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Object_Recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Object_Recognition

% Last Modified by GUIDE v2.5 23-Dec-2017 18:35:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Object_Recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @Object_Recognition_OutputFcn, ...
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


% --- Executes just before Object_Recognition is made visible.
function Object_Recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Object_Recognition (see VARARGIN)

% Choose default command line output for Object_Recognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Object_Recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Object_Recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnglcm_mknn.
function btnglcm_mknn_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcm_mknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_KNN('Training_Features(GLCM).xls','Testing_Features(GLCM).xls');

% --- Executes on button press in btnglcm_rnn.
function btnglcm_rnn_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcm_rnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_RNN('Training_Features(GLCM).xls','Testing_Features(GLCM).xls');
% --- Executes on button press in btnglcm_svm.
function btnglcm_svm_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcm_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TrainSVMandTest('Training_Features(GLCM).xls','Testing_Features(GLCM).xls');
% --- Executes on button press in btnrl_mknn.
function btnrl_mknn_Callback(hObject, eventdata, handles)
% hObject    handle to btnrl_mknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_KNN('Training_Features(RL).xls','Testing_Features(RL).xls');
% --- Executes on button press in btnrl_rnn.
function btnrl_rnn_Callback(hObject, eventdata, handles)
% hObject    handle to btnrl_rnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_RNN('Training_Features(RL).xls','Testing_Features(RL).xls');
% --- Executes on button press in btnrl_svm.
function btnrl_svm_Callback(hObject, eventdata, handles)
% hObject    handle to btnrl_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TrainSVMandTest('Training_Features(RL).xls','Testing_Features(RL).xls');
% --- Executes on button press in btnglcmrl_mknn.
function btnglcmrl_mknn_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcmrl_mknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_KNN('Training_Features.xls','Testing_Features.xls');
% --- Executes on button press in btnglcmrl_rnn.
function btnglcmrl_rnn_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcmrl_rnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Test_RNN('Training_Features.xls','Testing_Features.xls');
% --- Executes on button press in btnglcmrl_svm.
function btnglcmrl_svm_Callback(hObject, eventdata, handles)
% hObject    handle to btnglcmrl_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TrainSVMandTest('Training_Features.xls','Testing_Features.xls');
% --- Executes on button press in btnoriginal.
function btnoriginal_Callback(hObject, eventdata, handles)
[chosenfile, chosenpath] = uigetfile('*.jpg;*.png', 'Select a video');
  if ~ischar(chosenfile)
    return;   %user canceled dialog
  end
  Path = fullfile(chosenpath, chosenfile);
  handles.Image1 = imread(Path);
  guidata(hObject, handles);
  axes(handles.originalimage);
  imshow(handles.Image1);
% hObject    handle to btnoriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnsegmented.
function btnsegmented_Callback(hObject, eventdata, handles)
[chosenfile, chosenpath] = uigetfile('*.jpg;*.png', 'Select a video');
  if ~ischar(chosenfile)
    return;   %user canceled dialog
  end
  Path = fullfile(chosenpath, chosenfile);
  handles.Image2 = imread(Path);
  guidata(hObject, handles);
  axes(handles.segmentedimage);
  imshow(handles.Image2);
% hObject    handle to btnsegmented (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnreglcmmknn.
function btnreglcmmknn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(GLCM).xls','MKNN');
figure
imshow(img);
% hObject    handle to btnreglcmmknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnrerlmknn.
function btnrerlmknn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(RL).xls','MKNN');
figure
imshow(img);
% hObject    handle to btnrerlmknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in btnreglcmrlmknn.
function btnreglcmrlmknn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features.xls','MKNN');
figure
imshow(img);
% hObject    handle to btnreglcmrlmknn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnreglcmrnn.
function btnreglcmrnn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(GLCM).xls','RNN');
figure
imshow(img);
% hObject    handle to btnreglcmrnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnrerlrnn.
function btnrerlrnn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(RL).xls','RNN');
figure
imshow(img);
% hObject    handle to btnrerlrnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnreglcmrlrnn.
function btnreglcmrlrnn_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features.xls','RNN');
figure
imshow(img);
% hObject    handle to btnreglcmrlrnn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnreglcmsvm.
function btnreglcmsvm_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(GLCM).xls','SVM');
figure
imshow(img);
% hObject    handle to btnreglcmsvm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnrerlsvm.
function btnrerlsvm_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features(RL).xls','SVM');
figure
imshow(img);
% hObject    handle to btnrerlsvm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnreglcmrlsvm.
function btnreglcmrlsvm_Callback(hObject, eventdata, handles)
img=Recognize(handles.Image1,handles.Image2,'Training_Features.xls','SVM');
figure
imshow(img);
% hObject    handle to btnreglcmrlsvm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
