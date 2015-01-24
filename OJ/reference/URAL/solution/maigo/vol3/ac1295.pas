program ural1295;
var
  n,a:longint;
function tail(b,e:longint):longint;
  var
    t:longint;
  begin
    if e=0 then
      tail:=1
    else begin
      t:=sqr(tail(b,e div 2));
      if odd(e) then tail:=t*b mod 100 else tail:=t mod 100;
    end;
  end;
begin
  read(n);
  a:=1+tail(2,n)+tail(3,n)+tail(4,n);
  if a mod 100=0 then
    writeln(2)
  else if a mod 10=0 then
    writeln(1)
  else
    writeln(0);
end.
