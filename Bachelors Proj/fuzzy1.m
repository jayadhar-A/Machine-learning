% program for implementing Triangular membership functions
function y=fuzzy1
M = xlsread('thyroid8523c.xlsx');
y = zeros(length(M),size(M,2)-1);
for i = 1:size(M,2)-1
    x = M(:,i);
    for j = 1:length(x)
        a = min(x);
        b = std(x);
        c = max(x);
        if(find(x(j) <= a | c <= x(j)))
        y(j,i) = 0;
        end
        if(find(a < x(j) & x(j) < b))
           y(j,i) = (x(j)-a)/(b-a);
        end
        if(find(b < x(j) & x(j) < c))
          y(j,i) = (c-x(j))/(c-b);
        end
        if(x(j) == b)
            y(j,i) = 1;
            fprint('%d',y(j,i));
            msgbox('Operation Completed')
        end
    end
end
end