%% 最大化社会福利
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017_optimization
% optimal
beta0 = [0,0,0,0,0,0,0,0,0,0,0,0];
lb = -Inf(size(beta0));
ub = Inf(size(beta0));
fun = @(beta) -max_wel_objective(beta,XX1,XX2,XX3,XX4,prov_code,m_od_17,r_o,r_2017,TS_2017,Ry_2017,Rh_2017,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
value = fun(beta0);
disp(value);
nonlcon = @(beta) nonlcon_psi(beta,XX1,XX2,XX3,XX4);
options = optimoptions('fmincon','Display','iter','MaxFunctionEvaluations',100000000);
[beta_opt,max_Welfare,exitflag,output] = fmincon(fun,beta0,[],[],[],[],lb,ub,nonlcon,options);% 调用fmincon优化
psi_sell_ry = (beta_opt(1).*XX1 + beta_opt(2).*XX2 + beta_opt(3).*XX3);
psi_buy_ry = (beta_opt(4).*XX1 + beta_opt(5).*XX2 + beta_opt(6).*XX3);
psi_sell_rh = (beta_opt(7).*XX4 + beta_opt(8).*XX2 + beta_opt(9).*XX3);
psi_buy_rh = (beta_opt(10).*XX4 + beta_opt(11).*XX2 + beta_opt(12).*XX3);
[Wel,DWel,DrealGDP,DGini_GDP,DTheil_Wel] = spatial_equilibrium_model_Ry_Rh_wel1(psi_sell_ry,psi_buy_ry,psi_sell_rh,psi_buy_rh,prov_code,m_od_17,TS_2017,r_o,r_2017,Ry_2017,Rh_2017,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',DrealGDP,DGini_GDP,DWel,DTheil_Wel)
