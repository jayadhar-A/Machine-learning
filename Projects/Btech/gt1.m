function Z = gt1
nVars = 8;
chromosome = gatool2(nVars,20,10,100);
Best_chromosome = chromosome;
nott = find(round(Best_chromosome)==1);
f = length(nott);
M = xlsread('project.xls');
Z = zeros(length(M),f);


for i = 1:f
  Z(:,i) = M(:,nott(i));
end
end