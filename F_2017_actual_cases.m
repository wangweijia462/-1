%% 反事实counterfactual（分别运行）
% 2017年截面数据反事实
% 1.全部给Ry
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);

% 定义要处理的行号和对应的减少值
rows_reduce = [26,32,103,106,100,105,102,167,165,172,221,217,232,236,242,240,241,229];
reduceValues = [0.412,7.383,263.528,204.680,208.850,33.332,29.845,33.340,13.330,22.330,3.394,3.067,71.573,108.788,91.497,58.917,15.387,18.826];
reduceValues_F = [0.003,0.133,16.998,13.402,14.100,2.250,1.925,1.500,0.600,1.010,0.076,0.069,3.209,4.893,4.115,2.650,0.692,0.847];

Ry(rows_reduce) = Ry(rows_reduce) - reduceValues';
F(rows_reduce) = F(rows_reduce) + reduceValues_F';

% 定义要处理的行号和对应的增加值
rows_add = [25,27,93,94,168,163,212,209,217,231,237,233,226,238];
addValues = [6.856,0.939,698.335,41.900,35.660,22.330,0.758,3.367,2.336,13.674,168.241,20.677,143.570,18.826];
addValues_F = [0.119,0.017,45.845,2.830,1.610,1.010,0.017,0.076,0.053,0.605,7.567,0.930,6.457,0.847];

Ry(rows_add) = Ry(rows_add) + addValues';
F(rows_add) = F(rows_add) - addValues_F';

SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 2.全部给Rh
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);

% 定义要处理的行号和对应的减少值
rows_reduce = [26,32,103,106,100,105,102,167,165,172,221,217,232,236,242,240,241,229];
reduceValues = [0.412,7.383,263.528,204.680,208.850,33.332,29.845,33.340,13.330,22.330,3.394,3.067,71.573,108.788,91.497,58.917,15.387,18.826];
reduceValues_F = [0.003,0.133,16.998,13.402,14.100,2.250,1.925,1.500,0.600,1.010,0.076,0.069,3.209,4.893,4.115,2.650,0.692,0.847];

Rh(rows_reduce) = Rh(rows_reduce) - reduceValues';
F(rows_reduce) = F(rows_reduce) + reduceValues_F';

% 定义要处理的行号和对应的增加值
rows_add = [25,27,93,94,168,163,212,209,217,231,237,233,226,238];
addValues = [6.856,0.939,698.335,41.900,35.660,22.330,0.758,3.367,2.336,13.674,168.241,20.677,143.570,18.826];
addValues_F = [0.119,0.017,45.845,2.830,1.610,1.010,0.017,0.076,0.053,0.605,7.567,0.930,6.457,0.847];

Rh(rows_add) = Rh(rows_add) + addValues';
F(rows_add) = F(rows_add) - addValues_F';

SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 3.各占一半
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);

% 定义要处理的行号和对应的减少值
rows_reduce = [26,32,103,106,100,105,102,167,165,172,221,217,232,236,242,240,241,229];
reduceValues = [0.412,7.383,263.528,204.680,208.850,33.332,29.845,33.340,13.330,22.330,3.394,3.067,71.573,108.788,91.497,58.917,15.387,18.826];
reduceValues_F = [0.003,0.133,16.998,13.402,14.100,2.250,1.925,1.500,0.600,1.010,0.076,0.069,3.209,4.893,4.115,2.650,0.692,0.847];

reduceValues = reduceValues/2;
reduceValues_F = reduceValues_F/2;

Ry(rows_reduce) = Ry(rows_reduce) - reduceValues';
F(rows_reduce) = F(rows_reduce) + reduceValues_F';
Rh(rows_reduce) = Rh(rows_reduce) - reduceValues';
F(rows_reduce) = F(rows_reduce) + reduceValues_F';

% 定义要处理的行号和对应的增加值
rows_add = [25,27,93,94,168,163,212,209,217,231,237,233,226,238];
addValues = [6.856,0.939,698.335,41.900,35.660,22.330,0.758,3.367,2.336,13.674,168.241,20.677,143.570,18.826];
addValues_F = [0.119,0.017,45.845,2.830,1.610,1.010,0.017,0.076,0.053,0.605,7.567,0.930,6.457,0.847];

addValues = addValues/2;
addValues_F = addValues_F/2;

Ry(rows_add) = Ry(rows_add) + addValues';
F(rows_add) = F(rows_add) - addValues_F';
Rh(rows_add) = Rh(rows_add) + addValues';
F(rows_add) = F(rows_add) - addValues_F';

SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)
