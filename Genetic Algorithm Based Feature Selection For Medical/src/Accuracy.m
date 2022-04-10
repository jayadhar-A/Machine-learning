function accuracy=Accuracy(output,Dataset)
    count=0;
    %Dataset=double(Dataset);
    %display(Dataset(:,3));
    output=int64(output);
    rows=size(Dataset,1);
    j=1;
    for i=501:rows
        if output(j)==Dataset(i,9)
            count=count+1;
        end
    end
    testRows=size(output,1);
    accuracy=(count/testRows)*100;
end