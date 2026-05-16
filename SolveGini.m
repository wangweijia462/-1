function Gini_out=SolveGini(Icm_ipt,Num_ipt)

[Income,index]=sort(Icm_ipt(1:end-1));
Number = Num_ipt(1:end-1);
Number = Number(index);

cumIncome = cumsum(Income.*Number);
cumNumber = cumsum(Number);

cumIncomeUpside = [0;cumIncome(1:end-1)./cumIncome(end)];
cumIncomeDownside = cumIncome./cumIncome(end);
cumNumberHight = Number./cumNumber(end);
AreaB = (cumIncomeUpside+cumIncomeDownside)'*cumNumberHight./2;

Gini_out = (0.5-AreaB)/0.5;