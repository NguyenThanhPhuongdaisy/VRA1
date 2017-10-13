function varargout = TH3_Q6x(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TH3_Q6x_OpeningFcn, ...
                   'gui_OutputFcn',  @TH3_Q6x_OutputFcn, ...
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

function TH3_Q6x_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = TH3_Q6x_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function nInput_Callback(hObject, eventdata, handles)

function nInput_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)

n = str2double(get(handles.nInput,'string'));
imgTrainAll = loadMNISTImages('train-images.idx3-ubyte');
lblTrainAll = loadMNISTLabels('train-labels.idx1-ubyte');

Mdl = fitcknn(imgTrainAll' , lblTrainAll);

imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
lblTestAll = loadMNISTLabels('t10k-labels.idx1-ubyte');
imgTest = imgTestAll(:, n);
lblPredictTest = predict(Mdl, imgTest');
lblImageTest = lblTestAll(n);

img2D = reshape(imgTest, 28, 28);
imshow(img2D,'Goc',handles.showimage);
strLabelImage = 'Ban dau ';
strLabelImage = [strLabelImage, num2str(lblImageTest), '.'];
strLabelImage = [strLabelImage, ' Du doan: '];
strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];

if(lblPredictTest == lblImageTest)
    strLabelImage = [strLabelImage, ' Nhan dang dung.'];
else
    strLabelImage = [strLabelImage, ' Nhan dang sai.'];
end
set(handles.result,'string',strLabelImage);
