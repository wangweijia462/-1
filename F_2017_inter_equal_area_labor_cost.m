%% 基准结果
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% 1.1省份A
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
row_range = 226:243;  
col_range = 226:243;
c_od_2017(row_range, col_range) = c_od_2017(row_range, col_range) * 0.9;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% 省份B
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
row_range = 248:255; 
col_range = 248:255; 
c_od_2017(row_range, col_range) = c_od_2017(row_range, col_range) * 0.9;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% 省份C
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
row_range = 266:277;  
col_range = 266:277;  
c_od_2017(row_range, col_range) = c_od_2017(row_range, col_range) * 0.9;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% 省份D
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
row_range = 284:285;  
col_range = 284:285;  
c_od_2017(row_range, col_range) = c_od_2017(row_range, col_range) * 0.9;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% 降低跨省流动成本
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;

row_range = [226:243, 248:255, 266:277, 284:285];  
col_range = [226:243, 248:255, 266:277, 284:285];  
c_od_2017(row_range, col_range) = c_od_2017(row_range, col_range) * 0.9;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)
