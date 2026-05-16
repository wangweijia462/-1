function total_Wel = max_wel_objective(beta,XX1,XX2,XX3,XX4,prov_code,m_od_17,TS_2017,r_o,r_2017,Ry_2017,Rh_2017,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh)
psi_sell_ry = (beta(1).*XX1 + beta(2).*XX2 + beta(3).*XX3);
psi_buy_ry = (beta(4).*XX1 + beta(5).*XX2 + beta(6).*XX3);
psi_sell_rh = (beta(7).*XX4 + beta(8).*XX2 + beta(9).*XX3);
psi_buy_rh = (beta(10).*XX4 + beta(11).*XX2 + beta(12).*XX3);   
Wel = spatial_equilibrium_model_Ry_Rh_wel(psi_sell_ry,psi_buy_ry,psi_sell_rh,psi_buy_rh,prov_code,m_od_17,TS_2017,r_o,r_2017,Ry_2017,Rh_2017,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh);
total_Wel = sum(Wel); 
end