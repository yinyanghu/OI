program ural1346;
var
  a,b,i,f1,f2,u1,u2,d1,d2:longint;
function min(a,b:longint):longint;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(a,b,f2);u2:=1;d2:=1;
  for i:=a+1 to b do begin
    f1:=f2;u1:=u2;d1:=d2;
    read(f2);
    u2:=min(u1+ord(f1>f2),d1+1);
    d2:=min(d1+ord(f1<f2),u1+1);
  end;
  writeln(min(u2,d2));
end.
