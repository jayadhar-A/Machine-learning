prompt = 'Enter filename : ';
M = input(prompt,'s');
c = size(M,2);
accuracy = SampleObjFun(M);
prompt = 'Enter Population size = ';
population_size = input(prompt);
new_population = generate_population(population_size,c-1);
prompt = 'Enter no.of iterations = ';
num_generations = input(prompt);
for i = 1:num_generations
    new_population = selection(accuracy,new_population);  
end
fitness = calculate_fitness(new_population,accuracy);
[Val,index] = max(fitness);
best_chromosome = new_population(index,:);
nott = find(best_chromosome == 1);
f = length(nott);
dataset = xlsread('fuzzy.csv');
Z = zeros(length(dataset),f);
for i = 1:f
  Z(:,i) = dataset(:,nott(i));
end
final1(Z);