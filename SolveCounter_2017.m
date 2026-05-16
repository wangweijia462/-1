function Func=SolveCounter_2017(XX,Ry,Rh,tar_ry_2017,tar_rh_2017,A_2017,V_2017,c_od_2017,L_2017,H_2017,Lh_2017,Ph_2017,A_tar_2017,N_2017,F,Pry1,N,alpha,eta,kappa,sigma,rho,Pl_2017,Pry,Prh)

dPl=XX(1:N);
dL=XX(N+1:2*N);
dLh=XX(2*N+1:3*N);

tar_ry_2017_new = ((1-alpha)./alpha).*((dPl.*Pl_2017.*dL.*L_2017)./(Pry1.*Ry))-1;
dtar_ry_2017 = tar_ry_2017_new./tar_ry_2017;
tar_rh_2017_new = ((1-sigma)./sigma).*((dPl.*Pl_2017.*dLh.*Lh_2017)./(Prh.*Rh))-1;
dtar_rh_2017 = tar_rh_2017_new./tar_rh_2017;
Ph_2017_new = ((dPl.*Pl_2017).^sigma).*(((1+tar_rh_2017_new).*Prh).^(1-sigma))/((sigma.^sigma).*((1-sigma).^(1-sigma)));
dPh_2017 = Ph_2017_new./Ph_2017;
V_2017_new = (dPl.*Pl_2017)./(Ph_2017_new.^eta);
dV_2017 = V_2017_new./V_2017;
V_2017_New=repmat(V_2017_new',N,1);
m_od_17_new=(V_2017_New./c_od_2017).^kappa; 
m_od_17_new=m_od_17_new./(sum(m_od_17_new,2)*ones(1,N));
L_2017_new = m_od_17_new'*N_2017;
Lh_2017_new = (H_2017./(Rh.^(1-sigma))).^(1/sigma);
A_2017_new = (((1+tar_ry_2017_new).*Pry.* Ry + (1+tar_rh_2017_new).*Prh.* Rh + F).^rho).*(A_tar_2017.^(1-rho));
dA_2017 = A_2017_new./A_2017;
Pl_2017_new = alpha.*A_2017_new.*((Ry./L_2017_new).^(1-alpha));
R_2017_new = Ry + Rh;
Func = [            
       dPl - Pl_2017_new./Pl_2017;        
       dL - L_2017_new./L_2017; 
       dLh - Lh_2017_new./Lh_2017;
        ];
end