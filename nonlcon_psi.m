function [c,ceq] = nonlcon_psi(beta,XX1,XX2,XX3,XX4)
psi_sell_ry = (beta(1).*XX1 + beta(2).*XX2 + beta(3).*XX3);
psi_buy_ry = (beta(4).*XX1 + beta(5).*XX2 + beta(6).*XX3);
psi_sell_rh = (beta(7).*XX4 + beta(8).*XX2 + beta(9).*XX3);
psi_buy_rh = (beta(10).*XX4 + beta(11).*XX2 + beta(12).*XX3);
   
    c = [];
    c = [c; -psi_sell_ry(:)]; 
    c = [c; psi_sell_ry(:) - 1]; 
    c = [c; -psi_buy_ry(:)]; 
    c = [c; psi_buy_ry(:) - 1];    
    c = [c; -psi_sell_rh(:)]; 
    c = [c; psi_sell_rh(:) - 1]; 
    c = [c; -psi_buy_rh(:)]; 
    c = [c; psi_buy_rh(:) - 1];        
    ceq = [];
end