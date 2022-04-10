function sigmoid_value=sigmoid(z)
    temp=1+exp(-z);
   
    sigmoid_value=1/temp;
end