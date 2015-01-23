program p276;
var total,s,p,t:longint;
begin
    readln(s,p);
    t:=p-s;
    total:=0;
    if t>=1800 then inc(total);
    if t>=900 then inc(total);
    if t>=300 then inc(total);
    if t>0 then inc(total);
    writeln(total);
end.
