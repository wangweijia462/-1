function Func=SolveCounter_2009(XX,Ry,Rh,tar_ry_2009,tar_rh_2009,A_2009,V_2009,c_od_2009,L_2009,H_2009,Lh_2009,Ph_2009,A_tar_2009,N_2009,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2009,Pry,Prh)

dPl=XX(1:N);
dL=XX(N+1:2*N);
dLh=XX(2*N+1:3*N);

tar_ry_2009_new = ((1-alpha)./alpha).*((dPl.*Pl_2009.*dL.*L_2009)./(Pry1.*Ry))-1;
dtar_ry_2009 = tar_ry_2009_new./tar_ry_2009;
tar_rh_2009_new = ((1-sigma)./sigma).*((dPl.*Pl_2009.*dLh.*Lh_2009)./(Prh.*Rh))-1;
dtar_rh_2009 = tar_rh_2009_new./tar_rh_2009;
Ph_2009_new = ((dPl.*Pl_2009).^sigma).*(((1+tar_rh_2009_new).*Prh).^(1-sigma))/((sigma.^sigma).*((1-sigma).^(1-sigma)));
dPh_2009 = Ph_2009_new./Ph_2009;
V_2009_new = (dPl.*Pl_2009)./(Ph_2009_new.^eta);
dV_2009 = V_2009_new./V_2009;
V_2009_New=repmat(V_2009_new',N,1);
m_od_09_new=(V_2009_New./c_od_2009).^kappa; 
m_od_09_new=m_od_09_new./(sum(m_od_09_new,2)*ones(1,N));
L_2009_new = m_od_09_new'*N_2009;
Lh_2009_new = (H_2009./(Rh.^(1-sigma))).^(1/sigma);
A_2009_new = (((1+tar_ry_2009_new).*Pry.* Ry + (1+tar_rh_2009_new).*Prh.* Rh + F).^rho).*(A_tar_2009.^(1-rho));
dA_2009 = A_2009_new./A_2009;
Pl_2009_new = alpha.*A_2009_new.*((Ry./L_2009_new).^(1-alpha));
R_2009_new = Ry + Rh;
Func = [            
       dPl - Pl_2009_new./Pl_2009;        
       dL - L_2009_new./L_2009; 
       dLh - Lh_2009_new./Lh_2009;
        ];
end