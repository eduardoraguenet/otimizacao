function varargout = tela(varargin)
% TELA MATLAB code for tela.fig
%      TELA, by itself, creates a new TELA or raises the existing
%      singleton*.
%
%      H = TELA returns the handle to a new TELA or the handle to
%      the existing singleton*.
%
%      TELA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELA.M with the given input arguments.
%
%      TELA('Property','Value',...) creates a new TELA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tela_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tela_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to rodar (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tela

% Last Modified by GUIDE v2.5 04-Jul-2017 18:36:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tela_OpeningFcn, ...
                   'gui_OutputFcn',  @tela_OutputFcn, ...
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


% --- Executes just before tela is made visible.
function tela_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tela (see VARARGIN)

% Choose default command line output for tela
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tela wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tela_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funcao_Callback(hObject, eventdata, handles)
% hObject    handle to funcao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcao as text
%        str2double(get(hObject,'String')) returns contents of funcao as a double


% --- Executes during object creation, after setting all properties.
function funcao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function intervalo_a_Callback(hObject, eventdata, handles)
% hObject    handle to intervalo_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervalo_a as text
%        str2double(get(hObject,'String')) returns contents of intervalo_a as a double


% --- Executes during object creation, after setting all properties.
function intervalo_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervalo_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delta_Callback(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delta as text
%        str2double(get(hObject,'String')) returns contents of delta as a double


% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rodar.
function rodar_Callback(hObject, eventdata, handles)
% hObject    handle to rodar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f a b delta fmin xmin it t printLog grade

f = get(handles.funcao,'String');
f = str2func(strcat('@(x)',f)); 
a = str2num(get(handles.intervalo_a,'String'));
b = str2num(get(handles.intervalo_b,'String'));
delta = str2num(get(handles.delta,'String'));



%% METODO FIBONACCI %%
if get(handles.fibonacci,'Value')==1    
tic;

x1 = a;
x4 = b;

espacamento_x2=0; %%Vari�veis criadas para evitar que x3 e x2 caem no mesmo ponto=casos patol�gicos descritos na apostila ver pg.43
espacamento_x3=0;
L0 = x4-x1;

f_k = L0/delta;
binet = 0;
j=1; %%C�lculo do numero de itera��es necess�rias baseada na formula de Fibonnci ver pg.44 da apostila
while binet <f_k
    binet = sqrt(5)/5*(((1+sqrt(5))/2)^j-((1-sqrt(5))/2)^j);
    j=j+1; %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Atualizou o j depois de calcular o de binet
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%k = j - 1;
k=j-1;

%%Inicializa��o - L0
p = (1-sqrt(5))/(1+sqrt(5));
alpha = (2/(1+sqrt(5)))*((1-p^k)/(1-p^(k+1)));

x2 = alpha*x1 + (1-alpha)*x4 + espacamento_x2;
f2 = f(x2);
x3 = alpha*x4+(1-alpha)*x1 + espacamento_x3;
f3 = f(x3);


%%Algoritmo geral L1 em diante descrita na p�gina 43
for i=1:(k-1)
    if f2<f3       
    L1 = x3-x1;
    alpha = (L0-L1)/L1;
    
    Log{i,1} = i;
    Log{i,2} = x1;
    Log{i,3} = x3;
    Log{i,4} = L1;
    Log{i,5} = f(x1);
    Log{i,6} = f(x3);
    
    x4=x3;
    L0 = x4-x1;
    x2 = alpha*x1 + (1-alpha)*x4+espacamento_x2;
    f2 = f(x2);
    x3 = alpha*x4+(1-alpha)*x1+espacamento_x3;
    f3 = f(x3);
else   
    L1 = x4-x2;
    alpha = (L0-L1)/L1;
    Log{i,1} = i;
    Log{i,2} = x2;
    Log{i,3} = x4;
    Log{i,4} = L1;
    Log{i,5} = f(x2);
    Log{i,6} = f(x4);
    
    x1 = x2;
    L0 = x4-x1;
    x2 = alpha*x1 + (1-alpha)*x4;
    f2 =f(x2);
    x3 = alpha*x4+(1-alpha)*x1;
    f3 = f(x3);
    end
end

if f2<f3
%     Log{k,1} = k;
%     Log{k,2} = x1;
%     Log{k,3} = x3;
%     Log{k,4} = L1;
%     Log{k,5} = f(x1);
%     Log{k,6} = f(x3);
    xmin = x2;
    fmin = f2;
else
%     Log{k,1} = k;
%     Log{k,2} = x2;
%     Log{k,3} = x4;
%     Log{k,4} = L1;
%     Log{k,5} = f(x2);
%     Log{k,6} = f(x4);
    xmin = x3;
    fmin = f3;   
end
it = i;
t = toc;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% METODO PROPORCAO AUREA %%
if get(handles.aurea,'Value')==1
     x1 = a;  %Ponto "a" = Mais afastado � esquerda do intervalo escolhido
     x4 = b;
 % Ponto "b" = Mais afastado � direita do intervalo escolhido
        
espacamento_x2=0; %%Vari�veis criadas para evitar que x3 e x2 caem no mesmo ponto=casos patol�gicos descritos na apostila ver pg.43
espacamento_x3=0;
delta = 0.01; %Erro tolerado

%%Inicializa��o - L0

u = (sqrt(5)-1)/2;

x2 = u*x1 + (1-u)*x4 + espacamento_x2;
f2 = f(x2);
x3 = u*x4+(1-u)*x1 + espacamento_x3;
f3 = f(x3);

%%Algoritmo geral L1 em diante descrita na p�gina 43
L1 = delta+1;
it = 0;
while L1>delta
    if f2<f3      
    L1 = x3-x1;
    x4=x3; 
    x3 = x2;
    f3 = f(x3);
    x2 = u*x1 + (1-u)*x4+espacamento_x2;
    f2 = f(x2); 
    it=it+1;
else
    
    L1 = x4-x2;
    x1 = x2; 
    x2 = x3;
    f2 =f(x2);
    x3 = u*x4+(1-u)*x1;
    f3 = f(x3);
    it = it+1;
    end

 if f2<f3
    xmin = x2;
    fmin = f2;
else
    xmin = x3;
    fmin = f3;   
end
   
end


tic;
%AQUI
t = toc;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% METODO INTERPOLACAO POLINOMIAL %%
if get(handles.interpol,'Value')==1
tic;
%AQUI
t = toc;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Atualizando valores da caixa de Resultados %%
set(handles.fminimo, 'String', fmin);
set(handles.xminimo, 'String', xmin);
set(handles.iteracoes, 'String', it);
set(handles.tempo, 'String', t);

%% Plotar %%
[x,y] = fplot(f, [a b]);
plot(x,y,'linewidth',2);
grid on
hold on
if get(handles.plot_pontomin,'Value')==1
    plot(xmin,fmin,'*r')
    hold on
end
if get(handles.plot_intervalos,'Value')==1
    [lin col] = size(Log);
    for i = 1:lin
        plot([Log{i,2} Log{i,2}],get(handles.axes1,'YLim'),'r--')
        plot([Log{i,3} Log{i,3}],get(handles.axes1,'YLim'),'r--')
        hold on
    end
end
hold off



%Reseta lista do log%
printLog = Log;
clear Log;
grade = 1;



% --- Executes on button press in plot_pontomin.
function plot_pontomin_Callback(hObject, eventdata, handles)
% hObject    handle to plot_pontomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_pontomin


% --- Executes on button press in plot_intervalos.
function plot_intervalos_Callback(hObject, eventdata, handles)
% hObject    handle to plot_intervalos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_intervalos


% --- Executes on button press in brent.
function brent_Callback(hObject, eventdata, handles)
% hObject    handle to brent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of brent


% --- Executes on key press with focus on rodar and none of its controls.

% M�TODOS



function intervalo_b_Callback(hObject, eventdata, handles)
% hObject    handle to intervalo_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervalo_b as text
%        str2double(get(hObject,'String')) returns contents of intervalo_b as a double


% --- Executes during object creation, after setting all properties.
function intervalo_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervalo_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botao_logxlsx.
function botao_logxlsx_Callback(hObject, eventdata, handles)
% hObject    handle to botao_logxlsx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global printLog
filename = 'log.xlsx';
writetable(tabela(printLog,get(handles.fibonacci,'Value'),get(handles.aurea,'Value'),get(handles.interpol,'Value')),filename,'Sheet',1,'Range','A1')
winopen log.xlsx

% --- Executes on button press in botao_logtxt.
function botao_logtxt_Callback(hObject, eventdata, handles)
% hObject    handle to botao_logtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global printLog
filename = 'log.txt';
writetable(tabela(printLog,get(handles.fibonacci,'Value'),get(handles.aurea,'Value'),get(handles.interpol,'Value')),filename,'Delimiter', ' ')
winopen log.txt

function TLog = tabela(printLog, fib, aurea, interpol)
if fib==1 
    TLog = cell2table(printLog,'VariableNames',{'Iteracao','x1','x2','Delta_x','Fx1','Fx2'});
end
if aurea==1 
%Cria tabela
end
if interpol==1 
%Cria tabela
end


% --- Executes on button press in Grid_on_off.
function Grid_on_off_Callback(hObject, eventdata, handles)
% hObject    handle to Grid_on_off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grade
if grade == 1
    grid off
    grade = 0;
else
    grid on
    grade = 1;
end

