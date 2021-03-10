function Y = ObjFun(X)

ds= xlsread('fuzzy');
RD = round(ds);
global n;
n = 1;
s = 0;
for i = 1 : 8 
 if RD(n,i) == 0
     s =s+1;
%x = RD(1,1);
%y = RD(1,2);
%z = RD(1,3);
%Y = 20+x.^2 +2*y.^2+z; 
   %Y=sum(X.^2);

 end
end
%n = n+1;
Y = s;
end
