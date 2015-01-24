{In fact it's just calculating the GCD of the given numbers}
program ural1053;
var
  n,i:integer;
  a,b:longint;
function gcd(a,b:longint):longint;
  var
    t:longint;
  begin
    if a<b then begin t:=a;a:=b;b:=t;end;
    while b>0 do begin
      a:=a mod b;t:=a;a:=b;b:=t;
    end;
    gcd:=a;
  end;
begin
  read(n,a);
  for i:=2 to n do begin
    if a=1 then break;
    read(b);
    a:=gcd(a,b);
  end;
  writeln(a);
end.
