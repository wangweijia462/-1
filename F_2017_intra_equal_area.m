%% counterfactual
% 1.1仅有几个省份的地级市被允许调剂建设用地指标【生产性用地-等面积分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
province_codes = [51, 53, 62, 63, 65];
mixed_sign_groups = false(size(province_codes));
for i = 1:length(province_codes)
    group = province_codes(i);
    group_rows = (prov_code == group);
    if any(group_rows)
        group_data = tar_ry_2017(group_rows, :);
        has_positive = any(group_data > 0, 'all');
        has_negative = any(group_data < 0, 'all');
        mixed_sign_groups(i) = has_positive & has_negative;
    else
        mixed_sign_groups(i) = false;
    end
end
valid_groups = find(mixed_sign_groups);
for i = valid_groups
    current_prov_code = province_codes(i);
    idx = prov_code == current_prov_code; 
    tar_ry_2017_values = tar_ry_2017(idx); 
    idx_d = find(tar_ry_2017_values(:,1) > 0);
    idx_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Ry_values(abs(idx_o),:) = Ry_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Ry_values(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)
  
% 1.2所有省份的地级市被允许省内调剂建设用地指标【生产性用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
mixed_sign_groups = false(max(prov_code), 1);
for group = unique(prov_code)'
    group_rows = (prov_code == group);
    group_data = tar_ry_2017(group_rows, :);
    has_positive = any(group_data > 0, 'all');
    has_negative = any(group_data < 0, 'all');
    mixed_sign_groups(group) = has_positive & has_negative;
