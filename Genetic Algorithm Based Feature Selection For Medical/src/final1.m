
function [Dataset,trainingDataset,testDataset]=final1(originalDataset)
    
    output=int64(originalDataset(:,size(originalDataset,2)));
    Dataset=zeros(size(originalDataset,1),size(originalDataset,2));
    t = size(originalDataset,1)*70/100;
    trainingDataset=zeros(round(t),3);
    testrows=size(originalDataset,1)-round(t);
    testDataset=zeros(testrows,2);
    col=size(originalDataset,2);
    rows=size(originalDataset,1);
    for i=1:rows
        for m=1:(col-1)
            Dataset(i,m)=originalDataset(i,m);
        end
        Dataset(i,col)=output(i);
       
    end
    for i=1:round(t)
        for m=1:(col)
            trainingDataset(i,m)=Dataset(i,m);
        end
    end
    j=1;
    for i=round(t):rows
        for m=1:(col-1)
        testDataset(j,m)=Dataset(i,m);
        end
        j=j+1;
    end
    final2(trainingDataset,10,testDataset,Dataset);
end