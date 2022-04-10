
function [Dataset,trainingDataset,testDataset]=newtransform()
    originalDataset=csvread('diabetes.csv');
    output=int64(originalDataset(:,size(originalDataset,2)));
    Dataset=zeros(size(originalDataset,1),8);
    t = size(originalDataset,1)*70/100;
    trainingDataset=zeros(round(t),3);
    testrows=size(originalDataset)-round(t);
    testDataset=zeros(testrows,2);
    rows=size(originalDataset,1);
    for i=1:rows
        Dataset(i,1)=originalDataset(i,2);
        Dataset(i,2)=originalDataset(i,3);
        Dataset(i,3)=originalDataset(i,4);
        Dataset(i,4)=originalDataset(i,5);
        Dataset(i,5)=originalDataset(i,6);
        Dataset(i,6)=originalDataset(i,7);
        Dataset(i,7)=originalDataset(i,8);
        Dataset(i,8)=originalDataset(i,9);
        Dataset(i,9)=output(i);
    end
    for i=1:round(t)
        trainingDataset(i,1)=Dataset(i,1);
        trainingDataset(i,2)=Dataset(i,2);
        trainingDataset(i,3)=Dataset(i,3);
        trainingDataset(i,4)=Dataset(i,4);
        trainingDataset(i,5)=Dataset(i,5);
        trainingDataset(i,6)=Dataset(i,6);
        trainingDataset(i,7)=Dataset(i,7);
        trainingDataset(i,8)=Dataset(i,8);
        trainingDataset(i,9)=Dataset(i,9);
    end
    j=1;
    for i=round(t):rows
        testDataset(j,1)=Dataset(i,1);
        testDataset(j,2)=Dataset(i,2);
        testDataset(j,3)=Dataset(i,3);
        testDataset(j,4)=Dataset(i,4);
        testDataset(j,5)=Dataset(i,5);
        testDataset(j,6)=Dataset(i,6);
        testDataset(j,7)=Dataset(i,7);
        testDataset(j,8)=Dataset(i,8);
        j=j+1;
    end
end