end
valid_groups = find(mixed_sign_groups);
for i = 1:length(valid_groups)
    idx = prov_code == valid_groups(i); 
    tar_ry_2017_values = tar_ry_2017(idx);
    idx_d = find(tar_ry_2017_values(:,1) > 0);
    idx_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Ry_values(abs(idx_o),:) = Ry_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Ry_values(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 1.3仅有几个省份的地级市被允许调剂建设用地指标【居住性用地-等面积分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Ry = Ry_2017;
Rh = Rh_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
province_codes = [51, 53, 62, 63, 65]; 
mixed_sign_groups = false(size(province_codes));
for i = 1:length(province_codes)
    group = province_codes(i);
    group_rows = (prov_code == group);
    if any(group_rows)
        group_data = tar_rh_2017(group_rows, :);
        has_positive = any(group_data > 0, 'all');
        has_negative = any(group_data < 0, 'all');
        mixed_sign_groups(i) = has_positive & has_negative;
    else
        mixed_sign_groups(i) = false;
    end
end
valid_groups = find(mixed_sign_groups);
for i = valid_groups
    current_prov_code = province_codes(i);
    idx = prov_code == current_prov_code; 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    idx_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Rh_values(abs(idx_o),:) = Rh_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Rh_values(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 1.4所有省份的地级市被允许省内调剂建设用地指标【居住性用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Ry = Ry_2017;
Rh = Rh_2017;
F = zeros (N,1);
mixed_sign_groups = false(max(prov_code), 1);
for group = unique(prov_code)'
    group_rows = (prov_code == group);
    group_data = tar_rh_2017(group_rows, :);
    has_positive = any(group_data > 0, 'all');
    has_negative = any(group_data < 0, 'all');
    mixed_sign_groups(group) = has_positive & has_negative;
end
valid_groups = find(mixed_sign_groups);
for i = 1:length(valid_groups)
    idx = prov_code == valid_groups(i); 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    idx_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Rh_values(abs(idx_o),:) = Rh_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Rh_values(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 1.5仅有几个省份的地级市被允许调剂建设用地指标【两类用地-等面积分配】
% 限定在“三区三州”及其他深度贫困县
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
unique_prov = unique(prov_code);
province_codes = [51, 53, 62, 63, 65]; 
% ry
mixed_sign_groups = false(size(province_codes));
for i = 1:length(province_codes)
    group = province_codes(i);
    group_rows = (prov_code == group);
    if any(group_rows)
        group_data = tar_ry_2017(group_rows, :);
        has_positive = any(group_data > 0, 'all');
        has_negative = any(group_data < 0, 'all');
        mixed_sign_groups(i) = has_positive & has_negative;
    else
        mixed_sign_groups(i) = false;
    end
end
valid_groups = find(mixed_sign_groups);
for i = valid_groups
    current_prov_code = province_codes(i);
    idx = prov_code == current_prov_code; 
    tar_ry_2017_values = tar_ry_2017(idx); 
    idx_d = find(tar_ry_2017_values(:,1) > 0);
    idx_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Ry_values(abs(idx_o),:) = Ry_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Ry_values(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
% rh
mixed_sign_groups = false(size(province_codes));
for i = 1:length(province_codes)
    group = province_codes(i);
    group_rows = (prov_code == group);
    if any(group_rows)
        group_data = tar_rh_2017(group_rows, :);
        has_positive = any(group_data > 0, 'all');
        has_negative = any(group_data < 0, 'all');
        mixed_sign_groups(i) = has_positive & has_negative;
    else
        mixed_sign_groups(i) = false;
    end
end
valid_groups = find(mixed_sign_groups);
for i = valid_groups
    current_prov_code = province_codes(i);
    idx = prov_code == current_prov_code; 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    idx_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Rh_values(abs(idx_o),:) = Rh_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Rh_values(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)

% 1.6所有省份的地级市被允许省内调剂建设用地指标【两类用地-等面积分配】
close all
clear all
addpath(genpath(pwd));
initial_eqm_2017

Rh = Rh_2017;
Ry = Ry_2017;
F = zeros (N,1);
% ry
mixed_sign_groups = false(max(prov_code), 1); 
for group = unique(prov_code)'
    group_rows = (prov_code == group);
    group_data = tar_ry_2017(group_rows, :);
    has_positive = any(group_data > 0, 'all');
    has_negative = any(group_data < 0, 'all');
    mixed_sign_groups(group) = has_positive & has_negative;
end
valid_groups = find(mixed_sign_groups);
for i = 1:length(valid_groups)
    idx = prov_code == valid_groups(i); 
    tar_ry_2017_values = tar_ry_2017(idx);
    idx_d = find(tar_ry_2017_values(:,1) > 0);
    idx_o = find(tar_ry_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Ry_values = Ry(idx); 
    Ry_2017_values = Ry_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Ry_values(abs(idx_o),:) = Ry_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Ry_values(abs(idx_d),:) = Ry_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Ry(idx) = Ry_values; 
    F(idx) = F_values;
end
% rh
mixed_sign_groups = false(max(prov_code), 1); 
for group = unique(prov_code)'
    group_rows = (prov_code == group);
    group_data = tar_rh_2017(group_rows, :);
    has_positive = any(group_data > 0, 'all');
    has_negative = any(group_data < 0, 'all');
    mixed_sign_groups(group) = has_positive & has_negative;
end
valid_groups = find(mixed_sign_groups);
for i = 1:length(valid_groups)
    idx = prov_code == valid_groups(i); 
    tar_rh_2017_values = tar_rh_2017(idx); 
    idx_d = find(tar_rh_2017_values(:,1) > 0);
    idx_o = find(tar_rh_2017_values(:,1) < 0);
    psi_sell=0.15;
    TS_2017_values = TS_2017(idx);
    TS_total_2017 = sum(psi_sell.*TS_2017_values(abs(idx_o),:));
    psi_buy=1/length(idx_d);
    Rh_values = Rh(idx); 
    Rh_2017_values = Rh_2017(idx);
    F_values = F(idx);
    r_2017_values = r_2017(idx);
    Rh_values(abs(idx_o),:) = Rh_2017_values(abs(idx_o),:)-psi_sell.*TS_2017_values(abs(idx_o),:);
    Rh_values(abs(idx_d),:) = Rh_2017_values(abs(idx_d),:)+psi_buy*TS_total_2017;
    F_values(abs(idx_o),:) = r_o.*psi_sell.*TS_2017_values(abs(idx_o),:);
    F_values(abs(idx_d),:) = (-1).*r_2017_values(abs(idx_d),:).*psi_buy.*TS_total_2017;
    Rh(idx) = Rh_values; 
    F(idx) = F_values;
end
SolveDelta_2017
sprintf(' drealGDP = %.3f \n dGini_GDP = %.3f \n dWel = %.3f \n dTheil_Wel = %.3f',drealGDP,dGini_GDP,dWel,dTheil_Wel)
