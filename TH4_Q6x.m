function varargout = TH4_Q6x(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @question6_advance_OpeningFcn, ...
                   'gui_OutputFcn',  @question6_advance_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:}); % Luu y
    
end
% End initialization code - DO NOT EDIT


% --- Executes just before question6_advance is made visible.
function TH4_Q6x_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to question6_advance (see VARARGIN)

% Choose default command line output for question6_advance
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes question6_advance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TH4_Q6x_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nInput_Callback(hObject, eventdata, handles)
% hObject    handle to nInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nInput as text
%        str2double(get(hObject,'String')) returns contents of nInput as a double


% --- Executes during object creation, after setting all properties.
function nInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = str2double(get(handles.nInput,'string'));
    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu \n ');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll);
    
    Mdl = fitcknn(double(imgTrainImagesAll'), lblTrainLabelsAll);
    nTestImgs = size(imgTestImagesAll,2);
    imgTest = imgTestImagesAll(:,n);
    lblPredictTest = predict(Mdl, double(imgTest'));
     figure;
    img2D=reshape(imgTest,112,92);
    imshow(img2D,'Parent',handles.showimage);
    strLabelImage='Frist: ';
    strLabelImage=[strLabelImage,num2str(lblImageTest)]; %Luu y
    strLabelImage=[strLabelImage,'(n=',num2str(n),')','-']; % Thu tu
    strLabelImage=[strLabelImage,'Predict: '];
    strLabelImage=[strLabelImage,num2str(lblPredictTest),'.'];
    if(lblPredictTest==lblImageTest)
        strLabelImage=[strLabelImage,'True '];
    else
        strLabelImage=[strLabelImage,'False '];
    end
    
   set(handles.result,'string',strLabelImage);


