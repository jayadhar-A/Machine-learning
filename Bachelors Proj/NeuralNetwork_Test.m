function output=NeuralNetwork_Test(theta,testData)
    x1=testData(:,1);
    x2=testData(:,2);
    x3=testData(:,3);
    x4=testData(:,4);
    x5=testData(:,5);
    rows=size(testData,1);
    k=1;
    output=zeros(rows,1);
    for i=1:rows
            net_a=theta(1)*x1(i)+theta(2)*x2(i)+theta(3)*x3(i)+theta(4)*x4(i)+theta(5)*x5(i);
            net_b=theta(6)*x1(i)+theta(7)*x2(i)+theta(8)*x3(i)+theta(9)*x4(i)+theta(10)*x5(i);
            net_c=theta(11)*x1(i)+theta(12)*x2(i)+theta(13)*x3(i)+theta(14)*x4(i)+theta(15)*x5(i);
            net_d=theta(16)*x1(i)+theta(17)*x2(i)+theta(18)*x3(i)+theta(19)*x4(i)+theta(20)*x5(i);
            net_e=theta(21)*x1(i)+theta(22)*x2(i)+theta(23)*x3(i)+theta(24)*x4(i)+theta(25)*x5(i);
            net_f=theta(26)*x1(i)+theta(27)*x2(i)+theta(28)*x3(i)+theta(29)*x4(i)+theta(30)*x5(i);
            net_g=theta(31)*x1(i)+theta(32)*x2(i)+theta(33)*x3(i)+theta(34)*x4(i)+theta(35)*x5(i);
            out_a=sigmoid(net_a);
            out_b=sigmoid(net_b);
            out_c=sigmoid(net_c);
            out_d=sigmoid(net_d);
            out_e=sigmoid(net_e);
            out_f=sigmoid(net_f);
            out_g=sigmoid(net_g);
            net_o=theta(36)*out_a+theta(37)*out_b+theta(38)*out_c+theta(39)*out_d+theta(40)*out_e+theta(41)*out_f+theta(42)*out_g;
            out_o=sigmoid(net_o);
            if out_o>=0.5
                output(k,1)=1;
           else
                output(k,1)=0;
            end
            k=k+1;
            %output(k,1)=out_o;
    end
end