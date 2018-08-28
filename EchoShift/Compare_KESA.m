function [ ] = Compare_KESA(hObject,~)
% Push it before two placed points
%   ...
handles = guidata(hObject);

dcm_Obj     = datacursormode(handles.Figure_Obj);
dataInfo    = getCursorInfo(dcm_Obj);

[~,NCursor]     = size(dataInfo);
Maps_KESA       = handles.Figure_Obj.UserData.Maps_KESA;
[~,~,Nkxy]      = size(Maps_KESA);
Lines_KESA      = zeros(NCursor,Nkxy);

for iNCursor = 1:NCursor
    DCursor_Current = dataInfo(iNCursor);
    Pxy             = DCursor_Current.Position;
    Prow            = Pxy(2); 
    Pcol            = Pxy(1);
    
    Line_Current = Maps_KESA(Prow,Pcol,:);
    Line_Current = squeeze(Line_Current)';
    
    Lines_KESA(iNCursor,:) = Line_Current;
    
end

Lines_KESA_grad = gradient(Lines_KESA);

handles.Figure_Obj_KESA             = figure();
handles.Figure_Obj_KESA.Units       = 'pixels';
handles.Figure_Obj_KESA.Position    = [200 200 900 400];

handles.Axes_Obj_KESA           = axes();
handles.Axes_Obj_KESA.Parent    = handles.Figure_Obj_KESA;
handles.Axes_Obj_KESA.Units     = 'pixels';
handles.Axes_Obj_KESA.Position  = [50 50 300 300];
handles.Axes_Obj_KESA.XLim      = [1 Nkxy];

X = 1:Nkxy;
for iNCursor = 1:NCursor
    plot(handles.Axes_Obj_KESA,X,Lines_KESA(iNCursor,:));
    hold on;
end

handles.Axes_Obj_KESA_grad          = axes();
handles.Axes_Obj_KESA_grad.Parent   = handles.Figure_Obj_KESA;
handles.Axes_Obj_KESA_grad.Units    = 'pixels';
handles.Axes_Obj_KESA_grad.Position = [400 50 300 300];
handles.Axes_Obj_KESA_grad.XLim     = [1 Nkxy];

for iNCursor = 1:NCursor
    plot(handles.Axes_Obj_KESA_grad,X,Lines_KESA_grad(iNCursor,:));
    hold on;
end


handles.Figure_Obj.UserData.Lines_KESA = Lines_KESA;

guidata(hObject,handles);

end
