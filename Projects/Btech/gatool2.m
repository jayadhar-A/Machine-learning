function [x,fval,exitflag,output,population,score] = gatool2(nvars,PopulationSize_Data,Generations_Data,StallGenLimit_Data)
options = gaoptimset;
% Modify options setting
options = gaoptimset(options,'PopulationSize', PopulationSize_Data);
options = gaoptimset(options,'Generations', Generations_Data);
options = gaoptimset(options,'StallGenLimit', StallGenLimit_Data);
options = gaoptimset(options,'SelectionFcn', @selectionroulette);
options = gaoptimset(options,'CrossoverFcn', @crossoversinglepoint);
options = gaoptimset(options,'MutationFcn', {  @mutationuniform [] });
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'PlotFcns', { @gaplotbestf });
[x,fval,exitflag,output,population,score] = ...
ga(@ObjFun,nvars,[],[],[],[],[],[],[],[],options);
end
