%% 基准结果【两类用地-等面积分配】
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

% 基准结果【两类用地-等比例分配】
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

%% alpha=0.83
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_alpha

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_alpha

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% eta=0.31
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_eta

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_eta

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% kappa=1.5
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_kappa1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_kappa1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% kappa=4
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_kappa2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_kappa2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% sigma=0.55
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_sigma1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_sigma1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% sigma=0.75
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_sigma2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_sigma2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% rho=0.05
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_rho1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_rho1

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

%% rho=0.15
% 1.1所有省份均被允许跨省调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_rho2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_area(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)

% 1.2所有省份均被允许跨省调剂建设用地指标【两类用地-等比例分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_para_rho2

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
psi_sell_value=0.15;
[drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1)
