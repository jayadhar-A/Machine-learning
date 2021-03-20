function population = generate_population(population_size,num_attributes)
p=[];
population=[];
total = pow2(num_attributes);
for i=2:total
    ii=i-1;
    if(ii~=0)
       binary= decimalToBinaryVector(ii,num_attributes);
    end
  p = [p;binary];
end
rng('shuffle');
r = randi(total-1,1,population_size);
l=length(r);
for i=1:l
    population(i,:)=p(r(i),:);
end
end