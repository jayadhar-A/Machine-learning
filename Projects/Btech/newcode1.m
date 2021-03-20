function output=newcode1(theta,x)
    rows=size(x,1);
    net=zeros(7,1);
    out=zeros(8,1);
    k=1;
    output=zeros(rows,1);
    for i=1:rows
            for k = 1:7
                net(k,1) = theta((k-1)*7+1)*x(i,1)+theta((k-1)*7+2)*x(i,2)+theta((k-1)*7+3)*x(i,3)+theta((k-1)*7+4)*x(i,4)+theta((k-1)*7+5)*x(i,5)+theta((k-1)*7+6)*x(i,6)+theta((k-1)*7+7)*x(i,7);
            end
            for k=1:7
                out(k,1)=sigmoid(net(k,1));
            end
            net(8,1)=theta(50)*out(1,1)+theta(51)*out(2,1)+theta(52)*out(3,1)+theta(53)*out(4,1)+theta(54)*out(5,1)+theta(55)*out(6,1)+theta(56)*out(7,1);
            out(8,1)=sigmoid(net(8,1));
            %if out(8,1)>=0.5
              %  output(k,1)=1;
           %else
             %   output(k,1)=0;
            %end
            output(k,1)=out(8,1);
            k=k+1;
    end
end