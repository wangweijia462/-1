%% ================================================================
%% calibration_main.m
%% 主校准与反事实实验运行脚本
%% 对应论文第五—六节
%% 依赖：初始均衡文件 initial_eqm_2017.m 及所有 SolveDelta*.m
%% ================================================================

close all; clear all; clc;
addpath(genpath(fileparts(mfilename('fullpath'))));
addpath(genpath(fullfile(fileparts(mfilename('fullpath')),'..')));

%% ================================================================
%% 第一步：初始均衡校准
%% ================================================================
fprintf('=== 正在运行初始均衡校准 ===\n');
run(fullfile('..','initial_eqm_2017.m'));

%% ================================================================
%% 第二步：扩展参数（债务与库存模块）
%% ================================================================
% 债务参数
r_D    = 0.045;     % 债务利率
s_G    = 0.40;      % 土地收入占公共投入稳态份额
gamma  = 0.08;      % 库存-价格弹性
IS0    = 0.12;      % 稳态库存率
theta  = 0.60;      % 政府土地收益截取比例

% 初始债务（地级市平均债务率约60% GDP）
D_2017 = 0.60 .* Y_2017;

% 初始库存（库存率×住房存量）
IS_2017 = IS0 .* H_2017;

% 财政公共投入代理变量
G_2017 = ((1+tar_ry_2017).*Pry.*Ry_2017 + ...
           (1+tar_rh_2017).*Prh.*Rh_2017) ./ Pg;

fprintf('校准完成：\n');
fprintf('  TFP均值      = %.4f (标准差 %.4f)\n', mean(A_2017),  std(A_2017));
fprintf('  扭曲系数(Ry) 均值 = %.4f\n', mean(tar_ry_2017));
fprintf('  扭曲系数(Rh) 均值 = %.4f\n', mean(tar_rh_2017));
fprintf('  公共投入G    均值 = %.2f 亿元\n', mean(G_2017));
fprintf('  城市数量 N   = %d\n', N);

%% ================================================================
%% 第三步：财政-TFP弹性估计（OLS近似）
%% ================================================================
log_A = log(A_2017);
log_G = log(G_2017);
X_ols = [ones(N,1), log_G];
beta_ols = (X_ols'*X_ols)\(X_ols'*log_A);
rho_ols  = beta_ols(2);
fprintf('\nOLS估计财政-TFP弹性 rho = %.4f（校准值 = %.4f）\n',...
        rho_ols, rho);

%% ================================================================
%% 第四步：七项反事实实验
%% ================================================================
fprintf('\n=== 开始七项反事实实验 ===\n');

results_table = zeros(7, 4);
exp_labels = {
    '实验1：房价下降10%';
    '实验2：土地收入下降30%';
    '实验3：库存增加50%';
    '实验4：跨区域建设用地交易';
    '实验5：房地产税改革';
    '实验6：核心城市人口流入';
    '实验7：收缩城市土地退出'
};

