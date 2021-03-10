function dia=ann_dia()

global theta;
net=zeros(8,1);
out=zeros(8,1);
for k = 7:1
    net(k,1) = theta((k-1)*5+1)*x(1,1)+theta((k-1)*5+2)*x(1,2)+theta((k-1)*5+3)*x(1,3)+theta((k-1)*5+4)*x(1,4)+theta((k-1)*5+5)*x(1,5);
end
for k=1:7
    out(k,1)=sigmoid(net(k,1));
end
disp(theta);
net(8,1)=theta(36)*out(1,1)+theta(37)*out(2,1)+theta(38)*out(3,1)+theta(39)*out(4,1)+theta(40)*out(5,1)+theta(41)*out(6,1)+theta(42)*out(7,1);
out(8,1)=sigmoid(net(8,1));
dia=out(8,1);
disp(out(8,1));

fclose(fid);
end