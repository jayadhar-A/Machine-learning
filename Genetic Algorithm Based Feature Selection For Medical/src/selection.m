function population = selection(accuracy,population)
row = length(population);
m1=0;
m2=-1;
m1_index = 0;
m2_index = 0;
fitness = calculate_fitness(population,accuracy);
for i = 1:row
    if(m1<fitness(i))
        m2=m1;
        m2_index = m1_index;
        m1=fitness(i);
        m1_index = i;
    end
end
x = population(m1_index,:);
y = population(m2_index,:);
[y1,y2] = SinglePointCrossover(x,y);
population(m1_index,:) = y1;
population(m2_index,:) = y2;
end