//Written on 6174 -- Mar 22, 2005
program party;
const
  maxbudget=500;
var
  best:array[0..maxbudget]of word;
  budget,parties,i,j,m,fee,fun,t:word;
begin
  repeat
    read(budget,parties);
    if (budget=0) and (parties=0) then halt;
    fillchar(best,sizeof(best),0);m:=0;
    for i:=1 to parties do begin
      read(fee,fun);
      inc(m,fee);if m>budget then m:=budget;
      for j:=m downto fee do begin
        t:=best[j-fee]+fun;
        if t>best[j] then best[j]:=t;
      end;
    end;
    fee:=0;
    for i:=0 to m do
      if best[i]>best[fee] then fee:=i;
    writeln(fee,' ',best[fee]);
  until false;
end.
