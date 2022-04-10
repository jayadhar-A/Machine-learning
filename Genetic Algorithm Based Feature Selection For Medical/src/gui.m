function out=gui(theta,x,l)
p=size(x,2);
net=zeros(l+1,1);
out=zeros(l+1,1);
for k = 1:l
     for c=1:(p-1)
           net(k,1) = theta((k-1)*(p-2)+c)*x(1,c);
     end
end
for k=1:l
     out(k,1)=sigmoid(net(k,1));
end
for s=1:l
     net(l+1,1)=net(l+1,1)+theta((k)*(p-1)+s)*out(s,1);
end
     out(l+1,1)=sigmoid(net(l+1,1));
end