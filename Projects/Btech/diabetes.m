function diabetes(handles)

a = str2double(get(handles.edit1,'string'));
b = str2double(get(handles.edit2,'string'));
c = str2double(get(handles.edit3,'string'));
d = str2double(get(handles.edit4,'string'));
e = str2double(get(handles.edit5,'string'));
theta=xlsread('dia_theta.xls');
net=zeros(8,1);
out=zeros(8,1);
for k = 1:7
    net(k,1) = theta((k-1)*5+1,1)*a+theta((k-1)*5+2,1)*b+theta((k-1)*5+3,1)*c+theta((k-1)*5+4,1)*d+theta((k-1)*5+5,1)*e;
end
for k= 1:7
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
