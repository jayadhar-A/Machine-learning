function thyroid(handles)

a = str2double(get(handles.edit31,'string'));
b = str2double(get(handles.edit30,'string'));
c = str2double(get(handles.edit29,'string'));
d = str2double(get(handles.edit28,'string'));
e = str2double(get(handles.edit27,'string'));
f = str2double(get(handles.edit26,'string'));
g = str2double(get(handles.edit25,'string'));
h = str2double(get(handles.edit24,'string'));
i = str2double(get(handles.edit23,'string'));
j = str2double(get(handles.edit22,'string'));
t = str2double(get(handles.edit21,'string'));
l = str2double(get(handles.edit9,'string'));
m = str2double(get(handles.edit8,'string'));
theta=xlsread('thy_theta1.xls');
net=zeros(8,1);
out=zeros(8,1);
for k = 1:7
    net(k,1) = theta((k-1)*13+1,1)*a+theta((k-1)*13+2,1)*b+theta((k-1)*13+3,1)*c+theta((k-1)*13+4,1)*d+theta((k-1)*13+5,1)*e+theta((k-1)*13+6,1)*f+theta((k-1)*13+7,1)*g+theta((k-1)*13+8,1)*h+theta((k-1)*13+9,1)*i+theta((k-1)*13+10,1)*j+theta((k-1)*13+11,1)*t+theta((k-1)*13+12,1)*l+theta((k-1)*13+13,1)*m;
end
for k=1:7
    out(k,1)=sigmoid(net(k,1));
end
net(8,1)=theta(36,1)*out(1,1)+theta(37,1)*out(2,1)+theta(38,1)*out(3,1)+theta(39,1)*out(4,1)+theta(40,1)*out(5,1)+theta(41,1)*out(6,1)+theta(42,1)*out(7,1);
out(8,1)=sigmoid(net(8,1));
disp(out(8,1));
if out(8,1)>=0.5
     disp('yes');
else
    disp('no');
end
end
