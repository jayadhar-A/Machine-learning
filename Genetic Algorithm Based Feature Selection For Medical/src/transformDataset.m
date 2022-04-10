
function [Dataset,trainingDataset,testDataset]=transformDataset()
    originalDataset=xlsread('project.xls');
    output=int64(originalDataset(:,size(originalDataset,2)));
    Dataset=zeros(size(originalDataset,1),6);
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
        Dataset(i,6)=output(i);
    end
    for i=1:500
        trainingDataset(i,1)=Dataset(i,1);
        trainingDataset(i,2)=Dataset(i,2);
        trainingDataset(i,3)=Dataset(i,3);
        trainingDataset(i,4)=Dataset(i,4);
        trainingDataset(i,5)=Dataset(i,5);
        trainingDataset(i,6)=Dataset(i,6);
    end
    j=1;
    for i=501:rows
        testDataset(j,1)=Dataset(i,1);
        testDataset(j,2)=Dataset(i,2);
        testDataset(j,3)=Dataset(i,3);
        testDataset(j,4)=Dataset(i,4);
        testDataset(j,5)=Dataset(i,5);
        j=j+1;
    end
end