%% ---- 实验1：房价下降10% ----
fprintf('\n[%d/7] %s\n', 1, exp_labels{1});
dq_shock = -0.10;
dPiG     = s_G * dq_shock;            % 土地收入变化
G_new1   = G_2017 .* (1 + dPiG);      % 公共投入更新
A_tar_new1 = (A_2017 ./ G_2017.^rho).^(1/(1-rho));  % 基础TFP不变
% 通过新G计算反事实TFP
A_new1   = A_tar_new1.^(1-rho) .* G_new1.^rho;
% 住房价格下降
Ph_new1  = Ph_2017 .* (1 + dq_shock);
% 财政转移（负向）
F1 = G_new1 - G_2017;
% 求解均衡
Ry = Ry_2017; Rh = Rh_2017; F = F1;
SolveDelta_2017;
results_table(1,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ---- 实验2：土地出让收入下降30% ----
fprintf('\n[%d/7] %s\n', 2, exp_labels{2});
dRev_shock = -0.30;
G_new2 = G_2017 .* (1 + s_G * dRev_shock);
A_new2 = A_tar_2017.^(1-rho) .* G_new2.^rho;
F2     = G_new2 - G_2017;
% 债务压力：政府借债弥补缺口
D_new2 = D_2017 .* (1 + r_D) - G_2017 .* (dRev_shock * s_G);
Ry = Ry_2017; Rh = Rh_2017; F = F2;
SolveDelta_2017;
results_table(2,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ---- 实验3：库存增加50% ----
fprintf('\n[%d/7] %s\n', 3, exp_labels{3});
IS_new3  = IS_2017 .* 1.5;
dq_IS    = -gamma .* (IS_new3 - IS_2017) ./ H_2017;  % 库存→房价压力
dPiG3    = s_G .* dq_IS;
G_new3   = G_2017 .* exp(dPiG3);
F3       = G_new3 - G_2017;
Ry = Ry_2017; Rh = Rh_2017; F = F3;
SolveDelta_2017;
results_table(3,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ---- 实验4：放开建设用地跨区域交易 ----
fprintf('\n[%d/7] %s\n', 4, exp_labels{4});
% 复用现有 Ry_Rh_all_equal_area.m 逻辑
Rh_cf = Rh_2017;
Ry_cf = Ry_2017;
F4    = zeros(N,1);
psi_sell_value = 0.15;
unique_prov_cf = unique(prov_code);
[drealGDP4,dGini_GDP4,dWel4,dTheil_Wel4] = ...
    Ry_Rh_all_equal_area(unique_prov_cf, psi_sell_value, ...
    prov_code, TS_2017, Ry_2017, Rh_2017, r_o, r_2017, m_od_17, ...
    Ry_cf, Rh_cf, tar_ry_2017, tar_rh_2017, A_2017, V_2017, ...
    c_od_2017, L_2017, H_2017, Lh_2017, Ph_2017, A_tar_2017, ...
    N_2017, F4, Pry1, N, alpha, eta, kappa, sigma, rho, ...
    Pl_2017, Pry, Prh);
results_table(4,:) = [drealGDP4, dGini_GDP4, dWel4, dTheil_Wel4];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP4, dGini_GDP4, dWel4, dTheil_Wel4);

%% ---- 实验5：房地产税改革 ----
fprintf('\n[%d/7] %s\n', 5, exp_labels{5});
tau_prop   = 0.01;             % 持有税率1%
Rev_prop5  = tau_prop .* Ph_2017 .* H_2017;   % 房地产税收入
Rev_land5  = G_2017 .* s_G;                    % 当前土地收入
% 以持有税替代土地出让收入（总收入中性）
G_new5 = G_2017 + (Rev_prop5 - Rev_land5) .* 0.80;
% 房地产税通过资本化降低房价（Tiebout效应）
Ph_new5 = Ph_2017 .* (1 - tau_prop);
F5 = G_new5 - G_2017;
Ry = Ry_2017; Rh = Rh_2017; F = F5;
SolveDelta_2017;
results_table(5,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ---- 实验6：核心城市人口流入 ----
fprintf('\n[%d/7] %s\n', 6, exp_labels{6});
% 按TFP排序找前30城市
[~, sort_idx6] = sort(A_2017, 'descend');
top30_idx  = sort_idx6(1:30);
N_2017_new = N_2017;
N_2017_new(top30_idx) = N_2017(top30_idx) .* 1.10;  % +10%人口
% 保持总人口守恒：其余城市等比例减少
total_N    = sum(N_2017);
total_new  = sum(N_2017_new);
non_top    = setdiff(1:N, top30_idx);
N_2017_new(non_top) = N_2017(non_top) .* (total_N/total_new);
F6 = zeros(N,1);
Ry = Ry_2017; Rh = Rh_2017; F = F6;
% 替换迁移人口
N_bak = N_2017;
N_2017 = N_2017_new;  %#ok<NASGU>
SolveDelta_2017;
N_2017 = N_bak;  %#ok<NASGU> % 恢复
results_table(6,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ---- 实验7：收缩城市土地退出 ----
fprintf('\n[%d/7] %s\n', 7, exp_labels{7});
shrink_mask = (tar_ry_2017 < -0.3);           % 严重过剩城市
psi_exit    = 0.30;
Ry_exit7    = psi_exit .* TS_2017 .* shrink_mask;  % 退出用地量
F7_sub      = r_o .* Ry_exit7;                % 中央财政补贴
G_new7      = G_2017 + F7_sub;                % 公共投入补充
Ry7         = Ry_2017 - Ry_exit7;             % 退出后用地
F7 = F7_sub;
Ry = Ry7; Rh = Rh_2017; F = F7;
SolveDelta_2017;
results_table(7,:) = [drealGDP, dGini_GDP, dWel, dTheil_Wel];
fprintf('  dGDP=%.3f%% dGini=%.3f%% dWel=%.3f%% dTheil=%.3f%%\n',...
        drealGDP, dGini_GDP, dWel, dTheil_Wel);

%% ================================================================
%% 第五步：输出结果表格
%% ================================================================
fprintf('\n\n=== 反事实实验结果汇总（Table 2）===\n');
fprintf('%-30s  %8s  %8s  %8s  %8s\n',...
        '实验情景','ΔGDP(%)','ΔGini(%)','ΔWel(%)','ΔTheil(%)');
fprintf('%s\n', repmat('-',1,72));
for e = 1:7
    fprintf('%-30s  %+8.3f  %+8.3f  %+8.3f  %+8.3f\n',...
            exp_labels{e}, results_table(e,1), results_table(e,2),...
            results_table(e,3), results_table(e,4));
end

%% ================================================================
%% 第六步：输出LaTeX格式表格
%% ================================================================
fprintf('\n\n=== LaTeX Table ===\n');
fprintf('\\begin{tabular}{lcccc}\n\\toprule\n');
fprintf('实验情景 & $\\Delta$实际GDP(\\%%) & $\\Delta$GDP基尼(\\%%) & $\\Delta$总福利(\\%%) & $\\Delta$福利泰尔(\\%%) \\\\\n');
fprintf('\\midrule\n');
for e = 1:7
    fprintf('%s & %+.2f & %+.2f & %+.2f & %+.2f \\\\\n',...
            exp_labels{e},...
            results_table(e,1), results_table(e,2),...
            results_table(e,3), results_table(e,4));
end
fprintf('\\bottomrule\n\\end{tabular}\n');

%% ================================================================
%% 第七步：稳健性检验框架
%% ================================================================
fprintf('\n=== 稳健性检验（围绕基准参数±20%%变动）===\n');

param_grid = struct();
param_grid.alpha = [0.55, 0.67, 0.83];
param_grid.eta   = [0.10, 0.13, 0.16];
param_grid.kappa = [2,    3,    4   ];
param_grid.sigma = [0.55, 0.65, 0.75];
param_grid.rho   = [0.08, 0.103,0.13];

% 以实验4（跨区域交易）为代表实验进行稳健性检验
fprintf('  实验4（跨区域交易）稳健性检验：\n');
fprintf('  %-10s  %-10s  %8s  %8s  %8s  %8s\n',...
        '参数','值','ΔGDP(%)','ΔGini(%)','ΔWel(%)','ΔTheil(%)');

param_names = fieldnames(param_grid);
for pi = 1:length(param_names)
    pname = param_names{pi};
    vals  = param_grid.(pname);
    for vi = 1:length(vals)
        % 暂时替换参数
        orig_val = eval(pname);
        eval([pname, ' = ', num2str(vals(vi)), ';']);
        % 重新运行实验4（简化版：仅改参数）
        Ry = Ry_2017; Rh = Rh_2017; F = zeros(N,1);
        try
            [dr,dg,dw,dt] = Ry_Rh_all_equal_area(...
                unique_prov_cf, psi_sell_value, ...
                prov_code, TS_2017, Ry_2017, Rh_2017, r_o, r_2017,...
                m_od_17, Ry, Rh, tar_ry_2017, tar_rh_2017,...
                A_2017, V_2017, c_od_2017, L_2017, H_2017,...
                Lh_2017, Ph_2017, A_tar_2017, N_2017, F,...
                Pry1, N, alpha, eta, kappa, sigma, rho,...
                Pl_2017, Pry, Prh);
            fprintf('  %-10s  %-10.3f  %+8.3f  %+8.3f  %+8.3f  %+8.3f\n',...
                    pname, vals(vi), dr, dg, dw, dt);
        catch
            fprintf('  %-10s  %-10.3f  [求解失败]\n', pname, vals(vi));
        end
        eval([pname, ' = ', num2str(orig_val), ';']);
    end
end

fprintf('\n校准与实验运行完成。\n');
