function Theil_out=SolveTheil(Icm,Pop)

sumIcm = sum(Icm);
sumPop = sum(Pop);

propIcm = Icm./sumIcm;
propPop = Pop./sumPop;

Theil = propIcm.*log(propIcm./propPop);

Theil_out = sum(Theil);