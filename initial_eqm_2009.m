close all
clear all
addpath(genpath(pwd));

% import prefecture-level city data
data = readtable('data#地级市_2009.csv');
v2struct(table2struct(data,'ToScalar',true));
clear data;

% import migration data
m_od_09 = xlsread('migration_2010.xlsx','C291:KA575');
m_od_09 = m_od_09';

% set Parameters
global N alpha eta kappa sigma rho Pg
N=285; 
alpha=0.67; 
eta=0.13; 
kappa=3; 
sigma=0.65;
rho=0.103; 
Pg=1;
Pry=0.22;
Prh=0.27;

% 【检验劳动力市场出清】
global N_2009
N_2009 = xlsread('migration_2010.xlsx','C287:KA287');
N_2009 = N_2009';
N_2009a = sum(repmat(N_2009,1,N).*m_od_09,1);
N_2009a = N_2009a';

%% solve for initial_eqm
A_2009 = Y_2009 ./ ((L_2009.^alpha ).*(Ry_2009.^(1- alpha) ));
Pl_2009 = alpha.*A_2009.*((Ry_2009./L_2009).^(1-alpha));
tar_ry_2009 = ((1-alpha)./alpha).*((Pl_2009.*L_2009)./(Pry1.*Ry_2009))-1;
Lh_2009 = (H_2009./(Rh_2009.^(1-sigma))).^(1/sigma);
tar_rh_2009 = ((1-sigma)./sigma).*((Pl_2009.*Lh_2009)./(Prh.*Rh_2009))-1;
G_2009 = ((1+tar_ry_2009).*Pry.* Ry_2009 + (1+tar_rh_2009).*Prh.* Rh_2009)./Pg;
A_tar_2009 = (A_2009./(G_2009.^ rho)).^(1/(1- rho));
Ph_2009 = ((Pl_2009.^sigma).*(((1+tar_rh_2009).*Prh).^(1-sigma)))/((sigma.^sigma).*((1-sigma).^(1-sigma)));
V_2009 = Pl_2009./(Ph_2009.^eta);
V_o_2009 = repmat(V_2009,1,N);
V_d_2009 = repmat(V_2009',N,1);
c_od_2009 = (m_od_09./repmat(diag(m_od_09),1,N)).^(1/kappa)./(V_d_2009./V_o_2009);
c_od_2009 = 1./c_od_2009;
R_2009 = Ry_2009 + Rh_2009;
% initial_eqm
Ry = Ry_2009;
Rh = Rh_2009;
F =0;
SolveDelta_2009
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

