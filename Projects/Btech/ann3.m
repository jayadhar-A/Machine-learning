function output=ann3(theta,x,l)
    rows=size(x,1);
    
    out=zeros(l+1,1);
    p=size(x,2);
    t=1;
    output=zeros(rows,1);
    for i=1:rows
        net=zeros(l+1,1);
        net=double(net);
            for k = 1:l
                for c=1:(p-1)
                    net(k,1) = theta((k-1)*(p-2)+c)*x(i,c);
                    
                end
            end
            for k=1:l
                out(k,1)=sigmoid(net(k,1));
            end
            for s=1:l
                net(l+1,1)=net(l+1,1)+theta((k)*(p-1)+s)*out(s,1);
            end
            out(l+1,1)=sigmoid(net(l+1,1));
            disp(out(l+1,1));
            if out(l+1,1)>=0.5
                output(t,1)=1;
            else
                output(t,1)=0;
            end
            %output(k,1)=out(l+1,1);
            t=t+1;
    end
end