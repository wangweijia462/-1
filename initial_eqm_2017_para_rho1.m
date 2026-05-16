close all
clear all
addpath(genpath(pwd));

% import prefecture-level city data
data = readtable('data#地级市_2017.csv');
v2struct(table2struct(data,'ToScalar',true));
clear data;

% import migration data
m_od_17 = xlsread('migration_2015.xlsx','C291:KA575');
m_od_17 = m_od_17';

% set Parameters
global N alpha eta kappa sigma rho Pg r_o 
N=285; 
alpha=0.67; 
eta=0.13; 
kappa=3; 
sigma=0.65; 
rho=0.05; 
Pg=1;
r_o=525;
Pry=0.39;
Prh=0.62;

% 【检验劳动力市场出清】
global N_2017
N_2017 = xlsread('migration_2015.xlsx','C287:KA287');
N_2017 = N_2017';
N_2017a = sum(repmat(N_2017,1,N).*m_od_17,1);
N_2017a = N_2017a';

%% solve for initial_eqm
A_2017 = Y_2017 ./ (( L_2017.^alpha ).*( Ry_2017.^(1- alpha) ));
Pl_2017 = alpha.*A_2017.*((Ry_2017./L_2017).^(1-alpha));
tar_ry_2017 = ((1-alpha)./alpha).*((Pl_2017.*L_2017)./(Pry1.*Ry_2017))-1;
Lh_2017 = (H_2017./(Rh_2017.^(1-sigma))).^(1/sigma);
tar_rh_2017 = ((1-sigma)./sigma).*((Pl_2017.*Lh_2017)./(Prh.*Rh_2017))-1;
G_2017 = ((1+tar_ry_2017).*Pry.* Ry_2017 + (1+tar_rh_2017).*Prh.* Rh_2017)./Pg;
A_tar_2017 = (A_2017./(G_2017.^ rho)).^(1/(1- rho));
Ph_2017 = ((Pl_2017.^sigma).*(((1+tar_rh_2017).*Prh).^(1-sigma)))/((sigma.^sigma).*((1-sigma).^(1-sigma)));
V_2017 = Pl_2017./(Ph_2017.^eta);
V_o_2017 = repmat(V_2017,1,N);
V_d_2017 = repmat(V_2017',N,1);
c_od_2017 = (m_od_17./repmat(diag(m_od_17),1,N)).^(1/kappa)./(V_d_2017./V_o_2017);
c_od_2017 = 1./c_od_2017;
R_2017 = Ry_2017 + Rh_2017;
XX1 = Ry_2017./L_2017;
XX2 = A_2017;
XX3 = V_2017;
XX4 = Rh_2017./L_2017;
% initial_eqm
Ry = Ry_2017;
Rh = Rh_2017;
F =0;
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

