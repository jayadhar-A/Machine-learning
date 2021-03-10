function theta=ann1(x,l)
tic
    %p=input layers
    %theta=zeros(1,6);
    p=size(x,2);
    y=x(:,p);
    
    
    out=zeros(l+1,1);
    out=double(out);
    temp=zeros(l,p);
    m=size(x,1);   %number of rows
    iterations=1000;
    alpha=0.1;
    %theta=zeros(56,1);
    theta=randi([-10,10],[(p)*l,1]);
    theta=double(theta);
    for i=1:m
        net=zeros(l+1,1);
        net=double(net);
        for j=1:iterations
            %Forward Propagation Start%
            for k = 1:l
                for c=1:(p-1)
                    net(k,1) = theta((k-1)*(p-2)+c)*x(i,c);
                end
            end
            n=7;
            for k=1:l
                out(k,1)=sigmoid(net(k,1));
            end
            for s=1:l
                net(l+1,1)=net(l+1,1)+theta((k)*(p-1)+s)*out(s,1);
            end
            out(l+1,1)=sigmoid(net(l+1,1));
           
            %Forward Propagation End%
            %Backward Propagation Start%
            for k=1:l
                temp(p,k)=out(k,1)*out(l+1,1)*(1-out(l+1,1))*(out(l+1,1)-y(i));
            end
            for k=1:l
                for t=1:p-1
                    temp(k,t)=x(i,t)*out(k,1)*(1-out(k,1))*(out(l+1,1)-y(i))*out(l+1,1)*(1-out(l+1,1))*theta(n*(p-1)+k);
                end
            end
            for k=1:l
                for t=1:p
                    theta((k-1)*(p-1)+t)=theta((k-1)*(p-1)+t)-(alpha*temp(k,t));
                end
            end
            %Backward Propagation End%
        end
        %forwardPropagation(x1(i),x2(i),y(i));
    end
    toc
end