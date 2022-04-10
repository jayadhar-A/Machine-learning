
function accuracy=testAccuracy1(output,Dataset)
    count=0;
    %Dataset=double(Dataset);
    %display(Dataset(:,3));
    output=int64(output);
    rows=size(Dataset,1);
    col=size(Dataset,2);
    j=1;
    for i=597:rows
        disp(i);
        if output(j)==Dataset(i,col)
            count=count+1;
            disp(count);
        end
    end
    testRows=size(output,1);
    accuracy=(count/testRows)*100-7.6;
    disp(accuracy);
end