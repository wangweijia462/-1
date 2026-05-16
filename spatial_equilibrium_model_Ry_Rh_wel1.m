function [Wel,DWel,DrealGDP,DGini_GDP,DTheil_Wel] = spatial_equilibrium_model_Ry_Rh_wel1(psi_sell_ry,psi_buy_ry,psi_sell_rh,psi_buy_rh,prov_code,m_od_17,TS_2017,r_o,r_2017,Ry_2017,Rh_2017,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh)
data = readtable('data#地级市_2017.csv');
prov_code = data.prov_code;
TS_2017 = data.TS_2017;
Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
% Ry调剂
% 调出方
unique_prov_ry = unique(prov_code);
for i = 1:length(unique_prov_ry)
    idx_ry = prov_code == unique_prov_ry(i); 
    tar_ry_2017_values = tar_ry_2017(idx_ry);
    idx_ry_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell_values_ry = psi_sell_ry(idx_ry);
    TS_2017_values_ry = TS_2017(idx_ry);
    TS_total_2017_ry(i) = sum(psi_sell_values_ry(abs(idx_ry_o),:).*TS_2017_values_ry(abs(idx_ry_o),:));
    Ry_values_ry = Ry(idx_ry); 
    Ry_2017_values_ry = Ry_2017(idx_ry);
    F_values_ry = F(idx_ry);
    Ry_values_ry(abs(idx_ry_o),:) = Ry_2017_values_ry(abs(idx_ry_o),:)-psi_sell_values_ry(abs(idx_ry_o),:).*TS_2017_values_ry(abs(idx_ry_o),:);
    F_values_ry(abs(idx_ry_o),:) = r_o.*TS_2017_values_ry(abs(idx_ry_o),:);
    Ry(idx_ry) = Ry_values_ry; 
    F(idx_ry) = F_values_ry;
end
TS_total_2017_China_ry = sum(TS_total_2017_ry);
% 调入方
% 调入方
unique_prov = unique(prov_code);
total_demand_ry = sum(psi_buy_ry(tar_ry_2017 > 0)); 
if total_demand_ry > 0 && TS_total_2017_China_ry > 0
    scaling_factor_ry = TS_total_2017_China_ry / total_demand_ry;
    psi_buy_scaled_ry = psi_buy_ry * scaling_factor_ry; 
else
    psi_buy_scaled_ry = zeros(size(psi_buy_ry)); 
end
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i);
    tar_ry_2017_values = tar_ry_2017(idx);
    idx_d = find(tar_ry_2017_values(:,1) > 0); 
    if ~isempty(idx_d)
        psi_buy_values_current = psi_buy_scaled_ry(idx); 
        Ry_values = Ry(idx);
        Ry_2017_values = Ry_2017(idx);
        F_values = F(idx);
        r_2017_values = r_2017(idx);
        Ry_values(idx_d) = Ry_2017_values(idx_d) + psi_buy_values_current(idx_d);
        F_values(idx_d) = (-1) .* r_2017_values(idx_d) .* psi_buy_values_current(idx_d);
        Ry(idx) = Ry_values;
        F(idx) = F_values;
    end
end
% Rh调剂
unique_prov_rh = unique(prov_code);
for i = 1:length(unique_prov_rh)
    idx_rh = prov_code == unique_prov_rh(i); 
    tar_rh_2017_values = tar_rh_2017(idx_rh);
    idx_rh_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell_values_rh = psi_sell_rh(idx_rh);
    TS_2017_values_rh = TS_2017(idx_rh);
    TS_total_2017_rh(i) = sum(psi_sell_values_rh(abs(idx_rh_o),:).*TS_2017_values_rh(abs(idx_rh_o),:));
    Rh_values_rh = Rh(idx_rh); 
    Rh_2017_values_rh = Rh_2017(idx_rh);
    F_values_rh = F(idx_rh);
    Rh_values_rh(abs(idx_rh_o),:) = Rh_2017_values_rh(abs(idx_rh_o),:)-psi_sell_values_rh(abs(idx_rh_o),:).*TS_2017_values_rh(abs(idx_rh_o),:);
    F_values_rh(abs(idx_rh_o),:) = r_o.*psi_sell_values_rh(abs(idx_rh_o),:).*TS_2017_values_rh(abs(idx_rh_o),:);
    Rh(idx_rh) = Rh_values_rh; 
    F(idx_rh) = F_values_rh;
end
TS_total_2017_China_rh = sum(TS_total_2017_rh);
% Rh调剂
% 调入方
unique_prov = unique(prov_code);
total_demand_rh = sum(psi_buy_rh(tar_rh_2017 > 0)); 
if total_demand_rh > 0 && TS_total_2017_China_rh > 0
    scaling_factor_rh = TS_total_2017_China_rh / total_demand_rh;
    psi_buy_scaled_rh = psi_buy_rh * scaling_factor_rh; 
else
    psi_buy_scaled_rh = zeros(size(psi_buy_rh)); 
end
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i);
    tar_rh_2017_values = tar_rh_2017(idx);
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    if ~isempty(idx_d)
        psi_buy_values_current = psi_buy_scaled_rh(idx); 
        Rh_values = Rh(idx);
        Rh_2017_values = Rh_2017(idx);
        F_values = F(idx);
        r_2017_values = r_2017(idx);
        Rh_values(idx_d) = Rh_2017_values(idx_d) + psi_buy_values_current(idx_d);
        F_values(idx_d) = (-1) .* r_2017_values(idx_d) .* psi_buy_values_current(idx_d);
        Rh(idx) = Rh_values;
        F(idx) = F_values;
    end
end
SolveDelta_2017_optimization
Wel = Wel_new;
DrealGDP = drealGDP;
DGini_GDP = dGini_GDP;
DWel = dWel;
DTheil_Wel = dTheil_Wel;
end