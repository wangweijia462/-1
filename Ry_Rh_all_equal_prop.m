function [drealGDP1,dGini_GDP1,dWel1,dTheil_Wel1] = Ry_Rh_all_equal_prop(unique_prov,psi_sell_value,prov_code,TS_2017,Ry_2017,Rh_2017,r_o,r_2017,m_od_17,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh)
% ry调出方
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i);
    tar_ry_2017_values = tar_ry_2017(idx); 
    idx_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell= psi_sell_value;
    TS_2017_values = TS_2017(idx);
    TS_total_2017(i) = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    F_values = F(idx);
    Ry_values(abs(idx_o),:) = Ry_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
TS_total_2017_China = sum(TS_total_2017);
% ry调入方
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i);
    tar_ry_2017_values = tar_ry_2017(idx); 
    idx_d = find(tar_ry_2017_values(:,1) > 0);
    Ry_2017_values = Ry_2017(idx);
    s(i) = sum(Ry_2017_values(abs(idx_d),:));
end
 S = sum(s);
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i); 
    tar_ry_2017_values = tar_ry_2017(idx); 
    idx_d = find(tar_ry_2017_values(:,1) > 0);   
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    proportion(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:) ./ S;
    allocated_amounts(abs(idx_d),:) = TS_total_2017_China .* proportion(abs(idx_d),:);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Ry_values(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:) + allocated_amounts(abs(idx_d),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*allocated_amounts(abs(idx_d),:);
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
% rh调出方
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i); 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell= psi_sell_value;
    TS_2017_values = TS_2017(idx);
    TS_total_2017(i) = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    F_values = F(idx);
    Rh_values(abs(idx_o),:) = Rh_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
TS_total_2017_China = sum(TS_total_2017);
% rh调入方
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i); 
    tar_rh_2017_values = tar_rh_2017(idx);
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    Rh_2017_values = Rh_2017(idx);
    s(i) = sum(Rh_2017_values(abs(idx_d),:));
end
 S = sum(s);
for i = 1:length(unique_prov)
    idx = prov_code == unique_prov(i); 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_d = find(tar_rh_2017_values(:,1) > 0);   
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    proportion(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:) ./ S;
    allocated_amounts(abs(idx_d),:) = TS_total_2017_China .* proportion(abs(idx_d),:);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Rh_values(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:) + allocated_amounts(abs(idx_d),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*allocated_amounts(abs(idx_d),:);
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
SolveDelta_2017
drealGDP1 = drealGDP;
dGini_GDP1 = dGini_GDP ;
dWel1 = dWel;
dTheil_Wel1 = dTheil_Wel;
end