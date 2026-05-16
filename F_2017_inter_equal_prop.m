%% counterfactual
% 1.1仅有几个省份被允许跨省调剂建设用地指标【生产性用地-等比例分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
numbers_chu = [23,25,27,28,30];
numbers_ru = [1,2,9,10,11,13,15,19];
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_some_equal_prop(unique_prov,psi_sell_value,numbers_chu,numbers_ru,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)
  
% 1.2所有省份均被允许跨省调剂建设用地指标【生产性用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.3仅有几个省份被允许跨省调剂建设用地指标【居住性用地-等比例分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Ry = Ry_2017;
Rh = Rh_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
numbers_chu = [23,25,27,28,30];
numbers_ru = [1,2,9,10,11,13,15,19];
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Rh_some_equal_prop(unique_prov,psi_sell_value,numbers_chu,numbers_ru,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.4所有省份均被允许跨省调剂建设用地指标【居住性用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Ry = Ry_2017;
Rh = Rh_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.5仅有几个省份被允许跨省调剂建设用地指标【两类用地-等比例分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
numbers_chu = [23,25,27,28,30];
numbers_ru = [1,2,9,10,11,13,15,19];
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_some_equal_prop(unique_prov,psi_sell_value,numbers_chu,numbers_ru,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.6所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)
