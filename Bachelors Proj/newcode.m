function theta=newcode(~)
    %theta=zeros(1,6);
    x=xlsread('diabetis.xlsx');
    y=x(:,8);
    net=zeros(8,1);
    out=zeros(8,1);
    temp=zeros(7,8);
    m=size(x,1);   %number of rows
    iterations=1000;
    alpha=0.1;
    %theta=zeros(56,1);
    theta=randi([-10,10],[56,1]);
    theta=double(theta);
    for i=1:m
        for j=1:iterations
            %Forward Propagation Start%
            for k = 1:7
                net(k,1) = theta((k-1)*7+1)*x(i,1)+theta((k-1)*7+2)*x(i,2)+theta((k-1)*7+3)*x(i,3)+theta((k-1)*7+4)*x(i,4)+theta((k-1)*7+5)*x(i,5)+theta((k-1)*7+6)*x(i,6)+theta((k-1)*7+7)*x(i,7);
            end
            for k=1:7
                out(k,1)=sigmoid(net(k,1));
            end
            net(8,1)=theta(50)*out(1,1)+theta(51)*out(2,1)+theta(52)*out(3,1)+theta(53)*out(4,1)+theta(54)*out(5,1)+theta(55)*out(6,1)+theta(56)*out(7,1);
            out(8,1)=sigmoid(net(8,1));
            %Forward Propagation End%
            %Backward Propagation Start%
            for k=1:7
                temp(49+k,1)=out(k,1)*out(8,1)*(1-out(8,1))*(out(8,1)-y(i));
            end
            for k=1:7
                for m=1:7
                    temp(k,m)=x(i,k)*out(k,1)*(1-out(k,1))*(out(8,1)-y(i))*out(8,1)*(1-out(8,1))*theta(49+k);
                end
            end
            for k=1:7
                for m=1:8
                    theta((k-1)*7+m)=theta((k-1)*7+m)-(alpha*temp(k,m));
                end
            end
            %Backward Propagation End%
        end
        %forwardPropagation(x1(i),x2(i),y(i));
    end
end