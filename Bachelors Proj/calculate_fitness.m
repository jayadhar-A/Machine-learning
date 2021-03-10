function fitness = calculate_fitness(population,accuracy)
sz = size(population);
row = sz(1);
col = sz(2);
absnt = 0;
prsnt = 0;
fitness = zeros(1,row);
for i = 1:row
    for j = 1:col
        if population(i,j) == 0
            absnt = absnt + 1;
        else
            prsnt = prsnt + 1;
        end
    end
    fitness(i) = accuracy + 0.2*absnt + 0.4*prsnt;
end